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


/**
 * Servlet implementation class BuyerHistorySearch
 */
@WebServlet("/BuyerHistorySearch")
public class BuyerHistorySearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BuyerHistorySearch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String writer = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getUserId());
		
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
		
		//파라미터값 꺼낸것
		int searchType = Integer.parseInt(request.getParameter("search_type")); 
		String searchText = request.getParameter("search_text");
		
		int listCount = new BuyerHistoryService().searchCount(writer, searchType, searchText);

		maxPage = (int)((double)listCount / limit + 0.9);

		startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;

		endPage = startPage + limit - 1;

		if(maxPage < endPage){
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);

		ArrayList<BuyerHistory> list = new BuyerHistoryService().searchList(writer, searchType, searchText, currentPage, limit);
		
		HashMap<String, Attachment> imageList = new BuyerHistoryService().imageList(); 
		
		System.out.println(list);
		
		String page = null;
		if(list != null){
			page = "views/mypage/buyerHistory/myPage_buy.jsp";
			request.setAttribute("list", list);
			request.setAttribute("imageList", imageList);
			request.setAttribute("searchType", searchType);
			request.setAttribute("searchText", searchText);
			request.setAttribute("pi", pi);
			request.setAttribute("entire", "all");
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
