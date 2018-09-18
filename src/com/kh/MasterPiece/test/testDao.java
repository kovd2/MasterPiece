package com.kh.MasterPiece.test;



import static com.kh.MasterPiece.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.MasterPiece.board.modal.vo.Board;


public class testDao {
	private Properties prop = new Properties();

	public testDao() {
		String fileName = testDao.class.getResource("/sql/member/member-query.properties").getPath();
	
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int[] Count(Connection con){
		Statement stmt = null;
		ResultSet rset = null;
		Statement stmt2 = null;
		ResultSet rset2 = null;		
		String query = prop.getProperty("selectCount");
		
		int[] result = {0,0,0,0};
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			int i = 0;
			while(rset.next()){
				result[i] = rset.getInt(2);
				i++;
			}
			
			query = prop.getProperty("selectCount2");
			stmt2 = con.createStatement();
			rset2 = stmt2.executeQuery(query);
			while(rset2.next()){
				result[i] = rset2.getInt(2);
				i++;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
			close(stmt2);
			close(rset2);
			
		}
		
		
		
		return result;
		
	}


	public HashMap<String, String[]> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectList1");
		HashMap<String, String[]> hmap = new HashMap<String, String[]>();
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			String[] str = new String[4];
			int i = 0;
			while(rset.next()){
				str[i] = rset.getString("BOARD_TITLE");
				i++;	
				if(i>3)break;
			}
			System.out.println(str[0]);
			hmap.put("a", str);
			close(stmt);
			close(rset);
			query = prop.getProperty("selectList2");
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			str = new String[4];
			i = 0;
			while(rset.next()){
				str[i] = rset.getString("BOARD_TITLE");
				i++;	
				if(i>3)break;
			}
			System.out.println(str);
			hmap.put("b", str);
			close(stmt);
			close(rset);
			query = prop.getProperty("selectList3");
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			str = new String[4];
			i = 0;
			while(rset.next()){
				str[i] = rset.getString("BOARD_TITLE");
				i++;				
				if(i>3)break;
			}
			System.out.println(str);
			hmap.put("c", str);
			//a 공지사항
			//b 문의
			//c 견적
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
			
		}
		
		
		return hmap;
	}
	
}
