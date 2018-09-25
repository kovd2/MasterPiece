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
import com.kh.MasterPiece.member.model.dao.MemberDao;
import com.kh.MasterPiece.member.model.vo.Member;
import com.kh.MasterPiece.product.model.vo.Product;

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
	

}
