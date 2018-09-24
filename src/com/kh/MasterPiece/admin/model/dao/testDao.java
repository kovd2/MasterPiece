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

import javax.swing.plaf.basic.BasicTabbedPaneUI;

import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.board.model.vo.Board;
import com.kh.MasterPiece.member.model.vo.Member;
import com.kh.MasterPiece.mypage.buyerhistory.model.vo.BuyerHistory;
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


	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("listCount");

		int listCount = 0;

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if(rset.next()){
				listCount = rset.getInt(1);
			}



		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);

		}



		return listCount;
	}


	public ArrayList<Product> selectList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;


		ResultSet rset = null;
		ArrayList<Product> list = null;


		String query = prop.getProperty("listpage");

		try {
			//페이징 처리 전
			//stmt = con.createStatement();
			//rset = stmt.executeQuery(query);

			//페이징처리 후
			pstmt = con.prepareStatement(query);

			//조회 시작할 행 번호와 마지막 행 번호 계산
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Product>();

			while(rset.next()){
				Product b = new Product();

				b.setPrd_code(rset.getString("prd_code"));
				b.setManufacturer(rset.getString("MANUFACTURER"));
				b.setPrice(rset.getInt("PRICE"));
				b.setPrd_name(rset.getString("PRD_NAME"));
				b.setRelease_date(rset.getDate("RELEASE_DATE"));
				b.setCategory(rset.getString("CATEGORY"));
				b.setSell_count(rset.getInt("SELL_COUNT"));
				b.setStock(rset.getInt("STOCK"));

				list.add(b);
			}



		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//close(stmt);
			close(pstmt);
			close(rset);
		}



		return list;
	}


	public int getCategoryListCount(Connection con, String code) {
		//Statement stmt = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("categoryListCount");

		int listCount = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, code);

			rset = pstmt.executeQuery();

			if(rset.next()){
				listCount = rset.getInt(1);
			}



		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);

		}



		return listCount;
	}


	public ArrayList<Product> selectCategoryList(Connection con, int currentPage, int limit, String code) {
		PreparedStatement pstmt = null;


		ResultSet rset = null;
		ArrayList<Product> list = null;


		String query = prop.getProperty("categorylistpage");

		try {
			//페이징 처리 전
			//stmt = con.createStatement();
			//rset = stmt.executeQuery(query);

			//페이징처리 후
			pstmt = con.prepareStatement(query);

			//조회 시작할 행 번호와 마지막 행 번호 계산
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setString(1, code);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Product>();

			while(rset.next()){
				Product b = new Product();

				b.setPrd_code(rset.getString("prd_code"));
				b.setManufacturer(rset.getString("MANUFACTURER"));
				b.setPrice(rset.getInt("PRICE"));
				b.setPrd_name(rset.getString("PRD_NAME"));
				b.setRelease_date(rset.getDate("RELEASE_DATE"));
				b.setCategory(rset.getString("CATEGORY"));
				b.setSell_count(rset.getInt("SELL_COUNT"));
				b.setStock(rset.getInt("STOCK"));

				list.add(b);
			}



		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//close(stmt);
			close(pstmt);
			close(rset);
		}



		return list;
	}


	public int getMemberListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("memberlistCount");

		int listCount = 0;

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if(rset.next()){
				listCount = rset.getInt(1);
			}



		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);

		}



		return listCount;
	}


	public ArrayList<Member> selectMemberList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;


		ResultSet rset = null;
		ArrayList<Member> list = null;


		String query = prop.getProperty("memberlistpage");

		try {
			//페이징 처리 전
			//stmt = con.createStatement();
			//rset = stmt.executeQuery(query);

			//페이징처리 후
			pstmt = con.prepareStatement(query);

			//조회 시작할 행 번호와 마지막 행 번호 계산
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Member>();

			while(rset.next()){
				Member b = new Member();
				b.setUserNo(rset.getInt("USER_NO"));
				b.setUserType(rset.getString("USER_TYPE"));
				b.setUserName(rset.getString("USER_NAME"));
				b.setUserId(rset.getString("USER_ID"));
				b.setUserPwd(rset.getString("USER_PWD"));
				b.setPhone(rset.getString("PHONE"));
				b.setAddress(rset.getString("ADDRESS"));
				b.setEmail(rset.getString("EMAIL"));
				b.setStatus(rset.getString("STATUS"));

				list.add(b);
			}



		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//close(stmt);
			close(pstmt);
			close(rset);
		}



		return list;
	}


	public int deleteMember(Connection con, int code) {
		PreparedStatement pstmt = null;

		String query = prop.getProperty("deleteMember");

		int result = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, code);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}



		return result;
	}


	public ArrayList<Member> searchMemberList(Connection con, String code, String val) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = null;


		String query = null;
		if(code.equals("회원ID")){
			query = prop.getProperty("searchIdMember");
		}else if(code.equals("성명")){
			query = prop.getProperty("searchNameMember");
		}else{
			query = prop.getProperty("searchEmailMember");
		}

		try {
			pstmt = con.prepareStatement(query);
			System.out.println(query);
			pstmt.setString(1, "%"+val+"%");
			
			
			rset = pstmt.executeQuery();

			list = new ArrayList<Member>();

			while(rset.next()){
				Member b = new Member();
				b.setUserNo(rset.getInt("USER_NO"));
				b.setUserType(rset.getString("USER_TYPE"));
				b.setUserName(rset.getString("USER_NAME"));
				b.setUserId(rset.getString("USER_ID"));
				b.setUserPwd(rset.getString("USER_PWD"));
				b.setPhone(rset.getString("PHONE"));
				b.setAddress(rset.getString("ADDRESS"));
				b.setEmail(rset.getString("EMAIL"));
				b.setStatus(rset.getString("STATUS"));

				list.add(b);
			}



		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//close(stmt);
			close(pstmt);
			close(rset);
		}



		return list;
	}


	public int deleteProduct(Connection con, String[] values) {
		PreparedStatement pstmt = null;

		String query = prop.getProperty("deleteProduct");

		int result = 0;

		try {
			for(int i = 0; i < values.length; i++){
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, values[i]);
				result += pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}


		return result;
	}


	public int getOrderListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("OrderListCount");

		int listCount = 0;

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if(rset.next()){
				listCount = rset.getInt(1);
			}



		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);

		}



		return listCount;
	}


	public ArrayList<BuyerHistory> selectOrderList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;


		ResultSet rset = null;
		ArrayList<BuyerHistory> list = null;


		String query = prop.getProperty("selectOrderList");

		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<BuyerHistory>();

			while(rset.next()){
				BuyerHistory b = new BuyerHistory();

				list.add(b);
			}



		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}



		return list;
	}


	public int getQuestionListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("QuestionListCount");

		int listCount = 0;

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if(rset.next()){
				listCount = rset.getInt(1);
			}



		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);

		}



		return listCount;
	}


	public ArrayList<Board> selectQuestionList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;


		ResultSet rset = null;
		ArrayList<Board> list = null;


		String query = prop.getProperty("selectQuestionList");

		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Board>();

			while(rset.next()){
				Board b = new Board();
				b.setBOARD_ID(rset.getInt("BOARD_ID"));
				b.setBOARD_TITLE(rset.getString("BOARD_TITLE"));
				b.setBOARD_WRITER(rset.getString("BOARD_WRITER"));
				list.add(b);
			}



		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}



		return list;
	}


	public Board questionDetail(Connection con, String id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;

		String query = prop.getProperty("questionDetail");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);

			rset = pstmt.executeQuery();
	
			if(rset.next()){
				b = new Board();
				b.setBOARD_ID(rset.getInt("BOARD_ID"));
				b.setBOARD_TITLE(rset.getString("BOARD_TITLE"));
				b.setBOARD_WRITER(rset.getString("BOARD_WRITER"));
				b.setBOARD_TYPE(3);
				b.setBOARD_CONTENT(rset.getString("BOARD_CONTENT"));
				b.setBOARD_LEVEL(1);
				b.setBOARD_STATUS(rset.getString("BOARD_STATUS"));
			}



		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}



		return b;
	}



	public Member getep(Connection con, String id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m = null;

		String query = prop.getProperty("getep");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);

			rset = pstmt.executeQuery();
	
			if(rset.next()){
				m = new Member();
				m.setEmail(rset.getString("EMAIL"));
				m.setPhone(rset.getString("PHONE"));
			}



		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}



		return m;
	}


	public int answer(Connection con, int id, String content) {
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		String query = prop.getProperty("answerInsert");
		String query2 = prop.getProperty("questionUpdate");

		int result = 0;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, content);
			pstmt.setInt(2, id);
			
			result = pstmt.executeUpdate();
			if(result>0){
				pstmt2 = con.prepareStatement(query2);
				pstmt2.setInt(1, id);
				
				result += pstmt2.executeUpdate();
			}
			
			
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}


		return result;
	}


	public int getBoardListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("BoardListCount");

		int listCount = 0;

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if(rset.next()){
				listCount = rset.getInt(1);
			}



		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);

		}



		return listCount;
	}


	public ArrayList<Board> getBoardListCount(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;


		ResultSet rset = null;
		ArrayList<Board> list = null;


		String query = prop.getProperty("selectBoardListCount");

		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Board>();

			while(rset.next()){
				Board b = new Board();
				b.setBOARD_ID(rset.getInt("BOARD_ID"));
				b.setBOARD_TITLE(rset.getString("BOARD_TITLE"));
				b.setBOARD_WRITER(rset.getString("BOARD_WRITER"));
				list.add(b);
			}



		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}



		return list;
	}

}
