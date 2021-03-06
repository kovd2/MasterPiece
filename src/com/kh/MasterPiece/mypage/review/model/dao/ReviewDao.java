package com.kh.MasterPiece.mypage.review.model.dao;

import static com.kh.MasterPiece.common.JDBCTemplate.close;


import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.MasterPiece.board.model.vo.Board;
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


	//게시판 정보 불러오는 메소드,페이징처리
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


	public int deleteContact(Connection conn, int boardId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteContact");

		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardId);

			result = pstmt.executeUpdate();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally
		{
			close(pstmt);
		}
		return result;
	}


	public int searchCount(Connection con, String writer, int searchType, String searchText) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("searchCount");

		int listCount = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, writer);
			pstmt.setString(2, searchText);
			pstmt.setInt(3, searchType);

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


	public ArrayList<Review> selectList(String writer, int searchType, String searchText, int currentPage, int limit, Connection con) {
		PreparedStatement pstmt = null;
		ArrayList<Review> searchList = null;

		ResultSet rset = null;


		try {if(searchType == 3){


			String query = prop.getProperty("searchList1");
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setString(1, writer);
			pstmt.setString(2, searchText);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
		}else{

			String query = prop.getProperty("searchList2");
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setString(1, writer);
			pstmt.setString(2, searchText);
			pstmt.setInt(3, searchType);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);

		}
		rset = pstmt.executeQuery();

		searchList = new ArrayList<Review>();

		while(rset.next()){
			Review r = new Review();

			r.setBoardNo(rset.getInt("board_no"));
			r.setBoardCategory(rset.getInt("board_type"));
			r.setBoardTitle(rset.getString("board_title"));
			r.setBoardDate(rset.getDate("board_date"));
			r.setBoardId(rset.getInt("board_id"));

			searchList.add(r);
		}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		
		return searchList;
	}


	public ArrayList<Review> SearchDateList(String writer, String date, int currentPage, int limit, Connection con) {

		PreparedStatement pstmt = null;
		ArrayList<Review> searchList = null;

		ResultSet rset = null;


		try {
			if(date.equals("yesterday")){


				String query = prop.getProperty("searchYesterday");
				pstmt = con.prepareStatement(query);

				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;

				pstmt.setString(1, writer);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

			}else if(date.equals("today")){

				String query = prop.getProperty("searchToday");
				pstmt = con.prepareStatement(query);

				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;

				pstmt.setString(1, writer);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

			}else if(date.equals("aweek")){
				String query = prop.getProperty("searchAweek");
				pstmt = con.prepareStatement(query);

				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;

				pstmt.setString(1, writer);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

			}else if(date.equals("amonth")){
				String query = prop.getProperty("searchAmonth");
				pstmt = con.prepareStatement(query);

				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;

				pstmt.setString(1, writer);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

			}else if(date.equals("sixmonth")){
				String query = prop.getProperty("searchSixmonth");
				pstmt = con.prepareStatement(query);

				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;

				pstmt.setString(1, writer);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

			}else if(date.equals("ayear")){
				String query = prop.getProperty("searchAyear");
				pstmt = con.prepareStatement(query);

				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;

				pstmt.setString(1, writer);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

			}
			
			rset = pstmt.executeQuery();

			searchList = new ArrayList<Review>();

			while(rset.next()){
				Review r = new Review();

				r.setBoardNo(rset.getInt("board_no"));
				r.setBoardCategory(rset.getInt("board_type"));
				r.setBoardTitle(rset.getString("board_title"));
				r.setBoardDate(rset.getDate("board_date"));
				r.setBoardId(rset.getInt("board_id"));

				searchList.add(r);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		
		return searchList;
	}
}
