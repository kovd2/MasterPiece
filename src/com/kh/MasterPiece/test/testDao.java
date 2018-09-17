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
			System.out.println(query);
			int i = 0;
			while(rset.next()){
				System.out.println(rset.getString(1) + " : " + rset.getInt(2));
				result[i] = rset.getInt(2);
				i++;
			}
			
			query = prop.getProperty("selectCount2");
			stmt2 = con.createStatement();
			rset2 = stmt.executeQuery(query);
			System.out.println(i);
			while(rset2.next()){
				System.out.println(rset2.getString(1) + " : " + rset2.getInt(2));
				result[i] = rset2.getInt(2);
				i++;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
			
		}
		
		/*PreparedStatement pstmt = null;
		int[] result ={0};
		
		String query = prop.getProperty("insert");
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, 1);
			result[0] = pstmt.executeUpdate();
			System.out.println(result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}*/
		
		
		return result;
		
	}


	public HashMap<String, ArrayList<Board>> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectList");
		HashMap<String, ArrayList<Board>> hmap = new HashMap<String, ArrayList<Board>>();
		ArrayList<Board> list = new ArrayList<Board>();
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()){
				Board b = new Board();
				b.setBOARD_TITLE(rset.getString("BOARD_TITLE"));
				
				list.add(b);				
			}
			//a 공지사항
			//b 문의
			//c 견적
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
			
		}
		
		/*PreparedStatement pstmt = null;
		int[] result ={0};
		
		String query = prop.getProperty("insert");
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, 1);
			result[0] = pstmt.executeUpdate();
			System.out.println(result);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}*/
		
		
		return hmap;
	}
	
}
