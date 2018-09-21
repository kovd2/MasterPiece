package com.kh.MasterPiece.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.MasterPiece.member.model.service.MemberService;
import com.kh.MasterPiece.member.model.vo.Member;

@WebServlet("/login.me")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Cookie cookie = null;
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String checkBtn = request.getParameter("checkBtn"); //아이디 저장 체크유무
		
		Member loginUser = new MemberService().loginCheck(userId, userPwd);

		
		if(loginUser != null){
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			if(checkBtn != null && checkBtn.trim().equals("on")){
				
				cookie = new Cookie("userId", java.net.URLEncoder.encode(userId));
				cookie.setMaxAge(24 * 60 * 60);
				response.addCookie(cookie);
			}else{
				
				cookie = new Cookie("userId", null);
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			
			if(loginUser.getUserType().equals("1")){
				
				response.sendRedirect("main.jsp");
				
			}else{
				
				request.getRequestDispatcher("/start").forward(request, response); 
			}
		}else{
			
			request.getRequestDispatcher("views/member/login.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
