package com.kh.MasterPiece.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.product.model.service.ProductService;
import com.kh.MasterPiece.product.model.vo.Product;

/**
 * Servlet implementation class ShowCartListServlet
 */
@WebServlet("/showCart.prd")
public class ShowCartListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowCartListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String prd_name = request.getParameter("prd_name");
		int price = Integer.parseInt(request.getParameter("price"));
		
		ArrayList<Product> list = new ProductService().showCart();
		
		String page = "";
		System.out.println(list);
		if(list != null){
			request.setAttribute("list", list);
			page = "views/product/cart_page.jsp";
		}else{
			request.setAttribute("msg", "장바구니에 상품이 존재하지 않습니다.");
			page = "views/product/emptyCart.jsp";
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
