package com.kh.MasterPiece.mypage.review.controller;

import java.io.IOException;
import java.sql.Date;
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
 * Servlet implementation class DataSearch
 */
@WebServlet("/DateSearch")
public class DateSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DateSearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String date =(String)request.getParameter("date");
		
		String writer = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getUserId());
		
		String page="";

	
		int currentPage;	
		int limit;			
		int maxPage;		
		int startPage;		
		int endPage;		

		currentPage = 1;
		limit = 10;

		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		//전체 목록 개수
		int listCount = new ReviewService().getListCount(writer);

		//총 페이지 수 계산식
		maxPage = (int)((double)listCount / limit + 0.9);

		//시작페이지 계산
		startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;

		//목록 아래쪽에 보여질 마지막 페이지 수
		endPage = startPage + limit - 1;

		if(maxPage < endPage){
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);

		//페이징 처리 이후 조회 방법
		ArrayList<Review> list = new ReviewService().SearchDateList(writer, date, currentPage, limit);
		
		
		
		
		if(list != null){
			page = "views/mypage/review/review_myPage.jsp";
			request.setAttribute("list", list);
			//request.setAttribute("date", date);
			request.setAttribute("pi", pi);
			request.setAttribute("entire", "전체");
			
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "게시물 등록 실패!");
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
