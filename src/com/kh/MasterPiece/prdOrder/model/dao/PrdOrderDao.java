package com.kh.MasterPiece.prdOrder.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.MasterPiece.board.model.dao.BoardDao;
import com.kh.MasterPiece.prdOrder.model.vo.PrdOrder;
import static com.kh.MasterPiece.common.JDBCTemplate.*;

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
				p.setOrderCheck(rset.getString("order_check"));
				p.setOrderCount(rset.getInt("order_count"));
				
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
}
