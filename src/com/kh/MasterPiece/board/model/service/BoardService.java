package com.kh.MasterPiece.board.model.service;

import static com.kh.MasterPiece.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.MasterPiece.board.model.dao.BoardDao;
import com.kh.MasterPiece.board.model.vo.Attach;
import com.kh.MasterPiece.board.model.vo.Board;

public class BoardService {

	public int insertBoard(Board b, ArrayList<Attach> fileList)
	{
		Connection conn = getConnection();
		int result = 0;
		
		int result1 = new BoardDao().insertBoardContent(conn, b);
		
		System.out.println("result1 : " + result1);
		
		if(result1 > 0)
		{
			int boardId = new BoardDao().selectCurrval(conn);
			
			for(int i=0; i<fileList.size(); i++)
			{
				fileList.get(i).setBoardId(boardId);
			}
		}
		
		int result2 = new BoardDao().insertAttachment(conn, fileList);
		
		/*System.out.println("result2 : " + result2);
		
		System.out.println("?? : " + (result1>0 && result2>0));*/
		
		if(result1 > 0 && result2 > 0)
		{
			commit(conn);
			result = 1;
		}
		else
		{
			rollback(conn);
		}
		/*System.out.println("result : " + result);*/
		close(conn);
		
		return result;
	}
	public int insertBoard(Board b)
	{
		// TODO Auto-generated method stub
		return 0;
	}

	public int getListCount()
	{
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Board> selectList(int currentPage, int limit)
	{
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectList(conn, currentPage, limit);
		
		close(conn);
		
		return list;
	}
	public Board selectOne(int num)
	{
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectOne(conn, num);
		
		return b;
	}
	public Attach selectImage(int num)
	{
		Connection conn = getConnection();
		
		Attach a = new BoardDao().selectImage(conn, num);
		
		return a;
	}
}
