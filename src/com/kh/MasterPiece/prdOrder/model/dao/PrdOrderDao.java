package com.kh.MasterPiece.prdOrder.model.dao;

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

import com.kh.MasterPiece.board.model.dao.BoardDao;
import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.prdOrder.model.vo.PrdOrder;

public class PrdOrderDao
{
	Properties prop = new Properties();
	
	public PrdOrderDao()
	{
		String fileName = BoardDao.class.getResource("/sql/prdOrder/prdOrder-query.properties").getPath();
		
		try
		{
			prop.load(new FileReader(fileName));
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public ArrayList<PrdOrder> selectPrdOrder(Connection conn, String userId)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<PrdOrder> list = null;
		
		String query = prop.getProperty("selectPrdOrder");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<PrdOrder>();
			
			while(rset.next())
			{
				PrdOrder p = new PrdOrder();
				
				p.setOrderDate(rset.getDate("order_date"));
				p.setPrdCode(rset.getString("prd_code"));
				p.setPrdName(rset.getString("prd_name"));
				p.setCategory(rset.getString("category"));
				p.setOrderCheck(rset.getString("order_check"));
				p.setOrderCount(rset.getInt("order_count"));
				p.setPrice(rset.getInt("price"));
				p.setContent(rset.getString("content"));
				
				list.add(p);
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
		return list;
	}

	public HashMap<String, Attachment> imageList(Connection conn)
	{
		Statement stmt = null;
		ResultSet rset = null;
		
		HashMap<String, Attachment> imageList = null;
		
		String query = prop.getProperty("imageList");
		
		try
		{
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			imageList = new HashMap<String, Attachment>();
			
			while(rset.next())
			{
				Attachment am = new Attachment();
				
				am.setChangeName(rset.getString("change_name"));
				am.setOriginName(rset.getString("file_name"));
				am.setUploadDate(rset.getDate("upload_date"));
				am.setFilePath(rset.getString("save_route"));
				am.setCode(rset.getString("prd_code"));
				
				/*imageList.put(am.getCode(), am);*/
				imageList.put(am.getCode(), am);
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
		
		return imageList;
	}
}
