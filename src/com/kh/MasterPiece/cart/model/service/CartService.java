package com.kh.MasterPiece.cart.model.service;

import static com.kh.MasterPiece.common.JDBCTemplate.close;
import static com.kh.MasterPiece.common.JDBCTemplate.commit;
import static com.kh.MasterPiece.common.JDBCTemplate.getConnection;
import static com.kh.MasterPiece.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.MasterPiece.admin.model.dao.testDao;
import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.cart.model.dao.CartDao;
import com.kh.MasterPiece.cart.model.vo.Cart;
import com.kh.MasterPiece.product.model.dao.ProductDao;


public class CartService {
	//-----------------------------------유저 ORDER_CHECK 생성--------------------------------
	public String insertOrderCheck() {
		Connection con = getConnection();
		
		String result = new CartDao().insertOrderCheck(con);
		
		if(result!=null){
			commit(con);
		}else{
			rollback(con);
		}
		
		
		close(con);
		
		return result;
	}
	//-----------------------------------장바구니 추가-----------------------------------------
	public int insertCart(String code, String orderCheck, String id, int count) {
		Connection con = getConnection();
		
		int result = new CartDao().insertCart(con, code, orderCheck, id, count);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	public String test(String orderCheck) {
		Connection con = getConnection();
		
		String result = new CartDao().test(con,orderCheck);
		
		close(con);
		
		return result;
	}
	
	public ArrayList<Cart> selectCart(String code, String id, int count, String orderCheck, int currentPage, int limit, String category) {
		Connection con = getConnection();
		
		ArrayList<Cart> cartList = new CartDao().selectCart(con, code, id, count, orderCheck, currentPage, limit, category);
		
		close(con);
		
		return cartList;
	}
	
	public HashMap<String, Attachment> imgList() {
		Connection con = getConnection();
		
		HashMap<String, Attachment> imgList = new CartDao().imgList(con);
		
		close(con);
		
		return imgList;
	}
	
	public int getListCount(String orderCheck) {
Connection con = getConnection();
		
		int listCount = new CartDao().getListCount(con, orderCheck);
		
		close(con);
		
		return listCount;
	}
	public int deleteCart(String[] values) {
		Connection con = getConnection();
		
		int result = new CartDao().deleteCart(con, values);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
	
		return result;
	}
	
}


















