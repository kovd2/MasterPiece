package com.kh.MasterPiece.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.board.model.vo.Board;

/**
 * Servlet implementation class UpdateQuoteContactServlet
 */
@WebServlet("/gotoupdate.qc")
public class GotoUpdateQuoteContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GotoUpdateQuoteContactServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String boardId = request.getParameter("boardId");
		
		/*System.out.println("1 : " + title);
		System.out.println("2 : " + content);
		System.out.println("3 : " + boardId);*/
		
		request.setAttribute("title", title);
		request.setAttribute("content", content);
		request.setAttribute("boardId", boardId);
		
		request.getRequestDispatcher("views/board/quoteContactUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
