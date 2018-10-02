package com.kh.MasterPiece.mypage.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.board.model.vo.PageInfo;
import com.kh.MasterPiece.member.model.vo.Member;
import com.kh.MasterPiece.mypage.review.model.service.ReviewService;
import com.kh.MasterPiece.mypage.review.model.vo.Review;

/**
 * Servlet implementation class ReviewSearchServlet
 */
@WebServlet("/ReviewSearchServlet")
public class ReviewSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String writer = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getUserId());
		
		int currentPage;	//현재 페이지를 표시할 변수
		int limit;			//한 페이지에 게시글이 몇 개가 보여질 것인지 표시
		int maxPage;		//전체 페이지에서 가장 마지막 페이지
		int startPage;		//한 번에 표시될 페이지가 시작할 페이지
		int endPage;		//한 번에 표시될 페이지가 끝나는 페이지

		currentPage = 1;

		limit = 10;

		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		//파라미터값 꺼낸것
		int searchType = Integer.parseInt(request.getParameter("search_type")); 
		String searchText = request.getParameter("search_text");
		
		int listCount = new ReviewService().searchCount(writer, searchType, searchText);

		maxPage = (int)((double)listCount / limit + 0.9);

		startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;

		endPage = startPage + limit - 1;

		if(maxPage < endPage){
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);

		ArrayList<Review> list = new ReviewService().searchList(writer, searchType, searchText, currentPage, limit);
		
		String page = null;
		if(list != null){
			page = "views/mypage/review/review_myPage.jsp";
			request.setAttribute("list", list);
			request.setAttribute("searchType", searchType);
			request.setAttribute("searchText", searchText);
			request.setAttribute("pi", pi);
			request.setAttribute("entire", "아무거나");
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "실패");
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
