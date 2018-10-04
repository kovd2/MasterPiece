package com.kh.MasterPiece.mypage.buyerhistory.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.board.model.vo.PageInfo;
import com.kh.MasterPiece.member.model.vo.Member;
import com.kh.MasterPiece.mypage.buyerhistory.model.service.BuyerHistoryService;
import com.kh.MasterPiece.mypage.buyerhistory.model.vo.BuyerHistory;
import com.kh.MasterPiece.mypage.review.model.service.ReviewService;

/**
 * Servlet implementation class DateSearchServlet
 */
@WebServlet("/DateSearchServlet")
public class DateSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DateSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    //날짜조회
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String date =(String)request.getParameter("date");
		
		System.out.println(date);
		
		
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
		int listCount = new BuyerHistoryService().getListCount(writer);

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
		ArrayList<BuyerHistory> list = new BuyerHistoryService().SearchDateList(writer, date, currentPage, limit);
		
		HashMap<String, Attachment> imageList = new BuyerHistoryService().imageList(); 

		HashMap<String, String> map = new BuyerHistoryService().invoiceNo();
		System.out.println(imageList);
		System.out.println(list);
		
		if(list != null){
			page = "views/mypage/buyerHistory/myPage_buy.jsp";
			request.setAttribute("list", list);
			request.setAttribute("imageList", imageList);
			request.setAttribute("pi", pi);
			request.setAttribute("map", map);
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
