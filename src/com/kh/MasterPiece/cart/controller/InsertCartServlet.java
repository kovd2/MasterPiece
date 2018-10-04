package com.kh.MasterPiece.cart.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.board.model.vo.PageInfo;
import com.kh.MasterPiece.cart.model.service.CartService;
import com.kh.MasterPiece.cart.model.vo.Cart;
import com.kh.MasterPiece.member.model.vo.Member;

@WebServlet("/insertCart")
public class InsertCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		int count = Integer.parseInt(request.getParameter("count"));
		String category = request.getParameter("category");
		Member m = (Member)request.getSession().getAttribute("loginUser");
		String orderCheck = m.getOrderCheck();
		int result = 0;
		if(new CartService().test(m.getOrderCheck()) == null){
			orderCheck=new CartService().insertOrderCheck();
			m.setOrderCheck(orderCheck);
			request.getSession().removeAttribute("loginUser");
			request.getSession().setAttribute("loginUser", m);			
		}
		
		result  = new CartService().insertCart(code, orderCheck, m.getUserId(), count);
		
				
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
