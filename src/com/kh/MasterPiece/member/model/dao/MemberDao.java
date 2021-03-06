package com.kh.MasterPiece.member.model.dao;

import static com.kh.MasterPiece.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Properties;

import com.kh.MasterPiece.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao(){
		
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public int insertMember(Connection con, Member m) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, m.getUserName());
			pstmt.setString(2, m.getUserId());
			pstmt.setString(3, m.getUserPwd());
			pstmt.setString(4, m.getPhone());
			pstmt.setString(5, m.getAddress());
			pstmt.setString(6, m.getEmail());
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}
		
		
		return result;
	}
	//로그인
	public Member loginCheck(Connection con, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("loginSelect");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			Calendar cal = Calendar.getInstance();
			if(rset.next()){
				
				loginUser = new Member();
				
				loginUser.setUserNo(rset.getInt("user_no"));
				loginUser.setUserType(rset.getString("user_type"));
				loginUser.setUserName(rset.getString("user_name"));
				loginUser.setUserId(rset.getString("user_id"));
				loginUser.setUserPwd(rset.getString("user_pwd"));
				loginUser.setPhone(rset.getString("phone"));
				loginUser.setAddress(rset.getString("address"));
				loginUser.setEmail(rset.getString("email"));
				loginUser.setStatus(rset.getString("status"));
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			close(pstmt);
			close(rset);
		}
		
		return loginUser;
	}

	public int idCheck(Connection con, String userId) {


		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		
		String query = prop.getProperty("idCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				
				result = rset.getInt(1);
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(pstmt);
			close(rset);
		}
		
		return result;
	}

	public int emailCheck(Connection con, String email) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int result = 0;
		
		String query = prop.getProperty("emailCheck");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				
				result = rset.getInt(1);
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(pstmt);
			close(rset);
		}
		
		return result;
	}

	public int passFind(Connection con, String userId, String email) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("passFind");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, email);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}

		return result;
	}

	public int passFindResult(Connection con, String userId, String email, String userPwd) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("passFindResult");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userPwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, email);
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}

		return result;
	}

	public int ModifyInfo(Connection con, String userId, String userPwd, String address, String phone, String email) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("ModifyInfo");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, userPwd);
			pstmt.setString(2, address);
			pstmt.setString(3, phone);
			pstmt.setString(4, email);
			pstmt.setString(5, userId);
			
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}

		return result;
	}

	public int MemberOut(Connection con, String userId, String userPwd) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("MemberOut");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			
			close(pstmt);
		}

		return result;
	}

	public Member idFind(Connection con, String userName, String email) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;
		
		String query = prop.getProperty("idFind");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userName);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				m = new Member();

				m.setUserId(rset.getString("user_id"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return m;
	}

	

}
