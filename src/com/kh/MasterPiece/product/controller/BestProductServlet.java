package com.kh.MasterPiece.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.product.model.service.ProductService;
import com.kh.MasterPiece.product.model.vo.Product;

/**
 * Servlet implementation class BestProductServlet
 */
@WebServlet("/bestPrd")
public class BestProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BestProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HashMap<String, Object> imgList = new ProductService().imgList();
		//------------------------------------------------상품 리스트--------------------------------------------------------------
		String category = request.getParameter("category");
		System.out.println("category : " + category);

			ArrayList<Product> bestPrd = new ProductService().bestPrd(category);
			
			System.out.println("bestPrd : " + bestPrd);
			
			String page = "";

			if (bestPrd != null) {
				page = "views/product/product_List.jsp";
				request.setAttribute("bestPrd", bestPrd);
				request.setAttribute("imgList", imgList);
				request.setAttribute("category", category);

			} else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "실패");
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
