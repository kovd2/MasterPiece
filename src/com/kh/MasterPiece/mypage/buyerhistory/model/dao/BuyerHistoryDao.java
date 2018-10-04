package com.kh.MasterPiece.mypage.buyerhistory.model.dao;

import static com.kh.MasterPiece.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.mypage.buyerhistory.model.vo.BuyerHistory;
import com.kh.MasterPiece.mypage.review.model.vo.Review;



public class BuyerHistoryDao {
	
	private Properties prop = new Properties();
	
	public BuyerHistoryDao(){
		String fileName = BuyerHistoryDao.class.getResource("/sql/mypage/mypage-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<BuyerHistory> viewHistory(Connection con, String writer, int currentPage, int limit) {
		PreparedStatement pstmt1 = null;
		ResultSet rset1 = null;
		
		
		ArrayList<BuyerHistory> list = new ArrayList<BuyerHistory>();
		
		String query1 = prop.getProperty("H_selectHistory");

		
		try {
			pstmt1 = con.prepareStatement(query1);
			
			int startRow = (currentPage - 1) * limit +1;
			int endRow = startRow + limit - 1;
			
			pstmt1.setString(1, writer);
			pstmt1.setInt(2, startRow);
			pstmt1.setInt(3, endRow);
			
			rset1 = pstmt1.executeQuery();
						
			while(rset1.next()){
				BuyerHistory b = new BuyerHistory();
				
				
				
				b.setOrderCheck(rset1.getString("order_check"));
				b.setBuyStatus(rset1.getString("buy_status"));
				b.setDeliveryOption(rset1.getString("delivery_option"));
				b.setPayDate(rset1.getDate("pay_date"));
				b.setPrdCode(rset1.getString("prd_code"));
				b.setPrdName(rset1.getString("prd_name"));
				b.setPayPrice(rset1.getInt("pay_price"));
				b.setOrderCount(rset1.getInt("order_count"));
				b.setPayType(rset1.getString("pay_type"));
				
				list.add(b);
			}
					
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally{
			close(rset1);
			close(pstmt1);
		}
		return list;
	}

	
	
	public HashMap<String, Attachment> imageList(Connection con) {
		PreparedStatement pstmt1 = null;
		ResultSet rset1 = null;
		
		
		HashMap<String, Attachment> list = new HashMap<String, Attachment>();
		
		String query1 = prop.getProperty("selectAttachment");

		
		try {
			pstmt1 = con.prepareStatement(query1);				
			rset1 = pstmt1.executeQuery();
						
			while(rset1.next()){
				Attachment a = new Attachment();
				
				a.setChangeName(rset1.getString("change_name"));
				a.setOriginName(rset1.getString("file_name"));
				a.setUploadDate(rset1.getDate("upload_date"));
				a.setFilePath(rset1.getString("save_route"));
				
				list.put(rset1.getString("prd_code"), a);
			}
					
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally{
			close(rset1);
			close(pstmt1);
		}
		return list;
	}

	public HashMap<String, BuyerHistory> viewHistory2(Connection con, String writer) {
		
		PreparedStatement pstmt1 = null;
		ResultSet rset1 = null;
		
		
		HashMap<String, BuyerHistory> list = new HashMap<String, BuyerHistory>();
		
		String query1 = prop.getProperty("selectHistory2");

		
		try {
			pstmt1 = con.prepareStatement(query1);				
			
			pstmt1.setString(1, writer);
			
			rset1 = pstmt1.executeQuery();
						
			
			
			while(rset1.next()){
				BuyerHistory b = new BuyerHistory();
				
				b.setPayPrice(rset1.getInt("pay_price"));
				b.setOrderCount(rset1.getInt("order_count"));
				
				list.put(rset1.getString("order_check"), b);
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset1);
			close(pstmt1);
		}
		return list;
	}

	//getCount 페이징처리
	public int getListCount(String writer, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("H_listCount");

		int listCount = 0;

		try {
			pstmt =  con.prepareStatement(query);
			pstmt.setString(1, writer);
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


	public HashMap<String, Attachment> imageList2(Connection con)
	{
		PreparedStatement pstmt1 = null;
		ResultSet rset1 = null;
		
		
		HashMap<String, Attachment> list = new HashMap<String, Attachment>();
		
		String query1 = prop.getProperty("selectAttachment2");
		
		try
		{
			pstmt1 = con.prepareStatement(query1);				
			rset1 = pstmt1.executeQuery();
						
			while(rset1.next())
			{
				Attachment a = new Attachment();
				
				a.setChangeName(rset1.getString("change_name"));
				a.setOriginName(rset1.getString("file_name"));
				a.setUploadDate(rset1.getDate("upload_date"));
				a.setFilePath(rset1.getString("save_route"));
				a.setCode(rset1.getString("prd_name"));
				
				list.put(a.getCode(), a);
			}	
		}
		catch (SQLException e){
			e.printStackTrace();
		}
		finally
		{
			close(rset1);
			close(pstmt1);
		}
		return list;
	}

	public BuyerHistory viewHistoryOne(Connection conn, String userId)
	{
		PreparedStatement pstmt = null;
		BuyerHistory bh = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("viewHistoryOne");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				bh = new BuyerHistory();
			}
		}
		catch (SQLException e) {

			e.printStackTrace();
		}
		
		return bh;
	}

	public ArrayList<BuyerHistory> selectList(String writer, int searchType, String searchText, int currentPage,int limit, Connection con) {

		PreparedStatement pstmt = null;
		ArrayList<BuyerHistory> searchList = null;

		ResultSet rset = null;


		try {if(searchType == 1){
			
			String query = prop.getProperty("H_searchList1");
			pstmt = con.prepareStatement(query);

			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setString(1, writer);
			pstmt.setString(2, searchText);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
		}else{
			
			String query = prop.getProperty("H_searchList2");
			pstmt = con.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setString(1, writer);
			pstmt.setString(2, searchText);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
		}
			rset = pstmt.executeQuery();

			searchList = new ArrayList<BuyerHistory>();

			while(rset.next()){
				BuyerHistory b = new BuyerHistory();

				b.setOrderCheck(rset.getString("order_check"));
				b.setBuyStatus(rset.getString("buy_status"));
				b.setDeliveryOption(rset.getString("delivery_option"));
				b.setPayDate(rset.getDate("pay_date"));
				b.setPrdCode(rset.getString("prd_code"));
				b.setPrdName(rset.getString("prd_name"));
				b.setPayPrice(rset.getInt("pay_price"));
				b.setOrderCount(rset.getInt("order_count"));
				b.setPayType(rset.getString("pay_type"));
				
				searchList.add(b);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		
		return searchList;
	}

	public int searchCount(Connection con, String writer, int searchType, String searchText) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		int listCount = 0;

		try {if(searchType ==1){
			String query = prop.getProperty("H_searchCount1");
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, writer);
			pstmt.setString(2, searchText);

			
		}else{
			String query = prop.getProperty("H_searchCount2");
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, writer);
			pstmt.setString(2, searchText);

		}
			
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

	public HashMap<String, String> invoiceNo(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;


		HashMap<String, String> list = new HashMap<String, String>();

		String query = prop.getProperty("invoiceNo");


		try {
			pstmt = con.prepareStatement(query);      

			rset = pstmt.executeQuery();



			while(rset.next()){
				list.put(rset.getString("ORDER_CHECK"), rset.getString("INVOICE_NO"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<BuyerHistory> SearchDateList(String writer, String date, int currentPage, int limit, Connection con) {
		
		
		PreparedStatement pstmt = null;
		ArrayList<BuyerHistory> searchList = null;

		ResultSet rset = null;


		try {
			if(date.equals("yesterday")){


				String query = prop.getProperty("H_searchYesterday");
				pstmt = con.prepareStatement(query);

				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;

				pstmt.setString(1, writer);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

			}else if(date.equals("today")){

				String query = prop.getProperty("H_searchToday");
				pstmt = con.prepareStatement(query);

				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;

				pstmt.setString(1, writer);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

			}else if(date.equals("aweek")){
				String query = prop.getProperty("H_searchAweek");
				pstmt = con.prepareStatement(query);

				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;

				pstmt.setString(1, writer);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

			}else if(date.equals("amonth")){
				String query = prop.getProperty("H_searchAmonth");
				pstmt = con.prepareStatement(query);

				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;

				pstmt.setString(1, writer);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

			}else if(date.equals("sixmonth")){
				String query = prop.getProperty("H_searchSixmonth");
				pstmt = con.prepareStatement(query);

				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;

				pstmt.setString(1, writer);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

			}else if(date.equals("ayear")){
				String query = prop.getProperty("H_searchAyear");
				pstmt = con.prepareStatement(query);

				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;

				pstmt.setString(1, writer);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);

			}
			
			rset = pstmt.executeQuery();

			searchList = new ArrayList<BuyerHistory>();

			while(rset.next()){
				
				BuyerHistory b = new BuyerHistory();

				b.setOrderCheck(rset.getString("order_check"));
				b.setBuyStatus(rset.getString("buy_status"));
				b.setDeliveryOption(rset.getString("delivery_option"));
				b.setPayDate(rset.getDate("pay_date"));
				b.setPrdCode(rset.getString("prd_code"));
				b.setPrdName(rset.getString("prd_name"));
				b.setPayPrice(rset.getInt("pay_price"));
				b.setOrderCount(rset.getInt("order_count"));
				b.setPayType(rset.getString("pay_type"));
				
				searchList.add(b);
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}		
		return searchList;
	}


}
