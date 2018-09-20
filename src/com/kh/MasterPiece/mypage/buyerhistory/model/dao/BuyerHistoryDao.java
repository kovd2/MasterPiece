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

	public ArrayList<BuyerHistory> viewHistory(Connection con, String writer) {
		PreparedStatement pstmt1 = null;
		ResultSet rset1 = null;
		
		
		ArrayList<BuyerHistory> list = new ArrayList<BuyerHistory>();
		
		String query1 = prop.getProperty("selectHistory1");

		
		try {
			pstmt1 = con.prepareStatement(query1);
			
			pstmt1.setString(1, writer);
			
			rset1 = pstmt1.executeQuery();
						
			while(rset1.next()){
				BuyerHistory b = new BuyerHistory();
				
				b.setBuyNo(rset1.getInt("buy_no"));
				b.setBuyStatus(rset1.getString("buy_status"));
				b.setDeliveryOption(rset1.getString("delivery_option"));
				b.setPayDate(rset1.getDate("pay_date"));
				b.setPrdCode(rset1.getString("prd_code"));
				b.setPrdName(rset1.getString("prd_name"));
				b.setOrderCheck(Integer.toString(rset1.getInt("order_check")));
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

}
