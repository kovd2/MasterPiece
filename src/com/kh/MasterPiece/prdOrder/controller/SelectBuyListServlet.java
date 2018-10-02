package com.kh.MasterPiece.prdOrder.controller;

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
import com.kh.MasterPiece.mypage.buyerhistory.model.service.BuyerHistoryService;
import com.kh.MasterPiece.mypage.buyerhistory.model.vo.BuyerHistory;

/**
 * Servlet implementation class SelectBuyListServlet
 */
@WebServlet("/callBuyList.po")
public class SelectBuyListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectBuyListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String userId = request.getParameter("userId");
		
		//System.out.println(userId);
		
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
		int listCount = new BuyerHistoryService().getListCount(userId);

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
		ArrayList<BuyerHistory> buyList = new BuyerHistoryService().viewHistory(userId, currentPage, limit);
		
		HashMap<String, Attachment> imageList = new BuyerHistoryService().imageList2();
		
		System.out.println("buyList : " + buyList);
		System.out.println("imageList : " + imageList);
		
		String page = "";
		
		if(buyList != null)
		{
			page = "views/serviceCenter/serviceCenterExchangeBuyList.jsp";
			request.setAttribute("buyList", buyList);
			request.setAttribute("imageList", imageList);
			request.setAttribute("pi", pi);
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
