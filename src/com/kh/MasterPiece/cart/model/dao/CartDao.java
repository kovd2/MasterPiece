package com.kh.MasterPiece.cart.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.kh.MasterPiece.cart.model.vo.Cart;
import com.kh.MasterPiece.member.model.dao.MemberDao;
import com.kh.MasterPiece.member.model.vo.Member;
import com.kh.MasterPiece.product.model.vo.Product;

import static com.kh.MasterPiece.common.JDBCTemplate.*;

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
	public int insertCart(Connection con, Member m, Cart c, Product p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCart");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, p.getPrd_name());
			pstmt.setInt(2, c.getQuty());
			pstmt.setInt(3, c.getPrice());
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		
		return 0;
	}

}
