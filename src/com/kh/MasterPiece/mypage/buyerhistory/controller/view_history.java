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
 * Servlet implementation class view_history
 */
@WebServlet("/view_history")
public class view_history extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public view_history() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//필요한것을 생각 
		//리스트를 생성하기위해 서비스를 호출
		//구매내역에 있는 리스트를 만든 객체에 담아서 view에 전송 

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
		ArrayList<BuyerHistory> list = new BuyerHistoryService().viewHistory(writer, currentPage, limit);
		
		HashMap<String, Attachment> imageList = new BuyerHistoryService().imageList(); 
		
		//배송추적
		HashMap<String, String> map = new BuyerHistoryService().invoiceNo();
		
		System.out.println(list);
		
		if(list != null){
			page = "views/mypage/buyerHistory/myPage_buy.jsp";
			request.setAttribute("list", list);
			request.setAttribute("map", map);
			request.setAttribute("imageList", imageList);
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
