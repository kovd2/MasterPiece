package com.kh.MasterPiece.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.admin.model.service.testService;
import com.kh.MasterPiece.admin.model.vo.OrderConfirm;
import com.kh.MasterPiece.board.model.vo.PageInfo;

/**
 * Servlet implementation class SerchOrderServlet
 */
@WebServlet("/SearchOrder.swy")
public class SearchOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;		
		int limit;				
		int maxPage;			
		int startPage;         
		int endPage;          
		
		currentPage = 1;

		limit = 10;
		String cate = request.getParameter("a");
		if(request.getParameter("currentPage") != null){
			currentPage 
			= Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = new testService().getOrderSearchCount(cate);
		maxPage = (int)((double)listCount / limit + 0.9);
		startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		endPage = startPage + limit - 1;
		if(maxPage < endPage){
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);

		ArrayList<OrderConfirm> list = new testService().orderSearchList(currentPage,limit, cate);
		String page = "";
		if(list != null){
			page = "views/admin/ordermember/ordermember.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.setAttribute("cate", cate);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "에러");
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
