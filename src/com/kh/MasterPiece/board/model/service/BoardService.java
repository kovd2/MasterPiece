package com.kh.MasterPiece.board.model.service;

import static com.kh.MasterPiece.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.MasterPiece.board.model.dao.BoardDao;
import com.kh.MasterPiece.board.model.vo.Board;

public class BoardService {

	public int insertQuoteContact(Board b)
	{
		Connection conn = getConnection();
		
		int result = new BoardDao().insertQuoteContactContent(conn, b);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int getQuoteContactListCount()
	{
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getQuoteContactListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Board> selectQuoteContactList(int currentPage, int limit)
	{
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectQuoteContactList(conn, currentPage, limit);
		
		close(conn);
		
		return list;
	}
	public Board selectQuoteContactOne(int num)
	{
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectQuoteContactOne(conn, num);
		
		return b;
	}
	public int insertUserEstimate(Board b)
	{
		Connection conn = getConnection();
		
		int result = new BoardDao().insertUserEstimateContent(conn, b);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		/*System.out.println("result : " + result);*/
		close(conn);
		
		return result;
	}
	public int getUserEstimateListCount()
	{
		Connection conn = getConnection();
		
		int listCount = new BoardDao().getUserEstimateListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public ArrayList<Board> selectUserEstimateList(int currentPage, int limit)
	{
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectUserEstimateList(conn, currentPage, limit);
		
		close(conn);
		
		return list;
	}

	public Board selectUserEstimateOne(int num)
	{
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectUserEstimateOne(conn, num);
		
		return b;
	}

	public int updateQuoteContact(Board b)
	{
		Connection conn = getConnection();
		
		int result = new BoardDao().updateQuoteContact(conn, b);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Board> insertQuoteContactReply(Board b)
	{
		Connection conn = getConnection();
		ArrayList<Board> replyList = null;
		
		int result = new BoardDao().insertQuoteContactReply(conn, b);
		
		if(result > 0)
		{
			commit(conn);
			
			replyList = new BoardDao().quoteContactReplyList(conn, b.getBOARD_ID());
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		
		return replyList;
	}

	public int deleteOneQuoteContact(int boardId)
	{
		Connection conn = getConnection();
		int result = new BoardDao().deleteOneQuoteContact(conn, boardId);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Board> searchTitle(String title, int currentPage, int limit)
	{
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().searchTitle(conn, title, currentPage, limit);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Board> searchWriter(String writer, int currentPage, int limit)
	{
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().searchWriter(conn, writer, currentPage, limit);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Board> searchContent(String content, int currentPage, int limit)
	{
		Connection conn = getConnection();
		
		ArrayList<Board> list = new BoardDao().searchContent(conn, content, currentPage, limit);
		
		close(conn);
		
		return list;
	}

	public int deleteReplyQuoteContact(int replyBoardId)
	{
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteReplyQuoteContact(conn, replyBoardId);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Board> selectReplyQuoteContact(int boardId)
	{
		Connection conn = getConnection();
		ArrayList<Board> replyList = new BoardDao().selectReplyQuoteContact(conn, boardId);
		
		close(conn);
		
		return replyList;
	}

	public ArrayList<Board> selectReplyUserEstimate(int boardId)
	{
		Connection conn = getConnection();
		ArrayList<Board> replyList = new BoardDao().selectReplyUserEstimate(conn, boardId);
		
		close(conn);
		
		return replyList;
	}

	public int updateUserEstimate(Board b)
	{
		Connection conn = getConnection();
		
		int result = new BoardDao().updateUserEstimate(conn, b);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);

		return result;
	}

	public ArrayList<Board> insertUserEstimateReply(Board b)
	{
		Connection conn = getConnection();
		ArrayList<Board> replyList = null;
		
		int result = new BoardDao().insertUserEstimateReply(conn, b);
		
		if(result > 0)
		{
			commit(conn);
			
			replyList = new BoardDao().UserEstimateReplyList(conn, b.getBOARD_ID());
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		
		return replyList;
	}

	public int deleteOneUserEstimate(int boardId)
	{
		Connection conn = getConnection();
		int result = new BoardDao().deleteOneUserEstimate(conn, boardId);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int deleteReplyUserEstimate(int replyBoardId)
	{
		Connection conn = getConnection();
		
		int result = new BoardDao().deleteReplyUserEstimate(conn, replyBoardId);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public ArrayList<Board> selectServiceCenterList()
	{
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectServiceCenterList(conn);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Board> selectServiceCenterNoticeList()
	{
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectServiceCenterNoticeList(conn);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Board> selectServiceCenterMoreList()
	{
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectServiceCenterMoreList(conn);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Board> selectServiceCenterQuestionList()
	{
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectServiceCenterQuestionList(conn);
		
		close(conn);
		
		return list;
	}

	public int insertServiceCenterQuestion(Board b)
	{
		Connection conn = getConnection();
		
		int result = new BoardDao().insertServiceCenterQuestion(conn, b);
		
		if(result > 0)
		{
			commit(conn);
		}
		else
		{
			rollback(conn);
		}
		/*System.out.println("result : " + result);*/
		close(conn);
		
		return result;
	}

	public Board selectServiceCenterQuestionOne(int boardNo)
	{
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectServiceCenterQuestionOne(conn, boardNo);
		
		return b;
	}

	public Board selectServiceCenterNoticeOne(int boardNo)
	{
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectServiceCenterNoticeOne(conn, boardNo);
		
		return b;
	}

	public Board selectServiceCenterMoreBoardOne(int boardNo)
	{
		Connection conn = getConnection();
		
		Board b = new BoardDao().selectServiceCenterMoreBoardOne(conn, boardNo);
		
		return b;
	}

	public ArrayList<Board> selectServiceCenterListMain()
	{
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectServiceCenterListMain(conn);
		
		close(conn);
		
		return list;
	}

	public ArrayList<Board> selectServiceCenterNoticeListMain()
	{
		Connection conn = getConnection();
		ArrayList<Board> list = new BoardDao().selectServiceCenterNoticeListMain(conn);
		
		close(conn);
		
		return list;
	}	
}