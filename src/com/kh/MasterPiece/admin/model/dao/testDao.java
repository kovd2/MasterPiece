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
import java.util.Calendar;
import java.util.HashMap;
import java.util.Properties;

import com.kh.MasterPiece.admin.model.vo.Promotion;
import com.kh.MasterPiece.admin.model.vo.Promotion_ATT;
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
				b.setBOARD_TYPE(rset.getInt("BOARD_TYPE"));
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


	public int getSelectBoardListCount(Connection con, int type) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("SelectBoardListCount");

		int listCount = 0;

		try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, type);
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


	public ArrayList<Board> selectBoardList2(Connection con, int currentPage, int limit, int type) {
		PreparedStatement pstmt = null;


		ResultSet rset = null;
		ArrayList<Board> list = null;


		String query = prop.getProperty("selectBoardList2");

		try {
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			pstmt.setInt(1, type);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Board>();

			while(rset.next()){
				Board b = new Board();
				b.setBOARD_ID(rset.getInt("BOARD_ID"));
				b.setBOARD_TITLE(rset.getString("BOARD_TITLE"));
				b.setBOARD_WRITER(rset.getString("BOARD_WRITER"));
				b.setBOARD_TYPE(rset.getInt("BOARD_TYPE"));
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


	public int boardInsert(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("boardInsert");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getBOARD_TITLE());
			pstmt.setString(2, b.getBOARD_CONTENT());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public Board boardDetail(Connection con, String id) {
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


	public int modifyBoard(Connection con, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("modifyBoard");
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getBOARD_TITLE());
			pstmt.setString(2, b.getBOARD_CONTENT());
			pstmt.setInt(3, b.getBOARD_ID());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}


	public ArrayList<Integer> monthSales(Connection con) {
		Calendar today = Calendar.getInstance();
		int month = (today.get(Calendar.MONTH)+1);
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Integer> list = new ArrayList<Integer>();
		
		String query = prop.getProperty("monthSales");
		
		try {
			pstmt = con.prepareStatement(query);
			if(month<7){
				pstmt.setInt(1, 1);
				pstmt.setInt(2, 6);
			}else{
				pstmt.setInt(1, 7);
				pstmt.setInt(2, 12);
			}
			rset = pstmt.executeQuery();
			int i = 0;
			while(rset.next()){
				int result = rset.getInt(2);
				list.add(result);
				i++;
			}
			for(; i < 6;i++){
				list.add(0);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public int insertPromotion(Connection con, String proTitle, String proUrl) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPromotion");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, proTitle);
			pstmt.setString(2, proUrl);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int insertAttachmentPromotion(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertPromotionAttachment");

		try {
			for(int i = 0; i < fileList.size(); i++){
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getChangeName());
				pstmt.setString(2, fileList.get(i).getOriginName());
				pstmt.setString(3, fileList.get(i).getFilePath());				

				result = pstmt.executeUpdate();

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}

		return result;
	}


	public int getPromotionListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("promotionListCount");

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


	public ArrayList<Promotion> selectPromotionList(Connection con, int currentPage, int limit) {
		PreparedStatement pstmt = null;

		ResultSet rset = null;
		ArrayList<Promotion> list = null;


		String query = prop.getProperty("promotionListpage");

		try {

			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			list = new ArrayList<Promotion>();

			while(rset.next()){
				
				Promotion p = new Promotion();
				
				p.setPromotion_No(rset.getString("PROMOTION_NO"));
				p.setPromotion_Title(rset.getString("PROMOTION_TITLE"));
				p.setPromotion_DATE(rset.getString("PROMOTION_DATE"));
				
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


	public Promotion promotionDetail(Connection con, String no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Promotion p = null;

		String query = prop.getProperty("promotionDetail");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, no);

			rset = pstmt.executeQuery();
	
			if(rset.next()){
				p = new Promotion();
				p.setPromotion_No(rset.getString("PROMOTION_NO"));
				p.setPromotion_Title(rset.getString("PROMOTION_TITLE"));
				p.setPromotion_DATE(rset.getString("PROMOTION_DATE"));
				p.setPromotion_URL(rset.getString("PROMOTION_URL"));
			}



		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}



		return p;
	}


	public Promotion_ATT promotion_ATTDetail(Connection con, String no) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Promotion_ATT pa = null;

		String query = prop.getProperty("promotion_ATTDetail");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, no);

			rset = pstmt.executeQuery();
	
			if(rset.next()){
				pa = new Promotion_ATT();
				pa.setFile_code(rset.getString("FILE_CODE"));
				pa.setChange_name(rset.getString("CHANGE_NAME"));
				pa.setFile_name(rset.getString("FILE_NAME"));
				pa.setUpload_date(rset.getString("UPLOAD_DATE"));
				pa.setSave_route(rset.getString("SAVE_ROUTE"));
				pa.setPromotion_no(rset.getString("PROMOTION_NO"));
			
			}



		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}



		return pa;
	}


	public int modifyPromotion(Connection con, String proTitle, String proUrl, String proNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("modifyPromotion");
		
		try {
			pstmt = con.prepareStatement(query);
			System.out.println();
			pstmt.setString(1, proTitle);
			pstmt.setString(2, proUrl);
			pstmt.setInt(3, Integer.parseInt(proNo));
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}


	public int modifyAttachmentPromotion(Connection con, ArrayList<Attachment> fileList, String proNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("modifyPromotionAttachment");

		try {
			for(int i = 0; i < fileList.size(); i++){
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getChangeName());
				pstmt.setString(2, fileList.get(i).getOriginName());
				pstmt.setString(3, fileList.get(i).getFilePath());		
				pstmt.setInt(4, Integer.parseInt(proNo));
				
				result = pstmt.executeUpdate();

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
		}

		return result;
	}


	public int newMemberCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("newMemberCount");
		
		int result = 0;
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()){
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return result;
	}


	public HashMap<String, Integer> sel_desc(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("sel_asc");
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			while(rset.next()){
				hmap.put(rset.getString(2), rset.getInt(3));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return hmap;
	}


	public HashMap<String, Integer> sel_asc(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("sel_asc");
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()){
				hmap.put(rset.getString(2), rset.getInt(3));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		return hmap;
	}

}
