package com.kh.MasterPiece.board.controller;

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
import com.kh.MasterPiece.prdOrder.model.service.PrdOrderService;
import com.kh.MasterPiece.prdOrder.model.vo.PrdOrder;

/**
 * Servlet implementation class SelectPrdListServlet
 */
@WebServlet("/callPrdList.qc")
public class SelectPrdListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectPrdListServlet() {
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
		
		ArrayList<PrdOrder> prdList = new PrdOrderService().selectPrdOrder(userId);
		HashMap<String, Attachment> imageList = new PrdOrderService().imageList();
		System.out.println(prdList);
		String page = "";
		
		if(prdList != null)
		{
			page = "views/board/quoteContactPrdOrder.jsp";
			request.setAttribute("prdList", prdList);
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
