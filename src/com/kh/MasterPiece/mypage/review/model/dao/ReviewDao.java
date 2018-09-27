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
		
		String query = prop.getProperty("selectReview");

		
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


	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		int listCount = 0;
		
		try {
			stmt =  con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

}
