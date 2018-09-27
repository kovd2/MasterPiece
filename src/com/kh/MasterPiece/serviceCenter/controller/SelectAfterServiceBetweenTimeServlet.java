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
 * Servlet implementation class SelectAfterServiceServlet
 */
@WebServlet("/selectExchangeBT.af")
public class SelectAfterServiceBetweenTimeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAfterServiceBetweenTimeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int betweenTime = Integer.parseInt(request.getParameter("betweenTime"));
		
		System.out.println("betweenTime : " + betweenTime);
		
		ArrayList<AfterService> list = new AfterServiceService().selectAfterServiceBetweenTimeList(betweenTime);
		
		System.out.println("as list : " + list);
		
		String page = "";
		
		if(list != null)
		{
			page = "views/serviceCenter/serviceCenterExchangebetweenTimeList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("betweenTime", betweenTime);
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
