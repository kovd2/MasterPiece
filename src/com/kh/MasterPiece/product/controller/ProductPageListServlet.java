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

@WebServlet("/prdPageList.js")
public class ProductPageListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProductPageListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*ArrayList<Product> list = new ProductService().selectListAll();
	      String page = "";
	      
	      if(list != null){
	         page = "views/product/product_List.jsp";
	         request.setAttribute("list", list);
	         System.out.println("list : " + list);
	      }else{
	         page = "views/common/errorPage.jsp";
	         request.setAttribute("msg", "에러");
	      }*/
		HashMap<String, Object> imgList = new ProductService().imgList();
		//------------------------------------------------CPU 이미지--------------------------------------------------------------
		String category = request.getParameter("category");
		System.out.println("category : " + category);
		if (category.equals("cpu")) {
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
			int listCount = new ProductService().getListCount();

			maxPage = (int) ((double) listCount / limit + 0.9);

			startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;

			endPage = startPage + limit - 1;

			if (maxPage < endPage) {
				endPage = maxPage;
			}

			PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);

			ArrayList<Product> cpuList = new ProductService().cpuList(currentPage, limit);
			System.out.println("cpuList : " + cpuList);
			System.out.println("cate"+category);
			String page = "";

			if (cpuList != null) {
				page = "views/product/product_List.jsp";
				request.setAttribute("cpuList", cpuList);
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

		
		
		
		//------------------------------------------------MAINBOARD 이미지--------------------------------------------------------------
		if (category.equals("mainboard")) {
			int currentPage1; // 현재 페이지를 표시할 변수
			int limit1; // 한 페이지에 게시글이 몇 개가 보여질 것인지 표시
			int maxPage1; // 전체 페이지에서 가장 마지막 페이지
			int startPage1; // 한 번에 표시될 페이지가 시작할 페이지
			int endPage1; // 한 번에 표시될 페이지가 끝나는 페이지

			currentPage1 = 1;

			limit1 = 10;

			if (request.getParameter("currentPage1") != null) {
				currentPage1 = Integer.parseInt(request.getParameter("currentPage1"));
			}

			int listCount1 = new ProductService().getListCount1();

			maxPage1 = (int) ((double) listCount1 / limit1 + 0.9);

			startPage1 = (((int) ((double) currentPage1 / limit1 + 0.9)) - 1) * limit1 + 1;

			endPage1 = startPage1 + limit1 - 1;

			if (maxPage1 < endPage1) {
				endPage1 = maxPage1;
			}

			PageInfo pi = new PageInfo(currentPage1, listCount1, limit1, maxPage1, startPage1, endPage1);

			ArrayList<Product> mainBoardList = new ProductService().mainBoardList(currentPage1, limit1);
			System.out.println("mainBoardList : " + mainBoardList);
			String page = "";

			if (mainBoardList != null) {
				page = "views/product/product_List.jsp";
				request.setAttribute("mainBoardList", mainBoardList);
				request.setAttribute("imgList", imgList);
				request.setAttribute("category", category);
				request.setAttribute("pi", pi);

			} else {
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "실패");
			}
			RequestDispatcher view1 = request.getRequestDispatcher(page);
			view1.forward(request, response);
		}
		
		//------------------------------------------------MEMORY 이미지--------------------------------------------------------------		
		
		
	}
		


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
