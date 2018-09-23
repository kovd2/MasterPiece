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
import com.kh.MasterPiece.member.model.vo.Member;
import com.kh.MasterPiece.product.model.service.ProductService;
import com.kh.MasterPiece.product.model.vo.Product;


/**
 * Servlet implementation class InsertCartServlet
 */
@WebServlet("/addCart")
public class AddCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCart() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");	
		
		HashMap<String, Object> hmap = new ProductService().cartList(code);
		
		Product p = (Product) hmap.get("product");
		Member m = (Member) hmap.get("member");
		ArrayList<Attachment> imgList = (ArrayList<Attachment>)hmap.get("attachment");

		String page = "";
		
		if(p != null){
			page = "views/product/cart_page.jsp";
			request.setAttribute("p", p);
			request.setAttribute("m", m);
			request.setAttribute("imgList", imgList);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "에러");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
