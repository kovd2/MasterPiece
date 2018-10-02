package com.kh.MasterPiece.mypage.review.model.service;

import static com.kh.MasterPiece.common.JDBCTemplate.close;
import static com.kh.MasterPiece.common.JDBCTemplate.commit;
import static com.kh.MasterPiece.common.JDBCTemplate.getConnection;
import static com.kh.MasterPiece.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;

import com.kh.MasterPiece.board.model.dao.BoardDao;
import com.kh.MasterPiece.board.model.vo.Board;
import com.kh.MasterPiece.main.model.dao.MainDao;
import com.kh.MasterPiece.mypage.review.model.dao.ReviewDao;
import com.kh.MasterPiece.mypage.review.model.vo.Review;


public class ReviewService {

	public ArrayList<Review> selectList(String writer, int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectList(writer, con, currentPage, limit);
		
		close(con);
		
		return list;
	}


	public int getListCount(String writer) {
		Connection con = getConnection();
		
		int listCount = new ReviewDao().getListCount(writer, con);
		
		close(con);
		
		return listCount;
	}

//게시판 내용상세보기
	public Board selectOne(int num) {
		Connection con = getConnection();		
		Board b = null;
		
		b = new ReviewDao().selectOne(con, num);
			
		return b;

	}

//게시글 내용수정
	public int updateContact(Board b) {
		
		Connection con = getConnection();
		
		int result = new ReviewDao().updateContact(con, b);
		
		if(result > 0)
		{
			commit(con);
		}
		else
		{
			rollback(con);
		}
		close(con);
		
		return result;
	}


	public int deleteContact(int boardId) {
		Connection conn = getConnection();
		int result = new ReviewDao().deleteContact(conn, boardId);
		
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


	public int searchCount(String writer, int searchType, String searchText) {
		Connection con = getConnection();
		
		int listCount = new ReviewDao().searchCount(con, writer, searchType, searchText);
				
		close(con);
		
		
		return listCount;
	}


	public ArrayList<Review> searchList(String writer, int searchType, String searchText, int currentPage, int limit) {
		
		Connection con = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectList(writer, searchType, searchText, currentPage, limit, con);
				
		close(con);
		
		
		return list;
	}


	public ArrayList<Review> SearchDateList(String writer, String date, int currentPage, int limit) {
		
		Connection con = getConnection();
		
		ArrayList<Review> list = new ReviewDao().SearchDateList(writer, date, currentPage, limit, con);
				
		close(con);
		
		
		return list;
	}
}
