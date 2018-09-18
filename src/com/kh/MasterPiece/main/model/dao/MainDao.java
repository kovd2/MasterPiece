package com.kh.MasterPiece.main.model.dao;


import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.MasterPiece.main.model.vo.MainTest;

import static com.kh.MasterPiece.common.JDBCTemplate.*;

public class MainDao {
private Properties prop = new Properties();
	
	public MainDao(){
		String fileName 
		= MainDao.class.getResource("/sql/main/main-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	public ArrayList<MainTest> selectProduct(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<MainTest> list = new ArrayList<>();
		
		String query = prop.getProperty("selectProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				MainTest product = new MainTest();
				product.setPrdCode(rset.getString("PRD_CODE"));
				product.setManufacturer(rset.getString("MANUFACTURER"));
				product.setPrice(rset.getInt("PRICE"));
				product.setPrdName(rset.getString("PRD_NAME"));
				product.setReleaseDate(rset.getDate("RELEASE_DATE"));
				product.setCategory(rset.getString("CATEGORY"));
				product.setSellCount(rset.getInt("SELL_COUNT"));
				product.setStock(rset.getInt("STOCK"));
				
				list.add(product);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

}
