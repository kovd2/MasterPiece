package com.kh.MasterPiece.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.board.model.service.BoardService;

/**
 * Servlet implementation class DeleteReplyQuoteContactServlet
 */
@WebServlet("/deleteReply.qc")
public class DeleteReplyQuoteContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReplyQuoteContactServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int replyBoardId = Integer.parseInt(request.getParameter("replyBoardId"));
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		
		/*System.out.println("ㅇㅎboardId : " + replyBoardId);
		System.out.println("boardId : " + boardId);*/
		
		int result = new BoardService().deleteReplyQuoteContact(replyBoardId);
		
		if(result > 0)
		{
			response.sendRedirect(request.getContextPath() + "/selectOne.qc?boardNo=" + boardNo + "&boardId=" + boardId);
		}
		else
		{
			request.setAttribute("msg", "견적 요청 게시판 등록 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
