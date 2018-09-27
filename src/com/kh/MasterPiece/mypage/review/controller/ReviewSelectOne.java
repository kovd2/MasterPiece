package com.kh.MasterPiece.mypage.review.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.board.model.vo.Board;
import com.kh.MasterPiece.mypage.review.model.service.ReviewService;

/**
 * Servlet implementation class ReviewSelectOne
 */
@WebServlet("/ReviewSelectOne")
public class ReviewSelectOne extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReviewSelectOne() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		String userId = request.getParameter("userId");

		
		Board b = new ReviewService().selectOne(num);
		
		String page = "";

		if(b != null){
			page = "views/mypage/review/review_detail.jsp";
			request.setAttribute("b", b);
			request.setAttribute("userId", userId);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 상세 조회 실패!");
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
