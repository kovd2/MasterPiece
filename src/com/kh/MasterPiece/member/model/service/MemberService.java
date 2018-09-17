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

}
