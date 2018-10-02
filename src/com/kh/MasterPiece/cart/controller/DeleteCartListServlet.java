package com.kh.MasterPiece.cart.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.board.model.vo.PageInfo;
import com.kh.MasterPiece.cart.model.service.CartService;
import com.kh.MasterPiece.cart.model.vo.Cart;

/**
 * Servlet implementation class DeleteCartListServlet
 */
@WebServlet("/deleteCartList")
public class DeleteCartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeleteCartListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String value = request.getParameter("code");
		String values[] = value.split(",");
			
		int result = new CartService().deleteCart(values);	
		
		
		String page = "";
		
		if(result > 0){
			page = "/SelectCartList.swy";
			
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("value", values);
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
