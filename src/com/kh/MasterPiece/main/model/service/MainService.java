package com.kh.MasterPiece.main.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.MasterPiece.main.model.dao.MainDao;
import com.kh.MasterPiece.main.model.vo.MainTest;


import static com.kh.MasterPiece.common.JDBCTemplate.*;

public class MainService {

	public ArrayList<MainTest> selectProduct() {
		Connection con = getConnection();
		
		ArrayList<MainTest> list = new MainDao().selectProduct(con);
		
				
		close(con);
		
		return list;
	}
	
}
