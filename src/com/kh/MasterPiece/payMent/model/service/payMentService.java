package com.kh.MasterPiece.payMent.model.service;

import static com.kh.MasterPiece.common.JDBCTemplate.*;
import static com.kh.MasterPiece.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.MasterPiece.cart.model.vo.Cart;
import com.kh.MasterPiece.member.model.vo.Member;
import com.kh.MasterPiece.payMent.model.dao.payMentDao;

public class payMentService {

	public ArrayList<Cart> selectPayMentList(int currentPage, int limit, Member m, String[] values, String[] prdCode2) {
		Connection con = getConnection();
		ArrayList<Cart> list = new payMentDao().selectPayMentList(con, currentPage, limit, m, prdCode2);
		
		close(con);
		
		return list;
	}

	public int payMentBank(String id, int price, String select, String name, String recipient, String address, String tel, String etc) {
		Connection con = getConnection();
		
		int result = new payMentDao().payMentBank(con, id, price, select, name, recipient, address, tel, etc);
		
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

	public int payMentCard(String id, int price, String select, String applyno, String recipient, String address, String tel, String etc) {
		Connection con = getConnection();
		
		int result2 = new payMentDao().payMentCard(con, id, price, select, applyno, recipient, address, tel, etc);
		
		if(result2 > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result2;
	}

	public int testUp2(String orderCheck, int result3) {
		Connection con = getConnection();
		
		int result = new payMentDao().testUp2(con, orderCheck, result3);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int afterPayment(String id, String orderCheck) {
		Connection con = getConnection();
		
		int result = new payMentDao().afterPayment(con, id, orderCheck);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int buyHistory(String orderCheck) {
		Connection con = getConnection();
		
		int result = new payMentDao().buyHistory(con, orderCheck);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int buyHistory2(String orderCheck) {
		Connection con = getConnection();
		
		int result = new payMentDao().buyHistory2(con, orderCheck);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public HashMap<String, Integer> count(String orderCheck) {
		Connection con = getConnection();
		
		HashMap<String, Integer> list = new payMentDao().count(con, orderCheck);
		
		close(con);
		
		return list;
	}

	public int update(HashMap<String, Integer> map) {
		Connection con = getConnection();
		
		int result = new payMentDao().update(con, map);
		
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public ArrayList<Cart> selectPayMentList2(Member m, String pcode) {
		Connection con = getConnection();
		ArrayList<Cart> list = new payMentDao().selectPayMentList2(con, m, pcode);
		
		close(con);
		
		return list;
	}

}
