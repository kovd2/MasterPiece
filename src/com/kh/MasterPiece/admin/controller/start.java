package com.kh.MasterPiece.admin.controller;



import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.admin.model.service.testService;
/**
 * Servlet implementation class start
 */
@WebServlet("/start")
public class start extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public start() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result[] = new testService().Count();
		HashMap<String, String[]> hmap = new testService().selectList();
		int count = new testService().newMemberCount();
		int cnt = new testService().cnt();
		for(int i = 0; i < result.length; i++){
			request.setAttribute(""+i, result[i]);
		}
		request.setAttribute("hmap", hmap);
		request.setAttribute("count", count);
		request.setAttribute("cnt", cnt);
		RequestDispatcher view = request.getRequestDispatcher("adminMain.jsp");
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
