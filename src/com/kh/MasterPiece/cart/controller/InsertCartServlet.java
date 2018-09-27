package com.kh.MasterPiece.cart.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.cart.model.service.CartService;
import com.kh.MasterPiece.member.model.vo.Member;

@WebServlet("/insertCart")
public class InsertCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("----------------------------------------------");
		String code = request.getParameter("code");
		String id = request.getParameter("user");
		int count = Integer.parseInt(request.getParameter("count"));
		String category = request.getParameter("category");
		String oc = null;
		int result = 0;
		String re = null;
		Member m = (Member)request.getSession().getAttribute("loginUser");
		
		HashMap<String, Object> cartList = new CartService().selectCart(code, id, count, m.getOrderCheck());
		System.out.println("cartList : " + cartList);
		
		if(new CartService().test(m.getOrderCheck()) == null){
			 m.setOrderCheck(new CartService().insertOrderCheck());
			 request.getSession().removeAttribute("loginUser");
			 request.getSession().setAttribute("loginUser", m);
		}
		result  = new CartService().insertCart(code, m.getOrderCheck(), id, count);
		if(result > 0){			
			if(request.getParameter("t").equals("n")){
				response.sendRedirect("prdPageList.js?category=category");
			}else{
				request.setAttribute("cartList", cartList);
				request.getRequestDispatcher("views/mypage/cart/cart_myPage.jsp").forward(request, response);
			}
		}
		else
		{
			request.setAttribute("msg", "에러");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
