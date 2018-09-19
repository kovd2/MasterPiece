package com.kh.MasterPiece.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.member.model.service.MemberService;

@WebServlet("/passFindResult.me")
public class passFindResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public passFindResultServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String userId = request.getParameter("userId");
		String email = request.getParameter("email");
		String userPwd = request.getParameter("userPwd");
		

		int result = new MemberService().passFindResult(userId, email, userPwd);

		String page = "";
		
		if(result > 0){

			page = "main.jsp";
		}else{
			
			page = "main.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
