package com.kh.MasterPiece.mypage.review.model.service;

import static com.kh.MasterPiece.common.JDBCTemplate.close;
import static com.kh.MasterPiece.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.MasterPiece.mypage.buyerhistory.model.dao.BuyerHistoryDao;
import com.kh.MasterPiece.mypage.buyerhistory.model.vo.BuyerHistory;
import com.kh.MasterPiece.mypage.review.model.dao.ReviewDao;
import com.kh.MasterPiece.mypage.review.model.vo.Review;


public class ReviewService {

	public ArrayList<Review> selectList(String writer, int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Review> list = new ReviewDao().selectList(writer, con, currentPage, limit);
		
		close(con);
		
		return list;
	}


	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new ReviewDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}



}
