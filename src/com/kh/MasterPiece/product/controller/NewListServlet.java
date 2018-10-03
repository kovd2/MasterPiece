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

import com.kh.MasterPiece.board.model.vo.PageInfo;
import com.kh.MasterPiece.product.model.service.ProductService;
import com.kh.MasterPiece.product.model.vo.Product;

/**
 * Servlet implementation class NewListServlet
 */
@WebServlet("/newList")
public class NewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewListServlet() {
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
			int listCount = new ProductService().getListCount(category);

			maxPage = (int) ((double) listCount / limit + 0.9);

			startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;

			endPage = startPage + limit - 1;

			if (maxPage < endPage) {
				endPage = maxPage;
			}

			PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);

			ArrayList<Product> prdList = new ProductService().newList(currentPage, limit, category);
			ArrayList<Product> bestPrd = new ProductService().bestPrd(category);
			System.out.println("prdList : " + prdList);
			
			String page = "";

			if (prdList != null) {
				page = "views/product/product_List.jsp";
				request.setAttribute("prdList", prdList);
				request.setAttribute("bestPrd", bestPrd);
				request.setAttribute("imgList", imgList);
				request.setAttribute("pi", pi);
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
