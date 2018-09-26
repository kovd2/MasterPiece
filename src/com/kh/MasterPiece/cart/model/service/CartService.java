package com.kh.MasterPiece.cart.model.service;

import static com.kh.MasterPiece.common.JDBCTemplate.close;
import static com.kh.MasterPiece.common.JDBCTemplate.commit;
import static com.kh.MasterPiece.common.JDBCTemplate.getConnection;
import static com.kh.MasterPiece.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.kh.MasterPiece.cart.model.dao.CartDao;


public class CartService {
	//-----------------------------------유저 ORDER_CHECK 생성--------------------------------
	public String insertOrderCheck(String orderCheck) {
		Connection con = getConnection();
		
		String result = new CartDao().insertOrderCheck(con, orderCheck);
		
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

	
}


















