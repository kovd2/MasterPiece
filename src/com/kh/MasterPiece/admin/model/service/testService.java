package com.kh.MasterPiece.admin.model.service;


import static com.kh.MasterPiece.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.MasterPiece.admin.model.dao.testDao;
import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.board.model.vo.Board;
import com.kh.MasterPiece.member.model.vo.Member;
import com.kh.MasterPiece.mypage.buyerhistory.model.vo.BuyerHistory;
import com.kh.MasterPiece.product.model.vo.Product; 

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

	public ArrayList<Product> productList() {
		Connection con = getConnection();
		
		ArrayList<Product> list = new testDao().productList(con);
		
		close(con);
		return list;
	}

	public int insertProduct(Product p, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		int result = 0;
		
		int result1 = new testDao().insertProduct(con, p);
		
		if(result1 > 0){
			String code = p.getPrd_code();
			
			for(int i = 0; i < fileList.size(); i++){
				fileList.get(i).setCode(code);
			}
		}
		
		int result2 = new testDao().insertAttachment(con, fileList);
		
		if(result1 > 0 && result2 > 0){
			commit(con);
			result = 1;
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public HashMap<String, Attachment> imgList() {
		Connection con = getConnection();
		
		HashMap<String, Attachment> imgList = new testDao().imgList(con);
		
		close(con);
		return imgList;
	}

	public int getListCount() {
		Connection con = getConnection();
		
		int listCount = new testDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Product> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Product> list = new testDao().selectList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int getCategoryListCount(String code) {
		Connection con = getConnection();
		
		int listCount = new testDao().getCategoryListCount(con, code);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Product> selectCategoryList(int currentPage, int limit, String code) {
		Connection con = getConnection();
		
		ArrayList<Product> list = new testDao().selectCategoryList(con, currentPage, limit, code);
		
		close(con);
		
		return list;
	}

	public int getMemberListCount() {
		Connection con = getConnection();
		
		int listCount = new testDao().getMemberListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Member> selectMemberList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Member> list = new testDao().selectMemberList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int deleteMember(int code) {
		Connection con = getConnection();
		
		int result= new testDao().deleteMember(con, code);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
	
		return result;
	}

	public ArrayList<Member> searchMemberList(String code, String val) {
		Connection con = getConnection();
		
		ArrayList<Member> list = new testDao().searchMemberList(con, code, val);
		
		close(con);
		
		return list;
	}

	public int deleteProduct(String[] values) {
		Connection con = getConnection();
		
		int result = new testDao().deleteProduct(con, values);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
	
		return result;
	}

	public int getOrderListCount() {
		Connection con = getConnection();
		
		int listCount = new testDao().getOrderListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<BuyerHistory> selectOrderList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<BuyerHistory> list = new testDao().selectOrderList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int getQuestionListCount() {
		Connection con = getConnection();
		
		int listCount = new testDao().getQuestionListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Board> selectQuestionList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new testDao().selectQuestionList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public Board questionDetail(String id) {
		Connection con = getConnection();
		
		Board b = new testDao().questionDetail(con, id);
		
		close(con);
		
		return b;
	}


	public Member getep(String id) {
		Connection con = getConnection();
		
		Member m = new testDao().getep(con, id);
		
		close(con);
		
		return m;
	}

	public int answer(String content, int id) {
		Connection con = getConnection();
		
		int result = new testDao().answer(con, id, content);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int getBoardListCount() {
		Connection con = getConnection();
		
		int listCount = new testDao().getBoardListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Board> getBoardListCount(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new testDao().getBoardListCount(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public int getSelectBoardListCount(int type) {
		Connection con = getConnection();
		
		int listCount = new testDao().getSelectBoardListCount(con, type);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Board> selectBoardList2(int currentPage, int limit, int type) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new testDao().selectBoardList2(con, currentPage, limit, type);
		
		close(con);
		
		return list;
	}

	public int boardInsert(Board b) {
		Connection con = getConnection();
		
		int result = new testDao().boardInsert(con, b);
		
		if(result>0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public Board boardDetail(String id) {
		Connection con = getConnection();
		
		Board b = new testDao().boardDetail(con, id);
		
		close(con);
		
		return b;
	}

	public int modifyBoard(Board b) {
		Connection con = getConnection();
		
		int result = new testDao().modifyBoard(con, b);
		
		if(result>0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<Integer> monthSales() {
		Connection con = getConnection();
		
		ArrayList<Integer> list = new testDao().monthSales(con);
		
		close(con);
		
		return list;
	}

	public int insertPromotion(String proTitle, String proUrl, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		int result = new testDao().insertPromotion(con, proTitle, proUrl);

		int result2 = new testDao().insertAttachmentPromotion(con, fileList);
		
		if(result2 > 0){
			commit(con);
			result = 1;
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int newMemberCount() {
		Connection con = getConnection();
		int count = new testDao().newMemberCount(con);
		
		close(con);
		
		return count;
	}
}
