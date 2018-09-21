package com.kh.MasterPiece.product.model.dao;

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
import com.kh.MasterPiece.board.model.vo.Board;
import com.kh.MasterPiece.product.model.vo.Product;

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
	public ArrayList<Product> selectListAll(Connection con, int currentPage, int limit) {
		//Statement stmt = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		//String query = prop.getProperty("selectListAll");
		String query = prop.getProperty("listPage");
		
		ArrayList<Product> list = null;
		
		try {
			/*stmt = con.createStatement();
			rset = stmt.executeQuery(query);*/
			
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Product>();
			
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
			//close(stmt);
			close(pstmt);
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
	
	public Product prdDetail(Connection con, String code) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Product p = null;
		
		String query = prop.getProperty("prdDetail");
		
		try
		{
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, code);
			
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				p = new Product();
				
				p.setPrd_name(rset.getString("PRD_NAME"));
				p.setPrice(rset.getInt("PRICE"));
				p.setRelease_date(rset.getDate("RELEASE_DATE"));
				p.setManufacturer(rset.getString("MANUFACTURER"));
				
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			close(rset);
			close(pstmt);
		}
		
		return p;
	}

	public Attachment detailImg(Connection conn, String code) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Attachment a = null;
		
		String query = prop.getProperty("detailImg");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, code);
			
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				a = new Attachment();
				
				a.setChangeName(rset.getString("change_name"));
				a.setOriginName(rset.getString("file_name"));
				a.setFilePath(rset.getString("save_route"));
				
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			close(rset);
			close(pstmt);
		}
		
		return a;
	}
	
}
