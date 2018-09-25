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
	
	public ArrayList<Product> memoryList(Connection con, int currentPage2, int limit2) {
		PreparedStatement pstmt = null;
		ArrayList<Product> memoryList = null;

		ResultSet rset = null;

		String query = prop.getProperty("memoryImg");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage2 - 1) * limit2 + 1;
			int endRow = startRow + limit2 - 1;

			pstmt.setString(1, "MEMORY");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			memoryList = new ArrayList<Product>();

			while(rset.next()){
				Product p = new Product();
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setPrd_name(rset.getString("PRD_NAME"));
				p.setManufacturer(rset.getString("MANUFACTURER"));
				p.setCategory(rset.getString("CATEGORY"));

				memoryList.add(p);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		

		return memoryList;
	}
	
	public ArrayList<Product> graphicList(Connection con, int currentPage3, int limit3) {
		PreparedStatement pstmt = null;
		ArrayList<Product> graphicList = null;

		ResultSet rset = null;

		String query = prop.getProperty("graphicImg");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage3 - 1) * limit3 + 1;
			int endRow = startRow + limit3 - 1;

			pstmt.setString(1, "GRAPHIC");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			graphicList = new ArrayList<Product>();

			while(rset.next()){
				Product p = new Product();
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setPrd_name(rset.getString("PRD_NAME"));
				p.setManufacturer(rset.getString("MANUFACTURER"));
				p.setCategory(rset.getString("CATEGORY"));

				graphicList.add(p);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		

		return graphicList;
	}
	public ArrayList<Product> hddList(Connection con, int currentPage4, int limit4) {
		PreparedStatement pstmt = null;
		ArrayList<Product> hddList = null;

		ResultSet rset = null;

		String query = prop.getProperty("hddImg");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage4 - 1) * limit4 + 1;
			int endRow = startRow + limit4 - 1;

			pstmt.setString(1, "HDD");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			hddList = new ArrayList<Product>();

			while(rset.next()){
				Product p = new Product();
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setPrd_name(rset.getString("PRD_NAME"));
				p.setManufacturer(rset.getString("MANUFACTURER"));
				p.setCategory(rset.getString("CATEGORY"));

				hddList.add(p);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		

		return hddList;
	}
	public ArrayList<Product> oddList(Connection con, int currentPage5, int limit5) {
		PreparedStatement pstmt = null;
		ArrayList<Product> oddList = null;

		ResultSet rset = null;

		String query = prop.getProperty("oddImg");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage5 - 1) * limit5 + 1;
			int endRow = startRow + limit5 - 1;

			pstmt.setString(1, "ODD");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			oddList = new ArrayList<Product>();

			while(rset.next()){
				Product p = new Product();
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setPrd_name(rset.getString("PRD_NAME"));
				p.setManufacturer(rset.getString("MANUFACTURER"));
				p.setCategory(rset.getString("CATEGORY"));

				oddList.add(p);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		

		return oddList;
	}
	public ArrayList<Product> powerList(Connection con, int currentPage6, int limit6) {
		PreparedStatement pstmt = null;
		ArrayList<Product> powerList = null;

		ResultSet rset = null;

		String query = prop.getProperty("powerImg");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage6 - 1) * limit6 + 1;
			int endRow = startRow + limit6 - 1;

			pstmt.setString(1, "POWER");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			powerList = new ArrayList<Product>();

			while(rset.next()){
				Product p = new Product();
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setPrd_name(rset.getString("PRD_NAME"));
				p.setManufacturer(rset.getString("MANUFACTURER"));
				p.setCategory(rset.getString("CATEGORY"));

				powerList.add(p);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		

		return powerList;
	}
	public ArrayList<Product> coolList(Connection con, int currentPage7, int limit7) {
		PreparedStatement pstmt = null;
		ArrayList<Product> coolList = null;

		ResultSet rset = null;

		String query = prop.getProperty("collerImg");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage7 - 1) * limit7 + 1;
			int endRow = startRow + limit7 - 1;

			pstmt.setString(1, "COOL");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			coolList = new ArrayList<Product>();

			while(rset.next()){
				Product p = new Product();
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setPrd_name(rset.getString("PRD_NAME"));
				p.setManufacturer(rset.getString("MANUFACTURER"));
				p.setCategory(rset.getString("CATEGORY"));

				coolList.add(p);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		

		return coolList;
	}
	public ArrayList<Product> caseList(Connection con, int currentPage8, int limit8) {
		PreparedStatement pstmt = null;
		ArrayList<Product> caseList = null;

		ResultSet rset = null;

		String query = prop.getProperty("caseImg");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage8 - 1) * limit8 + 1;
			int endRow = startRow + limit8 - 1;

			pstmt.setString(1, "CASE");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			caseList = new ArrayList<Product>();

			while(rset.next()){
				Product p = new Product();
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setPrd_name(rset.getString("PRD_NAME"));
				p.setManufacturer(rset.getString("MANUFACTURER"));
				p.setCategory(rset.getString("CATEGORY"));

				caseList.add(p);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		

		return caseList;
	}
	
	//------------------------------------페이징----------------------------------------------------
	
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
			pstmt.setString(1, "MAINBOARD");

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
	public int getlistCount2(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("listCount2");

		int listCount2 = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "MEMORY");

			rset = pstmt.executeQuery();
			

			if(rset.next()){
				listCount2 = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}

		return listCount2;
	}
	
	public int getlistCount3(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("listCount3");

		int listCount3 = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "GRAPHIC");

			rset = pstmt.executeQuery();
			

			if(rset.next()){
				listCount3 = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}

		return listCount3;
	}
	
	public int getlistCount4(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("listCount4");

		int listCount4 = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "HDD");

			rset = pstmt.executeQuery();
			

			if(rset.next()){
				listCount4 = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}

		return listCount4;
	}
	
	public int getlistCount5(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("listCount5");

		int listCount5 = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "ODD");

			rset = pstmt.executeQuery();
			

			if(rset.next()){
				listCount5 = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}

		return listCount5;
	}
	
	public int getlistCount6(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("listCount6");

		int listCount6 = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "POWER");

			rset = pstmt.executeQuery();
			

			if(rset.next()){
				listCount6 = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}

		return listCount6;
	}
	
	public int getlistCount7(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("listCount7");

		int listCount7 = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "COOL");

			rset = pstmt.executeQuery();
			

			if(rset.next()){
				listCount7 = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}

		return listCount7;
	}
	
	public int getlistCount8(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("listCount8");

		int listCount8 = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "CASE");

			rset = pstmt.executeQuery();
			

			if(rset.next()){
				listCount8 = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}

		return listCount8;
	}
	
}
