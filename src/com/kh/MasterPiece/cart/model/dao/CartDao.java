package com.kh.MasterPiece.cart.model.dao;

import static com.kh.MasterPiece.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.cart.model.vo.Cart;
import com.kh.MasterPiece.member.model.dao.MemberDao;



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
	public String insertOrderCheck(Connection con) {
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
	public ArrayList<Cart> selectCart(Connection con, String code, String id, int count, String orderCheck, int currentPage, int limit, String category) {
		PreparedStatement pstmt = null;
		ArrayList<Cart> cartList = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("cartList");
		
		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setString(1, orderCheck);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();
			
			cartList = new ArrayList<Cart>();
			
			while(rset.next()){
				Cart c = new Cart();
				
				c.setOrder_no(rset.getInt("ORDER_NO"));
				c.setPrd_code(rset.getString("PRD_CODE"));
				c.setPrd_name(rset.getString("PRD_NAME"));
				c.setPrice(rset.getInt("PRICE"));
				c.setPrice(rset.getInt("TOTAL"));
				c.setOrder_count(rset.getShort("ORDER_COUNT"));
				c.setOrder_check(rset.getString("ORDER_CHECK"));
				
				cartList.add(c);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);		
		}

		return cartList;
	}
	public HashMap<String, Attachment> imgList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("cartImg");
		
		HashMap<String, Attachment> imgList = new HashMap<String, Attachment>();
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				Attachment a = new Attachment();
				a.setChangeName(rset.getString("change_name"));
				a.setOriginName(rset.getString("file_name"));
				a.setUploadDate(rset.getDate("upload_date"));
				a.setFilePath(rset.getString("save_route"));
				
				imgList.put(rset.getString("prd_code"), a);
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);		
		}

		return imgList;
	}
	public int getListCount(Connection con, String orderCheck) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("listCount");

		int listCount = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, orderCheck);

			rset = pstmt.executeQuery();			

			if(rset.next()){
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}

		return listCount;
	}
	public int deleteCart(Connection con, String[] values) {
		PreparedStatement pstmt = null;

		String query = prop.getProperty("deleteCart");

		int result = 0;

		try {
			for(int i = 0; i < values.length; i++){
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, values[i]);
				result += pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}


		return result;
	}
}
