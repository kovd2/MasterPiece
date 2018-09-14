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

@WebServlet("/insertMember.me")
public class insertMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public insertMemberServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userName = request.getParameter("userName");
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String phone = request.getParameter("tel1") + "-" + request.getParameter("tel2") + "-" + request.getParameter("tel3");
		String address = request.getParameter("address1") + "|" + request.getParameter("address2") + "|" + request.getParameter("address3"); //구분자 | (쉬프트+\ 누르면됨)
		String email = request.getParameter("email");
		
		
		Member m = new Member();
		
		m.setUserName(userName);
		m.setUserId(userId);
		m.setUserPwd(userPwd);
		m.setPhone(phone);
		m.setAddress(address);
		m.setEmail(email);
		
		int result = new MemberService().insertMember(m);
		
		String page = "";
		
		if(result > 0){
			
			page = "views/main/main.jsp";
		}else{
			
			page = "views/common/errorPage.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}
	
	

}
