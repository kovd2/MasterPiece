package com.kh.MasterPiece.product.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.MasterPiece.board.model.vo.Attachment;
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
	public ArrayList<Product> selectListAll(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectListAll");
		
		ArrayList<Product> list = new ArrayList<Product>();
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				Product p = new Product();
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setPrd_name(rset.getString("PRD_NAME"));
				p.setPrice(rset.getInt("PRICE"));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(stmt);
			close(rset);
		}
		
		return list;
	}
	public HashMap<String, Attachment> imgList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("prdImg");
		
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
}
