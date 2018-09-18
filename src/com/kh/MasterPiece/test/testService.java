package com.kh.MasterPiece.test;



import static com.kh.MasterPiece.common.JDBCTemplate.close;
import static com.kh.MasterPiece.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.MasterPiece.board.modal.vo.Board;

public class testService {
	public int[] Count(){
		Connection con = getConnection();
		
		int list[] = new testDao().Count(con);
		
		close(con);
		
		return list;
	}

	public HashMap<String, String[]> selectList() {
		Connection con = getConnection();
		
		HashMap<String, String[]> hmap = new testDao().selectList(con);
		
		close(con);
		
		return hmap;
	}
}
