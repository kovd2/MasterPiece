package com.kh.MasterPiece.serviceCenter.model.service;

import static com.kh.MasterPiece.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.MasterPiece.serviceCenter.model.dao.AfterServiceDao;
import com.kh.MasterPiece.serviceCenter.model.vo.AfterService;

public class AfterServiceService
{

	public int insertAfterService(AfterService as)
	{
		Connection conn = getConnection();
		
		int result = new AfterServiceDao().insertAfterService(conn, as);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<AfterService> selectAfterServiceList()
	{
		Connection conn = getConnection();
		ArrayList<AfterService> list = new AfterServiceDao().selectAfterServiceList(conn);
		
		close(conn);
		
		return list;
	}

	public AfterService selectServiceCenterExchangeOne(int serviceNo)
	{
		Connection conn = getConnection();
		
		AfterService af = new AfterServiceDao().selectServiceCenterExchangeOne(conn, serviceNo);
		
		close(conn);
		
		return af;
	}
}
