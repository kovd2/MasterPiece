package com.kh.MasterPiece.payMent.model.service;

import static com.kh.MasterPiece.common.JDBCTemplate.*;
import static com.kh.MasterPiece.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.MasterPiece.cart.model.vo.Cart;
import com.kh.MasterPiece.member.model.vo.Member;
import com.kh.MasterPiece.payMent.model.dao.payMentDao;

public class payMentService {

	public ArrayList<Cart> selectPayMentList(int currentPage, int limit, Member m, String[] values) {
		Connection con = getConnection();
		
		ArrayList<Cart> list = new payMentDao().selectPayMentList(con, currentPage, limit, m);
		
		close(con);
		
		return list;
	}

	public int payMentBank(String id, int price, String select, String name) {
		Connection con = getConnection();
		
		int result = new payMentDao().payMentBank(con, id, price, select, name);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		
		return result;
	}

	public int testUp(String orderCheck, int result2) {
		Connection con = getConnection();
		
		int result = new payMentDao().testUp(con, orderCheck, result2);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int applyno(String id, int price, String select, String applyno) {
		Connection con = getConnection();
		
		int result3 = new payMentDao().applyno(con, id, price, select, applyno);
		
		if(result3 > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		return result3;
	}

}
