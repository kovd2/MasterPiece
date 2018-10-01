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

import com.kh.MasterPiece.admin.model.vo.Promotion;
import com.kh.MasterPiece.admin.model.vo.Promotion_ATT;
import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.board.model.vo.Board;
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

	//그래픽 페이징 처리 메소드
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

	//그래픽 리스트 불러오는 메소드
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

	//CPU 페이징 처리 메소드
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
	
	//CPU 리스트 불러오는 메소드
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

	//이미지 불러오는 메소드
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
	
	//모든 상품 불러오는 메소드
	public ArrayList<Product> allList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Product> list = new ArrayList<>();
		
		String query = prop.getProperty("allList");
		
		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
			
			while(rset.next()){
				Product allList = new Product();
				
				allList.setPrd_code(rset.getString("PRD_CODE"));
				allList.setPrice(rset.getInt("PRICE"));
				allList.setPrd_name(rset.getString("prd_name"));
				allList.setCategory(rset.getString("category"));
				
				list.add(allList);
				
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}
	
	//메인 배너
	public ArrayList<Board> mainBanner(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		ArrayList<Board> banner= new ArrayList<>();

		String query = prop.getProperty("mainBanner");

		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();

			while(rset.next()){
				Board b = new Board();
				
				b.setBOARD_CATEGORY(rset.getString("category"));
				
				
				banner.add(b);
				
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return banner;
	}
	
	//검색한 상품
	public ArrayList<Product> searchList(Connection con, String search, int currentPage, int limit) {
		PreparedStatement pstmt = null;
		ArrayList<Product> searchList = null;

		ResultSet rset = null;

		String query = prop.getProperty("searchList");

		try {
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setString(1, search);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			searchList = new ArrayList<Product>();

			while(rset.next()){
				Product p = new Product();
				
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setPrice(rset.getInt("PRICE"));
				p.setPrd_name(rset.getString("prd_name"));
				p.setCategory(rset.getString("category"));

				searchList.add(p);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		

		return searchList;
	}
	
	//검색한 상품 페이징 처리
	public int searchCount(Connection con, String search) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("searchCount");

		int listCount = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, search);
	
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
	
	//프로모션 리스트
	public ArrayList<Promotion> promotionList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Promotion> list = new ArrayList();

		String query = prop.getProperty("promotionList");

		try {
			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();
	
			while(rset.next()){
				Promotion p = new Promotion();
				p.setPromotion_No(rset.getString("PROMOTION_NO"));
				p.setPromotion_Title(rset.getString("PROMOTION_TITLE"));
				p.setPromotion_DATE(rset.getString("PROMOTION_DATE"));
				p.setPromotion_URL(rset.getString("PROMOTION_URL"));
				
				list.add(p);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}
	
	//프로모션 이미지
	public HashMap<String, Promotion_ATT> promotionImageList(Connection con) {
		PreparedStatement pstmt = null;
		HashMap<String, Promotion_ATT> list = null;

		ResultSet rset = null;

		String query = prop.getProperty("promotionImageList");
		System.out.println(query);
		try {
			pstmt = con.prepareStatement(query);

			rset = pstmt.executeQuery();

			list = new HashMap<String, Promotion_ATT>();

			while(rset.next()){
				Promotion_ATT pa = new Promotion_ATT();
				
				pa.setFile_code(rset.getString("FILE_CODE"));
				pa.setChange_name(rset.getString("CHANGE_NAME"));
				pa.setFile_name(rset.getString("FILE_NAME"));
				pa.setUpload_date(rset.getString("UPLOAD_DATE"));
				pa.setSave_route(rset.getString("SAVE_ROUTE"));
				pa.setPromotion_no(rset.getString("PROMOTION_NO"));
				
				list.put(rset.getString("PROMOTION_NO"), pa);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		

		return list;
	}
}
















