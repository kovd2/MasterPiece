package com.kh.MasterPiece.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.MasterPiece.board.model.service.BoardService;
import com.kh.MasterPiece.board.model.vo.Board;

/**
 * Servlet implementation class InsertUserEstimateReplyServlet
 */
@WebServlet("/insertReply.ue")
public class InsertUserEstimateReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertUserEstimateReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String writer = request.getParameter("writer");
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		String replyContent = request.getParameter("replyContent");
		
		Board b = new Board();
		
		b.setBOARD_ID(boardId);
		b.setBOARD_WRITER(writer);
		b.setBOARD_CONTENT(replyContent);
		
		ArrayList<Board> replyList = new BoardService().insertUserEstimateReply(b);
		
		System.out.println("replyList : " + replyList);
		
		response.setContentType("application/json");
		
		new Gson().toJson(replyList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
