package com.kh.MasterPiece.mypage.review.model.dao;

import static com.kh.MasterPiece.common.JDBCTemplate.close;


import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.MasterPiece.board.model.vo.Board;
import com.kh.MasterPiece.mypage.buyerhistory.model.dao.BuyerHistoryDao;
import com.kh.MasterPiece.mypage.buyerhistory.model.vo.BuyerHistory;
import com.kh.MasterPiece.mypage.review.model.vo.Review;

public class ReviewDao {

		
	private Properties prop = new Properties();
	
	public ReviewDao(){
		String fileName = ReviewDao.class.getResource("/sql/mypage/mypage-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	//게시판 정보 불러오는 메소드
	public ArrayList<Review> selectList(String writer, Connection con, int currentPage, int limit) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Review> list = new ArrayList<Review>();
		
		String query = prop.getProperty("selectList");

		
		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit +1;
			int endRow = startRow + limit - 1;
			
			pstmt.setString(1, writer);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
						
			while(rset.next()){
				Review r = new Review();
				
				r.setBoardNo(rset.getInt("board_no"));
				r.setBoardCategory(rset.getInt("board_type"));
				r.setBoardTitle(rset.getString("board_title"));
				r.setBoardDate(rset.getDate("board_date"));
				r.setBoardId(rset.getInt("board_id"));
				
				list.add(r);
			}
					
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}


	public int getListCount(String writer, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		int listCount = 0;
		
		try {
			pstmt =  con.prepareStatement(query);
			pstmt.setString(1, writer);
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		
		return listCount;
	}


	public Board selectOne(Connection con, int num) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				b = new Board();
			
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_NO(rset.getInt("board_no"));
				b.setBOARD_TYPE(rset.getInt("board_type"));
				b.setBOARD_CATEGORY(rset.getString("board_category"));
				b.setBOARD_TITLE(rset.getString("board_title"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_DATE(rset.getDate("board_date"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}

		return b;
	}


	public int updateContact(Connection con, Board b) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateContact");
		
		try
		{
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, b.getBOARD_TITLE());
			pstmt.setString(2, b.getBOARD_CONTENT());
			pstmt.setInt(3, b.getBOARD_ID());
			
			result = pstmt.executeUpdate();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally{
			close(pstmt);
		}
		return result;
	}

}
