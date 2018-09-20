package com.kh.MasterPiece.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.MasterPiece.member.model.service.MemberService;
import com.kh.MasterPiece.member.model.vo.Member;

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
		String email = request.getParameter("email");

		int result = new MemberService().ModifyInfo(userId, userPwd, address, phone, email);
		
		String page = "";
		
		if(result > 0){
			Member loginUser = new MemberService().loginCheck(userId, userPwd);
			HttpSession session = request.getSession();
			session.removeAttribute("loginUser");
			session.setAttribute("loginUser", loginUser);
			page = "main.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
