package com.kh.MasterPiece.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.member.model.service.MemberService;

@WebServlet("/MemberOut.me")
public class MemberOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberOutServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		int result = new MemberService().MemberOut(userId, userPwd);
		
		String page = "";
		
		if(result > 0){
			
			request.getSession().invalidate();
			page = "views/member/OutError.jsp";
			
		}else{
	
			
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
