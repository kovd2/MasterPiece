package com.kh.MasterPiece.board.model.dao;

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

import com.kh.MasterPiece.board.model.vo.Board;

public class BoardDao
{
	Properties prop = new Properties();
	
	public BoardDao()
	{
		String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		
		try
		{
			prop.load(new FileReader(fileName));
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int insertQuoteContactContent(Connection conn, Board b)
	{
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertQuoteContact");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getBOARD_PWD());
			pstmt.setString(2, b.getBOARD_TITLE());
			pstmt.setString(3, b.getBOARD_CONTENT());
			pstmt.setString(4, b.getBOARD_WRITER());
			
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
	
	public int selectCurrval(Connection conn)
	{
		Statement stmt = null;
		ResultSet rset = null;
		int boardId = 0;
		
		String query = prop.getProperty("selectCurrval");
		
		try
		{
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next())
			{
				boardId = rset.getInt("currval");
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
		return boardId;
	}
	public int getQuoteContactListCount(Connection conn)
	{
		Statement stmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("quoteContactListCount");
		
		int listCount = 0;
		
		try
		{
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next())
			{
				listCount = rset.getInt(1);
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
		
		return listCount;
	}
	public ArrayList<Board> selectQuoteContactList(Connection conn, int currentPage, int limit)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectQuoteContactList");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next())
			{
				Board b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_TYPE(rset.getInt("board_type"));
				b.setBOARD_PWD(rset.getString("board_pwd"));
				b.setBOARD_NO(rset.getInt("board_no"));
				b.setBOARD_CATEGORY(rset.getString("board_category"));
				b.setBOARD_TITLE(rset.getString("board_title"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				b.setBOARD_DATE(rset.getDate("board_date"));
				b.setBOARD_STATUS(rset.getString("board_status"));
				b.setQUE_STATUS(rset.getString("que_status"));
				
				list.add(b);
			}
			System.out.println("list : " + list);
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
	public Board selectQuoteContactOne(Connection conn, int num)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Board b = null;
		
		String query = prop.getProperty("selectQuoteContactOne");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_TYPE(rset.getInt("board_type"));
				b.setBOARD_PWD(rset.getString("board_pwd"));
				b.setBOARD_NO(rset.getInt("board_no"));
				b.setBOARD_CATEGORY(rset.getString("board_category"));
				b.setBOARD_TITLE(rset.getString("board_title"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				b.setBOARD_DATE(rset.getDate("board_date"));
				b.setBOARD_STATUS(rset.getString("board_status"));
				b.setQUE_STATUS(rset.getString("que_status"));
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
		
		return b;
	}
	public int insertUserEstimateContent(Connection conn, Board b)
	{
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertUserEstimate");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getBOARD_PWD());
			pstmt.setString(2, b.getBOARD_TITLE());
			pstmt.setString(3, b.getBOARD_CONTENT());
			pstmt.setString(4, b.getBOARD_WRITER());
			
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
	public int getUserEstimateListCount(Connection conn)
	{
		Statement stmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("userEstimateListCount");
		
		int listCount = 0;
		
		try
		{
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next())
			{
				listCount = rset.getInt(1);
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
		
		return listCount;
	}
	public ArrayList<Board> selectUserEstimateList(Connection conn, int currentPage, int limit)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectUserEstimateList");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next())
			{
				Board b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_TYPE(rset.getInt("board_type"));
				b.setBOARD_PWD(rset.getString("board_pwd"));
				b.setBOARD_NO(rset.getInt("board_no"));
				b.setBOARD_CATEGORY(rset.getString("board_category"));
				b.setBOARD_TITLE(rset.getString("board_title"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				b.setBOARD_DATE(rset.getDate("board_date"));
				b.setBOARD_STATUS(rset.getString("board_status"));
				b.setQUE_STATUS(rset.getString("que_status"));
				
				list.add(b);
			}
			System.out.println("list : " + list);
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
	public Board selectUserEstimateOne(Connection conn, int num)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Board b = null;
		
		String query = prop.getProperty("selectUserEstimateOne");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_TYPE(rset.getInt("board_type"));
				b.setBOARD_PWD(rset.getString("board_pwd"));
				b.setBOARD_NO(rset.getInt("board_no"));
				b.setBOARD_CATEGORY(rset.getString("board_category"));
				b.setBOARD_TITLE(rset.getString("board_title"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				b.setBOARD_DATE(rset.getDate("board_date"));
				b.setBOARD_STATUS(rset.getString("board_status"));
				b.setQUE_STATUS(rset.getString("que_status"));
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
		
		return b;
	}
	public int updateQuoteContact(Connection conn, Board b)
	{
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateQuoteContact");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getBOARD_TITLE());
			pstmt.setString(2, b.getBOARD_CONTENT());
			pstmt.setString(3, b.getBOARD_PWD());
			pstmt.setInt(4, b.getBOARD_ID());
			
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
	public int insertQuoteContactReply(Connection conn, Board b)
	{
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertQuoteContactReply");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getBOARD_CONTENT());
			pstmt.setString(2, b.getBOARD_WRITER());
			pstmt.setInt(3, b.getBOARD_ID());
			
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
	public ArrayList<Board> quoteContactReplyList(Connection conn, int board_ID)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("quoteContactReplyList");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, board_ID);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next())
			{
				Board b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				
				list.add(b);
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
	public int deleteOneQuoteContact(Connection conn, int boardId)
	{
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteOneQuoteContact");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardId);
			
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
	public ArrayList<Board> searchTitle(Connection conn, String title, int currentPage, int limit)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("searchTitle");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setString(1, "%"+title+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next())
			{
				Board b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_TYPE(rset.getInt("board_type"));
				b.setBOARD_PWD(rset.getString("board_pwd"));
				b.setBOARD_NO(rset.getInt("board_no"));
				b.setBOARD_CATEGORY(rset.getString("board_category"));
				b.setBOARD_TITLE(rset.getString("board_title"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				b.setBOARD_DATE(rset.getDate("board_date"));
				b.setBOARD_STATUS(rset.getString("board_status"));
				b.setQUE_STATUS(rset.getString("que_status"));
				
				list.add(b);
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
	public ArrayList<Board> searchWriter(Connection conn, String writer, int currentPage, int limit)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("searchWriter");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setString(1, "%"+writer+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next())
			{
				Board b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_TYPE(rset.getInt("board_type"));
				b.setBOARD_PWD(rset.getString("board_pwd"));
				b.setBOARD_NO(rset.getInt("board_no"));
				b.setBOARD_CATEGORY(rset.getString("board_category"));
				b.setBOARD_TITLE(rset.getString("board_title"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				b.setBOARD_DATE(rset.getDate("board_date"));
				b.setBOARD_STATUS(rset.getString("board_status"));
				b.setQUE_STATUS(rset.getString("que_status"));
				
				list.add(b);
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
	public ArrayList<Board> searchContent(Connection conn, String content, int currentPage, int limit)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("searchContent");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setString(1, "%"+content+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next())
			{
				Board b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_TYPE(rset.getInt("board_type"));
				b.setBOARD_PWD(rset.getString("board_pwd"));
				b.setBOARD_NO(rset.getInt("board_no"));
				b.setBOARD_CATEGORY(rset.getString("board_category"));
				b.setBOARD_TITLE(rset.getString("board_title"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				b.setBOARD_DATE(rset.getDate("board_date"));
				b.setBOARD_STATUS(rset.getString("board_status"));
				b.setQUE_STATUS(rset.getString("que_status"));
				
				list.add(b);
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
	public int deleteReplyQuoteContact(Connection conn, int replyBoardId)
	{
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteReplyQuoteContact");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, replyBoardId);
			
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
	public ArrayList<Board> selectReplyQuoteContact(Connection conn, int boardId)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Board> replyList = null;
		
		String query = prop.getProperty("quoteContactReplyList");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardId);
			
			rset = pstmt.executeQuery();
			
			replyList = new ArrayList<Board>();
			
			while(rset.next())
			{
				Board b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				/*b.setBOARD_TYPE(rset.getInt("board_type"));*/
				/*b.setBOARD_PWD(rset.getString("board_pwd"));*/
				/*b.setBOARD_NO(rset.getInt("board_no"));*/
				/*b.setBOARD_CATEGORY(rset.getString("category_name"));*/
				/*b.setBOARD_TITLE(rset.getString("board_title"));*/
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				/*b.setBOARD_DATE(rset.getDate("board_date"));
				b.setBOARD_STATUS(rset.getString("board_status"));
				b.setQUE_STATUS(rset.getString("que_status"));*/
				
				replyList.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return replyList;
	}
	public ArrayList<Board> selectReplyUserEstimate(Connection conn, int boardId)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		ArrayList<Board> replyList = null;
		
		String query = prop.getProperty("userEstimateReplyList");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardId);
			
			rset = pstmt.executeQuery();
			
			replyList = new ArrayList<Board>();
			
			while(rset.next())
			{
				Board b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				
				replyList.add(b);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return replyList;
	}
	public int updateUserEstimate(Connection conn, Board b)
	{
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateUserEstimate");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getBOARD_TITLE());
			pstmt.setString(2, b.getBOARD_CONTENT());
			pstmt.setString(3, b.getBOARD_PWD());
			pstmt.setInt(4, b.getBOARD_ID());
			
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
	public int insertUserEstimateReply(Connection conn, Board b)
	{
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertUserEstimateReply");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getBOARD_CONTENT());
			pstmt.setString(2, b.getBOARD_WRITER());
			pstmt.setInt(3, b.getBOARD_ID());
			
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
	public ArrayList<Board> UserEstimateReplyList(Connection conn, int board_ID)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("userEstimateReplyList");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, board_ID);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next())
			{
				Board b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				
				list.add(b);
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
	public int deleteOneUserEstimate(Connection conn, int boardId)
	{
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteOneUserEstimate");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardId);
			
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
	public int deleteReplyUserEstimate(Connection conn, int replyBoardId)
	{
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("deleteReplyUserEstimate");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, replyBoardId);
			
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
	public ArrayList<Board> selectServiceCenterList(Connection conn)
	{
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectServiceCenterList");
		
		try
		{
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Board>();
			
			while(rset.next())
			{
				Board b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_TYPE(rset.getInt("board_type"));
				b.setBOARD_PWD(rset.getString("board_pwd"));
				b.setBOARD_NO(rset.getInt("board_no"));
				b.setBOARD_CATEGORY(rset.getString("category_name"));
				b.setBOARD_TITLE(rset.getString("board_title"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				b.setBOARD_DATE(rset.getDate("board_date"));
				b.setBOARD_STATUS(rset.getString("board_status"));
				b.setQUE_STATUS(rset.getString("que_status"));
				
				list.add(b);
			}
			/*System.out.println("list : " + list);*/
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
	public ArrayList<Board> selectServiceCenterNoticeList(Connection conn)
	{
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectServiceCenterNoticeList");
		
		try
		{
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Board>();
			
			while(rset.next())
			{
				Board b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_TYPE(rset.getInt("board_type"));
				b.setBOARD_PWD(rset.getString("board_pwd"));
				b.setBOARD_NO(rset.getInt("board_no"));
				b.setBOARD_CATEGORY(rset.getString("category_name"));
				b.setBOARD_TITLE(rset.getString("board_title"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				b.setBOARD_DATE(rset.getDate("board_date"));
				b.setBOARD_STATUS(rset.getString("board_status"));
				b.setQUE_STATUS(rset.getString("que_status"));
				
				list.add(b);
			}
			/*System.out.println("list : " + list);*/
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
	public ArrayList<Board> selectServiceCenterMoreList(Connection conn)
	{
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectServiceCenterList");
		
		try
		{
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Board>();

			while(rset.next())
			{
				Board b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_TYPE(rset.getInt("board_type"));
				b.setBOARD_PWD(rset.getString("board_pwd"));
				b.setBOARD_NO(rset.getInt("board_no"));
				b.setBOARD_CATEGORY(rset.getString("category_name"));
				b.setBOARD_TITLE(rset.getString("board_title"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				b.setBOARD_DATE(rset.getDate("board_date"));
				b.setBOARD_STATUS(rset.getString("board_status"));
				b.setQUE_STATUS(rset.getString("que_status"));
				
				list.add(b);
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
	public ArrayList<Board> selectServiceCenterQuestionList(Connection conn)
	{
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectServiceCenterQuestionList");
		
		try
		{
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Board>();
			
			while(rset.next())
			{
				Board b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_TYPE(rset.getInt("board_type"));
				b.setBOARD_PWD(rset.getString("board_pwd"));
				b.setBOARD_NO(rset.getInt("board_no"));
				b.setBOARD_CATEGORY(rset.getString("category_name"));
				b.setBOARD_TITLE(rset.getString("board_title"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				b.setBOARD_DATE(rset.getDate("board_date"));
				b.setBOARD_STATUS(rset.getString("board_status"));
				b.setQUE_STATUS(rset.getString("que_status"));
				
				list.add(b);
			}
			/*System.out.println("list : " + list);*/
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
	public int insertServiceCenterQuestion(Connection conn, Board b)
	{
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertServiceCenterQuestion");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getBOARD_CATEGORY());
			pstmt.setString(2, b.getBOARD_TITLE());
			pstmt.setString(3, b.getBOARD_CONTENT());
			pstmt.setString(4, b.getBOARD_WRITER());
			
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
	public Board selectServiceCenterQuestionOne(Connection conn, int boardNo)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Board b = null;
		
		String query = prop.getProperty("selectServiceCenterQuestionOne");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_TYPE(rset.getInt("board_type"));
				b.setBOARD_PWD(rset.getString("board_pwd"));
				b.setBOARD_NO(rset.getInt("board_no"));
				b.setBOARD_CATEGORY(rset.getString("category_name"));
				b.setBOARD_TITLE(rset.getString("board_title"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				b.setBOARD_DATE(rset.getDate("board_date"));
				b.setBOARD_STATUS(rset.getString("board_status"));
				b.setQUE_STATUS(rset.getString("que_status"));
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
		return b;
	}
	public Board selectServiceCenterNoticeOne(Connection conn, int boardNo)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Board b = null;
		
		String query = prop.getProperty("selectServiceCenterNoticeOne");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_TYPE(rset.getInt("board_type"));
				b.setBOARD_PWD(rset.getString("board_pwd"));
				b.setBOARD_NO(rset.getInt("board_no"));
				b.setBOARD_CATEGORY(rset.getString("category_name"));
				b.setBOARD_TITLE(rset.getString("board_title"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				b.setBOARD_DATE(rset.getDate("board_date"));
				b.setBOARD_STATUS(rset.getString("board_status"));
				b.setQUE_STATUS(rset.getString("que_status"));
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
		return b;
	}
	public Board selectServiceCenterMoreBoardOne(Connection conn, int boardNo)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Board b = null;
		
		String query = prop.getProperty("selectServiceCenterMoreBoardOne");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_TYPE(rset.getInt("board_type"));
				b.setBOARD_PWD(rset.getString("board_pwd"));
				b.setBOARD_NO(rset.getInt("board_no"));
				b.setBOARD_CATEGORY(rset.getString("category_name"));
				b.setBOARD_TITLE(rset.getString("board_title"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				b.setBOARD_DATE(rset.getDate("board_date"));
				b.setBOARD_STATUS(rset.getString("board_status"));
				b.setQUE_STATUS(rset.getString("que_status"));
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
		return b;
	}
	public ArrayList<Board> selectServiceCenterListMain(Connection conn)
	{
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectServiceCenterListMain");
		
		try
		{
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Board>();
			
			while(rset.next())
			{
				Board b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_TYPE(rset.getInt("board_type"));
				b.setBOARD_PWD(rset.getString("board_pwd"));
				b.setBOARD_NO(rset.getInt("board_no"));
				b.setBOARD_CATEGORY(rset.getString("category_name"));
				b.setBOARD_TITLE(rset.getString("board_title"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				b.setBOARD_DATE(rset.getDate("board_date"));
				b.setBOARD_STATUS(rset.getString("board_status"));
				b.setQUE_STATUS(rset.getString("que_status"));
				
				list.add(b);
			}
			/*System.out.println("list : " + list);*/
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
	public ArrayList<Board> selectServiceCenterNoticeListMain(Connection conn)
	{
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectServiceCenterNoticeListMain");
		
		try
		{
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Board>();
			
			while(rset.next())
			{
				Board b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_TYPE(rset.getInt("board_type"));
				b.setBOARD_PWD(rset.getString("board_pwd"));
				b.setBOARD_NO(rset.getInt("board_no"));
				b.setBOARD_CATEGORY(rset.getString("category_name"));
				b.setBOARD_TITLE(rset.getString("board_title"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				b.setBOARD_DATE(rset.getDate("board_date"));
				b.setBOARD_STATUS(rset.getString("board_status"));
				b.setQUE_STATUS(rset.getString("que_status"));
				
				list.add(b);
			}
			/*System.out.println("list : " + list);*/
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
	public ArrayList<Board> searchUserEstimateTitle(Connection conn, String title, int currentPage, int limit)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("searchUserEstimateTitle");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setString(1, "%"+title+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next())
			{
				Board b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_TYPE(rset.getInt("board_type"));
				b.setBOARD_PWD(rset.getString("board_pwd"));
				b.setBOARD_NO(rset.getInt("board_no"));
				b.setBOARD_CATEGORY(rset.getString("board_category"));
				b.setBOARD_TITLE(rset.getString("board_title"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				b.setBOARD_DATE(rset.getDate("board_date"));
				b.setBOARD_STATUS(rset.getString("board_status"));
				b.setQUE_STATUS(rset.getString("que_status"));
				
				list.add(b);
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
	public ArrayList<Board> searchUserEstimateWriter(Connection conn, String writer, int currentPage, int limit)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("searchUserEstimateWriter");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setString(1, "%"+writer+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next())
			{
				Board b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_TYPE(rset.getInt("board_type"));
				b.setBOARD_PWD(rset.getString("board_pwd"));
				b.setBOARD_NO(rset.getInt("board_no"));
				b.setBOARD_CATEGORY(rset.getString("board_category"));
				b.setBOARD_TITLE(rset.getString("board_title"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				b.setBOARD_DATE(rset.getDate("board_date"));
				b.setBOARD_STATUS(rset.getString("board_status"));
				b.setQUE_STATUS(rset.getString("que_status"));
				
				list.add(b);
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
	public ArrayList<Board> searchUserEstimateContent(Connection conn, String content, int currentPage, int limit)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("searchUserEstimateContent");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setString(1, "%"+content+"%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next())
			{
				Board b = new Board();
				
				b.setBOARD_ID(rset.getInt("board_id"));
				b.setBOARD_TYPE(rset.getInt("board_type"));
				b.setBOARD_PWD(rset.getString("board_pwd"));
				b.setBOARD_NO(rset.getInt("board_no"));
				b.setBOARD_CATEGORY(rset.getString("board_category"));
				b.setBOARD_TITLE(rset.getString("board_title"));
				b.setBOARD_CONTENT(rset.getString("board_content"));
				b.setBOARD_WRITER(rset.getString("user_id"));
				b.setREF_BOARD_ID(rset.getInt("ref_board_id"));
				b.setBOARD_LEVEL(rset.getInt("board_level"));
				b.setBOARD_DATE(rset.getDate("board_date"));
				b.setBOARD_STATUS(rset.getString("board_status"));
				b.setQUE_STATUS(rset.getString("que_status"));
				
				list.add(b);
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