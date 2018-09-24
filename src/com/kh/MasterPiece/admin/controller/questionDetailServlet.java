package com.kh.MasterPiece.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.admin.model.service.testService;
import com.kh.MasterPiece.board.model.vo.Board;
import com.kh.MasterPiece.member.model.vo.Member;

/**
 * Servlet implementation class questionDetailServlet
 */
@WebServlet("/questionDetail.swy")
public class questionDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public questionDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		Board b = new testService().questionDetail(id);
		Member m = new testService().getep(b.getBOARD_WRITER());
		
		String page = "";
		if(b != null && m != null){
			page = "views/admin/question/questionDetail.jsp";
			request.setAttribute("Board", b);
			request.setAttribute("id", id);
			request.setAttribute("email", m.getEmail());
			request.setAttribute("phone", m.getPhone());
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
