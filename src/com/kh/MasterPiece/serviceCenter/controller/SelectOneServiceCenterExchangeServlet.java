package com.kh.MasterPiece.serviceCenter.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.board.model.service.BoardService;
import com.kh.MasterPiece.board.model.vo.Board;
import com.kh.MasterPiece.prdOrder.model.service.PrdOrderService;
import com.kh.MasterPiece.prdOrder.model.vo.PrdOrder;
import com.kh.MasterPiece.serviceCenter.model.service.AfterServiceService;
import com.kh.MasterPiece.serviceCenter.model.vo.AfterService;

/**
 * Servlet implementation class SelectOneServiceCenterExchangeServlet
 */
@WebServlet("/selectOneExchange.af")
public class SelectOneServiceCenterExchangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneServiceCenterExchangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int serviceNo = Integer.parseInt(request.getParameter("serviceNo"));
		String userId = request.getParameter("userId");
		
		System.out.println("userId : " + userId);
		
		AfterService as = new AfterServiceService().selectServiceCenterExchangeOne(serviceNo);
		ArrayList<PrdOrder> list = new PrdOrderService().selectPrdOrder(userId);
		
		System.out.println(as);
		System.out.println(list);
		
		String page = "";
		
		if(as != null)
		{
			if(list != null)
			{
				page = "views/serviceCenter/serviceCenterExchangeDetail.jsp";
				request.setAttribute("as", as);
				request.setAttribute("list", list);
			}
		}
		else
		{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "교환.반품.AS 상세보기 실패");
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
