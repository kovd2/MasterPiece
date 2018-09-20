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

import com.kh.MasterPiece.board.model.vo.Attach;
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
	public int insertBoardContent(Connection conn, Board b)
	{
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoard");
		
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
	public int insertAttachment(Connection conn, ArrayList<Attach> fileList)
	{
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		
		for(int i=0; i<fileList.size(); i++)
		{
			try
			{
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getSaveRoute());
				pstmt.setInt(4, fileList.get(i).getBoardId());

				result += pstmt.executeUpdate();
			}
			catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			finally
			{
				close(pstmt);
			}
		}
		
		return result;
	}
	public int getListCount(Connection conn)
	{
		Statement stmt = null;
		ResultSet rset = null;

		String query = prop.getProperty("listCount");
		
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
	public ArrayList<Board> selectList(Connection conn, int currentPage, int limit)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectList");
		
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
				b.setBOARD_CATEGORY(rset.getInt("board_category"));
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
	public Board selectOne(Connection conn, int num)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Board b = null;
		
		String query = prop.getProperty("selectOne");
		
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
				b.setBOARD_CATEGORY(rset.getInt("board_category"));
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
	public Attach selectImage(Connection conn, int num)
	{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		Attach a = null;
		
		String query = prop.getProperty("selectImage");
		
		try
		{
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next())
			{
				a = new Attach();
				
				a.setFildCode(rset.getInt("file_code"));
				a.setOriginName(rset.getString("origin_name"));
				a.setChangeName(rset.getString("change_name"));
				a.setUploadDate(rset.getDate("upload_date"));
				a.setSaveRoute(rset.getString("save_route"));
				a.setBoardId(rset.getInt("board_id"));
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
		
		return a;
	}
}