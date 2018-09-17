package com.kh.MasterPiece.product.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.MasterPiece.product.model.vo.Product;

import static com.kh.MasterPiece.common.JDBCTemplate.*;

public class ProductDao {
	private Properties prop = new Properties();
	public ProductDao()
	{
		String fileName = ProductDao.class.getResource("/sql/product/product-query.properties").getPath();
		
		try
		{
			prop.load(new FileReader(fileName));
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<Product> selectAllCart(Connection con) {
		Statement stmt = null; 
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("selectAll");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Product>();
			
			while(rset.next()){
				Product p = new Product();
				
				p.setPrd_code(rset.getString("prd_code"));
				p.setManufacturer(rset.getString("manufacturer"));
				p.setPrice(rset.getInt("price"));
				p.setPrd_name(rset.getString("prd_name"));
				p.setCategory(rset.getString("category"));
				p.setSell_count(rset.getInt("sell_count"));
	
				list.add(p);
				

			}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}

		return list;
	}

	public ArrayList<Product> showCart(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Product> list = null;
		
		String query = prop.getProperty("showCart");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<Product>();
			
			while(rset.next()){
				Product p = new Product();
				p.setPrd_name(rset.getString("prd_name"));
				p.setPrice(rset.getInt("price"));
				
				list.add(p);
			}
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return list;
	}



}
