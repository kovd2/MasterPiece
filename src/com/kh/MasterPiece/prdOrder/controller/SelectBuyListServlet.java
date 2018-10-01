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
		
		ArrayList<BuyerHistory> buyList = new BuyerHistoryService().viewHistory(userId);
		HashMap<String, Attachment> imageList = new BuyerHistoryService().imageList();
		
		System.out.println("buyList : " + buyList);
		System.out.println("imageList : " + imageList);
		
		String page = "";
		
		if(buyList != null)
		{
			page = "views/serviceCenter/serviceCenterExchangeBuyList.jsp";
			request.setAttribute("buyList", buyList);
			request.setAttribute("imageList", imageList);
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
