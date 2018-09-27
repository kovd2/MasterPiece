package com.kh.MasterPiece.serviceCenter.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.serviceCenter.model.service.AfterServiceService;
import com.kh.MasterPiece.serviceCenter.model.vo.AfterService;

/**
 * Servlet implementation class SearchAfterServiceServlet
 */
@WebServlet("/search.af")
public class SearchAfterServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchAfterServiceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String searchCondition = request.getParameter("searchCondition");
		ArrayList<AfterService> list = null;
		
		if(searchCondition.equals("title"))
		{
			String title = request.getParameter("searchValue");
			
			list = new AfterServiceService().searchAfterServiceTitle(title);
		}
		
		String page = "";
		
		if(list != null)
		{
			page = "views/serviceCenter/serviceCenterExchangeList.jsp";
			
			request.setAttribute("list", list);
			request.setAttribute("searchCondition", searchCondition);
		}
		else
		{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "견적 요청 게시판 조회 실패");
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
