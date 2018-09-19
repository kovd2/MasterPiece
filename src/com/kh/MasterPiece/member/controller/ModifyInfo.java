package com.kh.MasterPiece.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.member.model.service.MemberService;

@WebServlet("/ModifyInfo.me")
public class ModifyInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ModifyInfo() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String address = request.getParameter("address1") + "|" + request.getParameter("address2") + "|" + request.getParameter("address3"); //구분자 | (쉬프트+\ 누르면됨)
		String phone = request.getParameter("tel1") + "-" + request.getParameter("tel2") + "-" + request.getParameter("tel3");
		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
		System.out.println(userId);
		System.out.println(userPwd);
		System.out.println(address);
		System.out.println(phone);
		System.out.println(email);
		int result = new MemberService().ModifyInfo(userId, userPwd, address, phone, email);
		
		String page = "";
		
		if(result > 0){
			
			page = "main.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
