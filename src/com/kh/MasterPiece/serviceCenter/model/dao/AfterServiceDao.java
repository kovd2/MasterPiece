package com.kh.MasterPiece.serviceCenter.model.dao;

import static com.kh.MasterPiece.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.MasterPiece.board.model.dao.BoardDao;
import com.kh.MasterPiece.serviceCenter.model.vo.AfterService;

public class AfterServiceDao
{
	Properties prop = new Properties();
	
	public AfterServiceDao()
	{
		String fileName = BoardDao.class.getResource("/sql/serviceCenter/serviceCenter-query.properties").getPath();
		
		try
		{
			prop.load(new FileReader(fileName));
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int insertAfterService(Connection conn, AfterService as)
	{
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAfterService");
		
		System.out.println("as : " + as);
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, as.getUserId());
			pstmt.setString(2, as.getPrdCode());
			pstmt.setString(3, as.getReason());
			pstmt.setString(4, as.getBoardContent());
			pstmt.setString(5, as.getHowToRegister());
			pstmt.setString(6, as.getBank());
			pstmt.setString(7, as.getBankNum());
			pstmt.setString(8, as.getBankUserName());
			
			result = pstmt.executeUpdate();
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			close(pstmt);
		}
		return result;
	}

	public ArrayList<AfterService> selectAfterServiceList(Connection conn)
	{
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<AfterService> list = null;
		
		String query = prop.getProperty("selectAfterServiceList");
		
		try
		{
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<AfterService>();
			
			while(rset.next())
			{
				AfterService as = new AfterService();
				
				as.setServiceNo(rset.getInt("service_no"));
				as.setUserId(rset.getString("user_id"));
				as.setPrdCode(rset.getString("prd_name"));
				as.setReason(rset.getString("category_name"));
				as.setBoardContent(rset.getString("board_content"));
				as.setHowToRegister(rset.getString("how_to_register"));
				as.setBank(rset.getString("bank"));
				as.setBankNum(rset.getString("bank_num"));
				as.setBankUserName(rset.getString("bank_user_name"));
				as.setBoardDate(rset.getDate("board_date"));
				as.setBoardStatus(rset.getString("board_status"));
				
				list.add(as);
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			close(rset);
			close(stmt);
		}
		return list;
	}

	public AfterService selectServiceCenterExchangeOne(Connection conn, int serviceNo)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		AfterService af = null;
		
		String query = prop.getProperty("selectServiceCenterExchangeOne");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, serviceNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				af = new AfterService();
				
				af.setServiceNo(rset.getInt("service_no"));
				af.setUserId(rset.getString("user_id"));
				af.setPrdCode(rset.getString("prd_name"));
				af.setReason(rset.getString("category_name"));
				af.setBoardContent(rset.getString("board_content"));
				af.setHowToRegister(rset.getString("how_to_register"));
				af.setBank(rset.getString("bank"));
				af.setBankNum(rset.getString("bank_num"));
				af.setBankUserName(rset.getString("bank_user_name"));
				af.setBoardDate(rset.getDate("board_date"));
				af.setBoardStatus(rset.getString("board_status"));
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			close(rset);
			close(pstmt);
		}
		
		return af;
	}
}
