package com.kh.MasterPiece.main.model.dao;


import static com.kh.MasterPiece.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.main.model.vo.MainTest;
import com.kh.MasterPiece.product.model.vo.Product;

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

	public ArrayList<HashMap<String, Object>> selectGraphicList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		Statement stmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectGraphicMap");

		try {
			pstmt = con.prepareStatement(query);
			stmt = con.createStatement();

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = stmt.executeQuery(query);

			list = new ArrayList<HashMap<String, Object>>();

			while(rset.next()){
				hmap.put("prdCode", rset.getString("PRD_CODE"));
				hmap.put("manufacturer", rset.getString("MANUFACTURER"));
				hmap.put("price", rset.getInt("PRICE"));
				hmap.put("prdName", rset.getString("PRD_NAME"));
				hmap.put("releaseDate", rset.getDate("RELEASE_DATE"));
				hmap.put("category", rset.getString("CATEGORY"));
				hmap.put("sellCount", rset.getInt("SELL_COUNT"));
				hmap.put("stock", rset.getInt("STOCK"));

				list.add(hmap);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(stmt);
			close(rset);
		}		

		return list;
	}

	//GRAPHIC
	public int getListCount1(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("listCount");

		int listCount = 0;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "GRAPHIC");
			
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

	//GRAPHIC
	public ArrayList<Product> graphicList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ArrayList<Product> list = null;

		ResultSet rset = null;

		String query = prop.getProperty("selectList");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setString(1, "GRAPHIC");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Product>();

			while(rset.next()){
				Product p = new Product();
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setPrice(rset.getInt("price"));
				p.setPrd_name(rset.getString("prd_name"));
				p.setCategory(rset.getString("category"));

				list.add(p);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		

		return list;
	}

	//CPU
	public int getListCount2(Connection con) {
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
	
	//CPU
	public ArrayList<Product> cpuList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ArrayList<Product> list = null;

		ResultSet rset = null;

		String query = prop.getProperty("selectList");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setString(1, "CPU");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Product>();

			while(rset.next()){
				Product p = new Product();
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setPrice(rset.getInt("price"));
				p.setPrd_name(rset.getString("prd_name"));
				p.setCategory(rset.getString("category"));

				list.add(p);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		

		return list;
	}


	public HashMap<String, Attachment> selectImageList(Connection con) {
		PreparedStatement pstmt = null;
		HashMap<String, Attachment> list = null;

		ResultSet rset = null;

		String query = prop.getProperty("selectImageList");
		System.out.println(query);
		try {
			pstmt = con.prepareStatement(query);

			rset = pstmt.executeQuery();

			list = new HashMap<String, Attachment>();

			while(rset.next()){
				Attachment a = new Attachment();
				a.setChangeName(rset.getString("change_name"));

				list.put(rset.getString("prd_code"), a);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		

		return list;
	}

	public ArrayList<HashMap<String, Object>> selectImgList(Connection con) {

		return null;
	}


}






















