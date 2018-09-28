package com.kh.MasterPiece.prdOrder.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.prdOrder.model.dao.PrdOrderDao;
import com.kh.MasterPiece.prdOrder.model.vo.PrdOrder;
import static com.kh.MasterPiece.common.JDBCTemplate.*;

public class PrdOrderService
{

	public ArrayList<PrdOrder> selectPrdOrder(String userId)
	{
		Connection conn = getConnection();
		ArrayList<PrdOrder> list = new PrdOrderDao().selectPrdOrder(conn, userId);
		
		close(conn);
		
		return list;
	}

	public HashMap<String, Attachment> imageList()
	{
		Connection conn = getConnection();
		
		HashMap<String, Attachment> imageList = new PrdOrderDao().imageList(conn);
		
		close(conn);
		
		return imageList;
	}
}
