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

/**
 * Servlet implementation class SelectServiceCenterServlet
 */
@WebServlet("/selectList.sc")
public class SelectServiceCenterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectServiceCenterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		ArrayList<Board> list1 = new BoardService().selectServiceCenterList();
		ArrayList<Board> list2 = new BoardService().selectServiceCenterNoticeList();
		
		/*System.out.println("serviceCenterList : " + list);*/
		
		String page = "";

		if(list1 != null)
		{
			page = "views/serviceCenter/serviceCenter.jsp";
			request.setAttribute("list1", list1);
		}
		if(list2 != null)
		{
			request.setAttribute("list2", list2);
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
