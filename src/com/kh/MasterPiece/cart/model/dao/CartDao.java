package com.kh.MasterPiece.cart.model.dao;

import static com.kh.MasterPiece.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.kh.MasterPiece.member.model.dao.MemberDao;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class CartDao {
	private Properties prop = new Properties();
	
	public CartDao(){
		String fileName = MemberDao.class.getResource("/sql/cart/cart-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	//-----------------------------------유저 ORDER_CHECK 생성--------------------------------
	public String insertOrderCheck(Connection con, String orderCheck) {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ResultSet rset  = null;
		int result = 0;
		
		String query = prop.getProperty("insertOrderCheck");
		String oc = null;
		try {
			pstmt = con.prepareStatement(query);
			
			
			result = pstmt.executeUpdate();
			
			stmt = con.createStatement();
			rset= stmt.executeQuery("select SEQ_TEST_NO.CURRVAL from DUAL");
			rset.next();
			oc = Integer.toString(rset.getInt(1));
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(stmt);
			close(rset);
		}
		return oc;
	}
	//-----------------------------------장바구니 추가-----------------------------------------
	public int insertCart(Connection con, String code, String orderCheck, String id, int count) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCart");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, code);
			pstmt.setString(3, orderCheck);
			pstmt.setInt(4, count);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}
	public String test(Connection con, String orderCheck) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String result = null;
		
		String query = prop.getProperty("test");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, orderCheck);
			rset = pstmt.executeQuery();
			if(rset.next()){
				result = rset.getString("ORDER_CHECK");			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return result;
	}
	

}
