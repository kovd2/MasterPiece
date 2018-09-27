package com.kh.MasterPiece.mypage.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.board.model.service.BoardService;
import com.kh.MasterPiece.board.model.vo.Board;
import com.kh.MasterPiece.mypage.review.model.service.ReviewService;

/**
 * Servlet implementation class ReviewUpdateServlet
 */
@WebServlet("/ReviewUpdateServlet")
public class ReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		System.out.println(title);
		System.out.println(content);
		System.out.println(boardId);
		Board b = new Board();

		b.setBOARD_TITLE(title);
		b.setBOARD_CONTENT(content);
		b.setBOARD_ID(boardId);
		
		int result = new ReviewService().updateContact(b);
		
		String page="";
		
		if(result > 0)
		{
			
		}
		else
		{
			request.setAttribute("msg", "견적 요청 게시판 수정 실패");
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
