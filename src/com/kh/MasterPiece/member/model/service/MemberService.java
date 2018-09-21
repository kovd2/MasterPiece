package com.kh.MasterPiece.member.model.service;

import java.sql.Connection;

import com.kh.MasterPiece.member.model.dao.MemberDao;
import com.kh.MasterPiece.member.model.vo.Member;


import static com.kh.MasterPiece.common.JDBCTemplate.*;


public class MemberService {

	
	//회원가입
	public int insertMember(Member m) {
		Connection con = getConnection();
		
		int result = new MemberDao().insertMember(con, m);
		
		if(result > 0){
			
			commit(con);
			
		}else{
			
			rollback(con);
		}
		
		close(con);
		
		return result;
	}
	
	//로그인
	public Member loginCheck(String userId, String userPwd) {
		Connection con = getConnection();
		
		Member loginUser = new MemberDao().loginCheck(con, userId, userPwd);
		
		close(con);
		
		return loginUser;
	}
	
	//아이디 중복체크
	public int idCheck(String userId) {
		
		Connection con = getConnection();
		
		int result = new MemberDao().idCheck(con, userId);
		
		close(con);
		
		
		return result;
	}

	public int emailCheck(String email) {
		
		Connection con = getConnection();
		
		int result = new MemberDao().emailCheck(con, email);
		
		close(con);
		
		return result;
	}

	public int passFind(String userId, String email) {
		
		Connection con = getConnection();
		
		int result = new MemberDao().passFind(con, userId, email);
		
		close(con);
		
		return result;
	}

	public int passFindResult(String userId, String email, String userPwd) {
		Connection con = getConnection();
		
		int result = new MemberDao().passFindResult(con, userId, email, userPwd);
		
		close(con);
		
		return result;
	}

	public int ModifyInfo(String userId, String userPwd, String address, String phone, String email) {
		Connection con = getConnection();
		
		int result = new MemberDao().ModifyInfo(con, userId, userPwd, address, phone, email);
		
		close(con);
		
		return result;
	}

	public int MemberOut(String userId, String userPwd) {
		Connection con = getConnection();
		
		int result = new MemberDao().MemberOut(con, userId, userPwd);
		
		close(con);
		
		return result;
	}

	public Member idFind(String userName, String email) {
		
		Connection con = getConnection();
		
		Member m = new MemberDao().idFind(con, userName, email);

		close(con);
		
		return m;
	}



}
