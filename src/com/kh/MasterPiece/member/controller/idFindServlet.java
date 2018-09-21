package com.kh.MasterPiece.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.member.model.service.MemberService;
import com.kh.MasterPiece.member.model.vo.Member;

@WebServlet("/idFind")
public class idFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public idFindServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		
		Member m = new MemberService().idFind(userName, email);
		
	
		String page = "";
		
		if(m != null){

			page = "views/member/findIdResult.jsp";
			
			request.setAttribute("userId", m.getUserId());
		}else{
			
			page = "views/member/idFindError.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
