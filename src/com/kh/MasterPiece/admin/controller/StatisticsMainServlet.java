package com.kh.MasterPiece.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.admin.model.service.testService;
import com.kh.MasterPiece.admin.model.vo.Cnt;

/**
 * Servlet implementation class StatisticsMainServlet
 */
@WebServlet("/StatisticsMain.swy")
public class StatisticsMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatisticsMainServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Integer> monthSales = new testService().monthSales();
		HashMap<String, Integer> sel_desc = new testService().sel_desc();
		HashMap<String, Integer> sel_asc = new testService().sel_asc();
		HashMap<String, Integer> cnt = new testService().cntList();
		ArrayList<Cnt> count = new testService().cntList2();
		String page = "";
		
		if(monthSales!=null){
			page = "/views/admin/statistics/statisticsMain.jsp";
			request.setAttribute("monthSales", monthSales);
			request.setAttribute("cnt", cnt);
			request.setAttribute("count", count);
			request.setAttribute("sel_desc", sel_desc);
			request.setAttribute("sel_asc", sel_asc);
		}else{
			page = "/views/common/errorPage.jsp";
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
