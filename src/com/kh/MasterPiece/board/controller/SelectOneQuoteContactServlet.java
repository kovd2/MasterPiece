package com.kh.MasterPiece.board.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.board.model.service.BoardService;
import com.kh.MasterPiece.board.model.vo.Attach;
import com.kh.MasterPiece.board.model.vo.Board;

/**
 * Servlet implementation class SelectOneBoardServlet
 */
@WebServlet("/selectOne.qc") 
public class SelectOneQuoteContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneQuoteContactServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int num = Integer.parseInt(request.getParameter("num"));
		
		//System.out.println(num);
		
		Board b = new BoardService().selectOne(num);
		Attach a = new BoardService().selectImage(num);
				
		String page = "";
		
		if(b != null)
		{
			page = "views/board/quoteContactDetail.jsp";
			request.setAttribute("b", b);
			request.setAttribute("a", a);
		}
		else
		{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 상세보기 실패");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}