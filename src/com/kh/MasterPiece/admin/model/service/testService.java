package com.kh.MasterPiece.admin.model.service;


import static com.kh.MasterPiece.common.JDBCTemplate.close;
import static com.kh.MasterPiece.common.JDBCTemplate.commit;
import static com.kh.MasterPiece.common.JDBCTemplate.getConnection;
import static com.kh.MasterPiece.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.MasterPiece.admin.model.dao.testDao;
import com.kh.MasterPiece.admin.model.vo.Cnt;
import com.kh.MasterPiece.admin.model.vo.Delivery;
import com.kh.MasterPiece.admin.model.vo.OrderConfirm;
import com.kh.MasterPiece.admin.model.vo.Promotion;
import com.kh.MasterPiece.admin.model.vo.Promotion_ATT;
import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.board.model.vo.Board;
import com.kh.MasterPiece.cart.model.vo.Cart;
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

	public ArrayList<Member> searchMemberList(String code, String val, int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Member> list = new testDao().searchMemberList(con, code, val, currentPage, limit);
		
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
		
		int result = 0;
		
		int result1 = new testDao().insertPromotion(con, proTitle, proUrl);

		int result2 = new testDao().insertAttachmentPromotion(con, fileList);
		
		if(result1 > 0 && result2 > 0){
			commit(con);
			result = 1;
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}


	public int getPromotionListCount() {
		Connection con = getConnection();
		
		int listCount = new testDao().getPromotionListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Promotion> selectPromotionList(int currentPage, int limit) {
		Connection con = getConnection();
		
		ArrayList<Promotion> list = new testDao().selectPromotionList(con, currentPage, limit);
		
		close(con);
		
		return list;
	}

	public Promotion promotionDetail(String no) {
		Connection con = getConnection();
		
		Promotion p = new testDao().promotionDetail(con, no);
		
		
		close(con);
		
		return p;
	}

	public Promotion_ATT promotion_ATTDetail(String no) {
		Connection con = getConnection();
		
		Promotion_ATT pa = new testDao().promotion_ATTDetail(con, no);
		
		
		close(con);
		
		return pa;
	}

	public int modifyPromotion(String proTitle, String proUrl, String proNo, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		
		int result = 0;
		
		int result1 = new testDao().modifyPromotion(con, proTitle, proUrl, proNo);

		int result2 = new testDao().modifyAttachmentPromotion(con, fileList, proNo);
		
		if(result1 > 0 && result2 > 0){
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

	public HashMap<String, Integer> sel_desc() {
		Connection con = getConnection();
		HashMap<String, Integer> sel_desc = new testDao().sel_desc(con);
		
		close(con);
		
		return sel_desc;
	}

	public HashMap<String, Integer> sel_asc() {
		Connection con = getConnection();
		HashMap<String, Integer> sel_asc = new testDao().sel_asc(con);
		
		close(con);
		
		return sel_asc;
	}

	public int getCartList(Member m) {
		Connection con = getConnection();
		
		int result = new testDao().getCartList(con, m);
		
		close(con);
		
		return result;
	}

	public ArrayList<Cart> selectCartList(int currentPage, int limit, Member m) {
		Connection con = getConnection();
		
		ArrayList<Cart> list = new testDao().selectCartList(con, currentPage, limit, m);
		
		close(con);
		
		return list;
	}

	public int promotionDelete(String proNo) {
		Connection con = getConnection();
		
		int result = new testDao().promotionDelete(con, proNo);
		
		close(con);
		
		return result;
	}

	public ArrayList<OrderConfirm> orderConfirmList(int currentPage, int limit, String status) {
		Connection con = getConnection();
		
		ArrayList<OrderConfirm> list = new testDao().orderConfirmList(con, currentPage, limit, status);
		
		close(con);
		
		return list;
	}

	public int getOrderConfirmCount(String status) {
		Connection con = getConnection();
		
		int result = new testDao().getOrderConfirmCount(con,status);
		
		close(con);
		
		return result;
	}

	public ArrayList<Product> detail(String oc) {
		Connection con = getConnection();
		
		ArrayList<Product> list = new testDao().detail(con, oc);
		
		close(con);
		return list;
	}

	public ArrayList<OrderConfirm> orderSearchList(int currentPage, int limit, String oc) {
		Connection con = getConnection();
		
		ArrayList<OrderConfirm> list = new testDao().orderSearchList(con, currentPage, limit, oc);
		
		close(con);
		return list;
	}

	public int getOrderSearchCount(String oc) {
		Connection con = getConnection();
		
		int result = new testDao().getOrderSearchCount(con, oc);
		
		close(con);
		
		return result;
	}

	public ArrayList<Delivery> deliveryList(int currentPage, int limit, String st) {
		Connection con = getConnection();
		
		ArrayList<Delivery> list = new testDao().deliveryList(con, currentPage, limit, st);
		
		close(con);
		return list;
	}

	public int getDeliveryListCount(String st) {
		Connection con = getConnection();
		
		int result = new testDao().getDeleveryListCount(con,st);
		
		close(con);
		
		return result;
	}

	public int insertDeliver(String[] oc) {
		Connection con = getConnection();
		
		int result = new testDao().insertDeliver(con, oc);
		
		if(result >0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int updateDelivery(String[] dn) {
		Connection con = getConnection();
		
		int result = new testDao().updateDelivery(con, dn);
		
		if(result >0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int cnt() {
		Connection con = getConnection();
		
		int result = new testDao().cnt(con);
		
		close(con);
		
		return result;
	}

	public HashMap<String, Integer> cntList() {
		Connection con = getConnection();
		
		HashMap<String, Integer> result = new testDao().cntList(con);
		
		close(con);
		
		return result;
	}
	
	public ArrayList<Cnt> cntList2() {
		Connection con = getConnection();
		
		ArrayList<Cnt> result = new testDao().cntList2(con);
		
		close(con);
		
		return result;
	}

	public Board boardDetail2(String id) {
		Connection con = getConnection();
		
		Board b = new testDao().boardDetail2(con, id);
		
		close(con);
		
		return b;
	}

	public ArrayList<Product> list(String category) {
		Connection con = getConnection();
		
		ArrayList<Product> list = new testDao().list(con, category);
		
		close(con);
		
		return list;
	}

	public int queInsert(String id, String content) {
		Connection con = getConnection();
		
		int result = new testDao().queInsert(con, id, content);
		
		if(result>0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int cancelDeliver(String[] pn) {
		Connection con = getConnection();
		
		int result = new testDao().cancelDeliver(con, pn);
		
		if(result >0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int complete(String[] pn) {
		Connection con = getConnection();
		
		int result = new testDao().complete(con, pn);
		
		if(result >0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int refundDeliver(String[] pn) {
		Connection con = getConnection();
		
		int result = new testDao().refundDeliver(con, pn);
		
		if(result >0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

}
