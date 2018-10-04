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
	
	public HashMap<String, Object> infoImg(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("infoImg");
		System.out.println("쿼리 : " +query );
		HashMap<String, Object> infoImg = new HashMap<String, Object>();
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				Attachment a = new Attachment();
				a.setChangeName(rset.getString("change_name"));
				a.setOriginName(rset.getString("file_name"));
				a.setUploadDate(rset.getDate("upload_date"));
				a.setFilePath(rset.getString("save_route"));
				
				infoImg.put(rset.getString("prd_code"), a);
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);		
		}

		return infoImg;
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
	
	public HashMap<String, Object> imgList2(Connection con, String code) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap2 = null;
		
		Product p = null;
		Attachment at = null;
		ArrayList<Attachment> list = null;
		
		String query = prop.getProperty("imgDetailinfo");
		
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
			
			hmap2 = new HashMap<String, Object>();
			hmap2.put("product", p);
			hmap2.put("attachment", list);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(rset);
			close(pstmt);
		}
		
		
		return hmap2;
	}
	
	//------------------------------------상품리스트----------------------------------------------------
	public ArrayList<Product> prdList(Connection con, int currentPage, int limit, String category) {
		PreparedStatement pstmt = null;
		ArrayList<Product> prdList = null;
		ResultSet rset = null;

		String query = prop.getProperty("prdList");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setString(1, category);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			prdList = new ArrayList<Product>();

			while(rset.next()){
				Product p = new Product();
				
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setPrd_name(rset.getString("PRD_NAME"));
				p.setManufacturer(rset.getString("MANUFACTURER"));
				p.setCategory(rset.getString("CATEGORY"));
				
				prdList.add(p);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		
		return prdList;
	}
	
	
	//------------------------------------페이징----------------------------------------------------
	
	public int getListCount(Connection con, String category) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("listCount");

		int listCount = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, category);

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

	public ArrayList<Product> popularList(Connection con, int currentPage, int limit, String category) {
		PreparedStatement pstmt = null;
		ArrayList<Product> prdList = null;
		ResultSet rset = null;

		String query = prop.getProperty("popularList");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setString(1, category);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			prdList = new ArrayList<Product>();

			while(rset.next()){
				Product p = new Product();
				
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setPrd_name(rset.getString("PRD_NAME"));
				p.setManufacturer(rset.getString("MANUFACTURER"));
				p.setCategory(rset.getString("CATEGORY"));
				
				prdList.add(p);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		
		return prdList;
	}

	public ArrayList<Product> newList(Connection con, int currentPage, int limit, String category) {
		PreparedStatement pstmt = null;
		ArrayList<Product> prdList = null;
		ResultSet rset = null;

		String query = prop.getProperty("newList");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setString(1, category);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			prdList = new ArrayList<Product>();

			while(rset.next()){
				Product p = new Product();
				
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setPrd_name(rset.getString("PRD_NAME"));
				p.setManufacturer(rset.getString("MANUFACTURER"));
				p.setCategory(rset.getString("CATEGORY"));
				
				prdList.add(p);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		
		return prdList;
	}

	public ArrayList<Product> lowList(Connection con, int currentPage, int limit, String category) {
		PreparedStatement pstmt = null;
		ArrayList<Product> prdList = null;
		ResultSet rset = null;

		String query = prop.getProperty("lowPriceList");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setString(1, category);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			prdList = new ArrayList<Product>();

			while(rset.next()){
				Product p = new Product();
				
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setPrd_name(rset.getString("PRD_NAME"));
				p.setManufacturer(rset.getString("MANUFACTURER"));
				p.setCategory(rset.getString("CATEGORY"));
				
				prdList.add(p);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		
		return prdList;
	}

	public ArrayList<Product> highList(Connection con, int currentPage, int limit, String category) {
		PreparedStatement pstmt = null;
		ArrayList<Product> prdList = null;
		ResultSet rset = null;

		String query = prop.getProperty("highPriceList");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setString(1, category);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			prdList = new ArrayList<Product>();

			while(rset.next()){
				Product p = new Product();
				
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setPrd_name(rset.getString("PRD_NAME"));
				p.setManufacturer(rset.getString("MANUFACTURER"));
				p.setCategory(rset.getString("CATEGORY"));
				
				prdList.add(p);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		
		return prdList;
	}

	public ArrayList<Product> recommendList(Connection con, int currentPage, int limit, String category) {
		PreparedStatement pstmt = null;
		ArrayList<Product> prdList = null;
		ResultSet rset = null;

		String query = prop.getProperty("recommendList");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setString(1, category);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			prdList = new ArrayList<Product>();

			while(rset.next()){
				Product p = new Product();
				
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setPrd_name(rset.getString("PRD_NAME"));
				p.setManufacturer(rset.getString("MANUFACTURER"));
				p.setCategory(rset.getString("CATEGORY"));
				
				prdList.add(p);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		
		return prdList;
	}
	public ArrayList<Product> bestPrd(Connection con, String category) {
		PreparedStatement pstmt = null;
		ArrayList<Product> bestPrd = null;
		ResultSet rset = null;

		String query = prop.getProperty("bestPrd");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, category);

			rset = pstmt.executeQuery();

			bestPrd = new ArrayList<Product>();

			while(rset.next()){
				Product p = new Product();
				
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setPrd_name(rset.getString("PRD_NAME"));
				p.setManufacturer(rset.getString("MANUFACTURER"));
				p.setCategory(rset.getString("CATEGORY"));
				
				bestPrd.add(p);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		
		return bestPrd;
	}

}
