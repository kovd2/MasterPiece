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
		String id = request.getParameter("user");
		int count = Integer.parseInt(request.getParameter("count"));
		String category = request.getParameter("category");
		
		int result = 0;
		Member m = (Member)request.getSession().getAttribute("loginUser");
		String orderCheck = m.getOrderCheck();
		
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;

		currentPage = 1;

		limit = 10;

		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int listCount = new CartService().getListCount(orderCheck);

		maxPage = (int) ((double) listCount / limit + 0.9);

		startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;

		endPage = startPage + limit - 1;

		if (maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		if(new CartService().test(m.getOrderCheck()) == null){
			orderCheck=new CartService().insertOrderCheck();
			m.setOrderCheck(orderCheck);
			request.getSession().removeAttribute("loginUser");
			request.getSession().setAttribute("loginUser", m);			
		}
		result  = new CartService().insertCart(code, orderCheck, id, count);
		
		ArrayList<Cart> cartList = new CartService().selectCart(code, id, count, orderCheck, currentPage, limit, category);
		HashMap<String, Attachment> imgList = new CartService().imgList();
		
		if(result > 0){			
			if(request.getParameter("t").equals("n")){
				response.sendRedirect("prdPageList.js?category=category");
			}else{
				request.setAttribute("cartList", cartList);
				request.setAttribute("imgList", imgList);
				request.setAttribute("pi", pi);
				request.setAttribute("orderCheck", orderCheck);
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
