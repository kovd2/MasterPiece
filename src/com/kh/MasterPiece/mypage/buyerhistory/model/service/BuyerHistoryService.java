package com.kh.MasterPiece.mypage.buyerhistory.model.service;

import static com.kh.MasterPiece.common.JDBCTemplate.close;
import static com.kh.MasterPiece.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.mypage.buyerhistory.model.dao.BuyerHistoryDao;
import com.kh.MasterPiece.mypage.buyerhistory.model.vo.BuyerHistory;

public class BuyerHistoryService {
	
	//결제금액 뺴고 나머지 데이터 가져오는 메소드
	public ArrayList<BuyerHistory> viewHistory(String writer, int currentPage, int limit) {
		Connection con = getConnection();

		ArrayList<BuyerHistory> list = new BuyerHistoryDao().viewHistory(con, writer, currentPage, limit);

		close(con);

		return list;

	}
	
	//이미지 가져오는 메소드
	public HashMap<String, Attachment> imageList() {
		
		Connection con = getConnection();

		HashMap<String, Attachment> list = new BuyerHistoryDao().imageList(con);

		close(con);

		return list;
	}

	//결제테이블 쪽 데이터 가져오는 메소드
	public HashMap<String, BuyerHistory> viewHistory2(String writer) {
	
		Connection con = getConnection();

		HashMap<String, BuyerHistory> list = new BuyerHistoryDao().viewHistory2(con, writer);

		close(con);

		return list;

	}

	//페이징처리메소드
	public int getListCount(String writer) {
		Connection con = getConnection();
		
		int listCount = new BuyerHistoryDao().getListCount(writer, con);
		
		close(con);
		
		return listCount;
	}

	public HashMap<String, Attachment> imageList2()
	{
		Connection con = getConnection();

		HashMap<String, Attachment> list = new BuyerHistoryDao().imageList2(con);

		close(con);

		return list;
	}

	public BuyerHistory viewHistoryOne(String userId)
	{
		Connection conn = getConnection();
		
		BuyerHistory bh = new BuyerHistoryDao().viewHistoryOne(conn, userId);
		
		close(conn);
		
		return bh;
	}
}
