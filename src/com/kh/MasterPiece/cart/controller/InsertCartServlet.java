package com.kh.MasterPiece.cart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.MasterPiece.cart.model.service.CartService;

@WebServlet("/insertCart")
public class InsertCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String code = request.getParameter("code");
		String orderCheck = request.getParameter("orderCheck");
		String id = request.getParameter("user");
		int count = Integer.parseInt(request.getParameter("count"));
		String oc = null;
		int result = 0;
		String re = null;
		if(new CartService().test(orderCheck) == null){
			 oc = new CartService().insertOrderCheck(orderCheck);
			 result  = new CartService().insertCart(code, oc, id, count);

		}else{
			result  = new CartService().insertCart(code, orderCheck, id, count);
		}
		if(result > 0)
		{
			System.out.println(oc);
			System.out.println(orderCheck);
			if(oc!=null){
				System.out.println("true");
				request.setAttribute("oc", oc);
				re = oc;
			}else{
				request.setAttribute("oc", orderCheck);
				re=orderCheck;
				System.out.println(request.getAttribute("prdList"));
			}
			if(request.getParameter("t").equals("n")){
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				new Gson().toJson(re, response.getWriter());
			}else{
				
				request.getRequestDispatcher("views/mypage/cart/cart_myPage.jsp").forward(request, response);
			}
		}
		else
		{
			request.setAttribute("msg", "에러");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);;
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
