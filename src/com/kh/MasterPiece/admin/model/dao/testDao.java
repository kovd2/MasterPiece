package com.kh.MasterPiece.admin.model.dao;



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


public class testDao {
	private Properties prop = new Properties();

	public testDao() {
		String fileName = testDao.class.getResource("/sql/admin/admin-query.properties").getPath();
	
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	public int[] Count(Connection con){
		Statement stmt = null;
		ResultSet rset = null;
		Statement stmt2 = null;
		ResultSet rset2 = null;		
		String query = prop.getProperty("selectCount");
		
		int[] result = {0,0,0,0};
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			int i = 0;
			while(rset.next()){
				result[i] = rset.getInt(2);
				i++;
			}
			
			query = prop.getProperty("selectCount2");
			stmt2 = con.createStatement();
			rset2 = stmt2.executeQuery(query);
			while(rset2.next()){
				result[i] = rset2.getInt(2);
				i++;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
			close(stmt2);
			close(rset2);
			
		}
		
		
		
		return result;
		
	}


	public HashMap<String, String[]> selectList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectList1");
		HashMap<String, String[]> hmap = new HashMap<String, String[]>();
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			String[] str = new String[4];
			int i = 0;
			while(rset.next()){
				str[i] = rset.getString("BOARD_TITLE");
				i++;	
				if(i>3)break;
			}
			System.out.println(str[0]);
			hmap.put("a", str);
			close(stmt);
			close(rset);
			query = prop.getProperty("selectList2");
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			str = new String[4];
			i = 0;
			while(rset.next()){
				str[i] = rset.getString("BOARD_TITLE");
				i++;	
				if(i>3)break;
			}
			System.out.println(str);
			hmap.put("b", str);
			close(stmt);
			close(rset);
			query = prop.getProperty("selectList3");
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			str = new String[4];
			i = 0;
			while(rset.next()){
				str[i] = rset.getString("BOARD_TITLE");
				i++;				
				if(i>3)break;
			}
			System.out.println(str);
			hmap.put("c", str);
			//a 공지사항
			//b 문의
			//c 견적
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
			
		}
		
		
		return hmap;
	}


	public ArrayList<Product> productList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("productList");
		
		ArrayList<Product> list = new ArrayList<Product>();
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			//PRD_NAME, PRD_CODE, STOCK, PRICE, CATEGORY
			while(rset.next()){
				Product p = new Product();
				p.setPrd_name(rset.getString("PRD_NAME"));
				p.setPrd_code(rset.getString("PRD_CODE"));
				p.setStock(rset.getInt("STOCK"));
				p.setPrice(rset.getInt("PRICE"));
				p.setCategory(rset.getString("CATEGORY"));
				
				list.add(p);
			}
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);		
		}
		
		
		
		return list;
	}


	public int insertAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		
			try {
				for(int i = 0; i < fileList.size(); i++){
					pstmt = con.prepareStatement(query);
					pstmt.setString(1, fileList.get(i).getChangeName());
					pstmt.setString(2, fileList.get(i).getOriginName());
					pstmt.setString(3, fileList.get(i).getFilePath());
					int level = 0;
					if(i == 0) level = 0;
					else level = 1;
					pstmt.setInt(4, level);
					pstmt.setString(5, fileList.get(i).getCode());
					
					result += pstmt.executeUpdate();
					
				}
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				close(pstmt);
			}
		
		return result;
	}


	public int insertProduct(Connection con, Product p) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, p.getPrd_code());
			pstmt.setString(2, p.getManufacturer());
			pstmt.setInt(3, p.getPrice());
			pstmt.setString(4, p.getPrd_name());
			pstmt.setString(5, p.getCategory());
			pstmt.setInt(6, p.getStock());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}


	public HashMap<String, Attachment> imgList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("imgList");
		
		HashMap<String, Attachment> imgList = new HashMap<String, Attachment>();
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			//CHANGE_NAME, FILE_NAME, UPLOAD_DATE, SAVE_ROUTE, FILE_LEVEL, PRD_CODE
			int i = 0;
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
