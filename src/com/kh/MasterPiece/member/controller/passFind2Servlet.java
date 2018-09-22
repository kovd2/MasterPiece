package com.kh.MasterPiece.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.member.model.service.MemberService;



@WebServlet("/passFind2")
public class passFind2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public passFind2Servlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String userId = request.getParameter("userId");
		String email = request.getParameter("email");
		
		int result = new MemberService().passFind(userId, email);

		String page = "";
		
		if(result > 0){
			
			page = "views/member/findPassResult.jsp";
			

			request.setAttribute("userId", userId);
			request.setAttribute("email", email);
		}else{
			
			
			page = "views/member/passFindError.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
