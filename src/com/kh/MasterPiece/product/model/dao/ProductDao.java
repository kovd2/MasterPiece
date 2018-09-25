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
	/*public ArrayList<Product> selectListAll(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectListAll");
		
		ArrayList<Product> list = null;
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			stmt = con.prepareStatement(query);
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Product>();
			
			while(rset.next()){
				Product p = new Product();
				
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setPrd_name(rset.getString("PRD_NAME"));
				p.setPrice(rset.getInt("PRICE"));
				p.setManufacturer(rset.getString("MANUFACTURER"));
				p.setCategory(rset.getString("CATEGORY"));
				
				list.add(p);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(stmt);
			close(rset);
		}
		
		return list;
	}*/
	public HashMap<String, Object> imgList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("prdImg");
		
		HashMap<String, Object> imgList = new HashMap<String, Object>();
		
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
	public HashMap<String, Object> imgList(Connection con, String code) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		
		Product p = null;
		Attachment at = null;
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("imgDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, code);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Attachment>();
			
			while(rset.next()){
				p = new Product();
				
				p.setPrd_name(rset.getString("PRD_NAME"));
				p.setPrice(rset.getInt("PRICE"));
				p.setRelease_date(rset.getDate("RELEASE_DATE"));
				p.setManufacturer(rset.getString("MANUFACTURER"));
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setCategory(rset.getString("CATEGORY"));
				
				at = new Attachment();
				
				at.setChangeName(rset.getString("change_name"));
				at.setOriginName(rset.getString("file_name"));
				at.setUploadDate(rset.getDate("upload_date"));
				at.setFilePath(rset.getString("save_route"));
				
				list.add(at);
			}
			
			hmap = new HashMap<String, Object>();
			hmap.put("product", p);
			hmap.put("attachment", list);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		
		return hmap;
	}
	public ArrayList<Product> cpuList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ArrayList<Product> cpuList = null;

		ResultSet rset = null;

		String query = prop.getProperty("cpuImg");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setString(1, "CPU");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			cpuList = new ArrayList<Product>();

			while(rset.next()){
				Product p = new Product();
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setPrd_name(rset.getString("PRD_NAME"));
				p.setManufacturer(rset.getString("MANUFACTURER"));
				p.setCategory(rset.getString("CATEGORY"));

				cpuList.add(p);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		

		return cpuList;
	}
	
	public ArrayList<Product> mainBoardList(Connection con, int currentPage1, int limit1) {
		PreparedStatement pstmt = null;
		ArrayList<Product> mainBoardList = null;

		ResultSet rset = null;

		String query = prop.getProperty("mainBoardImg");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage1 - 1) * limit1 + 1;
			int endRow = startRow + limit1 - 1;

			pstmt.setString(1, "MAINBOARD");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			mainBoardList = new ArrayList<Product>();

			while(rset.next()){
				Product p = new Product();
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setPrd_name(rset.getString("PRD_NAME"));
				p.setManufacturer(rset.getString("MANUFACTURER"));
				p.setCategory(rset.getString("CATEGORY"));

				mainBoardList.add(p);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		

		return mainBoardList;
	}
	
	public int getListCount(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("listCount");

		int listCount = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "CPU");

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
	
	public int getListCount1(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("listCount");

		int listCount1 = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "CPU");

			rset = pstmt.executeQuery();
			

			if(rset.next()){
				listCount1 = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}

		return listCount1;
	}
	
}
