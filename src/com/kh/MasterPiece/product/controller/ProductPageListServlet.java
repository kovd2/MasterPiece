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
			int currentPage1; 
			int limit1; 
			int maxPage1; 
			int startPage1;
			int endPage1; 

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
		
		if (category.equals("memory")) {
			int currentPage2; 
			int limit2; 
			int maxPage2; 
			int startPage2;
			int endPage2; 

			currentPage2 = 1;

			limit2 = 10;

			if (request.getParameter("currentPage2") != null) {
				currentPage2 = Integer.parseInt(request.getParameter("currentPage2"));
			}

			int listCount2 = new ProductService().getListCount2();

			maxPage2 = (int) ((double) listCount2 / limit2 + 0.9);

			startPage2 = (((int) ((double) currentPage2 / limit2 + 0.9)) - 1) * limit2 + 1;

			endPage2 = startPage2 + limit2 - 1;

			if (maxPage2 < endPage2) {
				endPage2 = maxPage2;
			}

			PageInfo pi = new PageInfo(currentPage2, listCount2, limit2, maxPage2, startPage2, endPage2);

			ArrayList<Product> memoryList = new ProductService().memoryList(currentPage2, limit2);
			System.out.println("memoryList : " + memoryList);
			String page = "";

			if (memoryList != null) {
				page = "views/product/product_List.jsp";
				request.setAttribute("memoryList", memoryList);
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
		
		
		//------------------------------------------------GRAPHIC 이미지--------------------------------------------------------------		
		
				if (category.equals("graphic")) {
					int currentPage3; 
					int limit3; 
					int maxPage3; 
					int startPage3;
					int endPage3; 

					currentPage3 = 1;

					limit3 = 10;

					if (request.getParameter("currentPage3") != null) {
						currentPage3 = Integer.parseInt(request.getParameter("currentPage3"));
					}

					int listCount3 = new ProductService().getListCount3();

					maxPage3 = (int) ((double) listCount3 / limit3 + 0.9);

					startPage3 = (((int) ((double) currentPage3 / limit3 + 0.9)) - 1) * limit3 + 1;

					endPage3 = startPage3 + limit3 - 1;

					if (maxPage3 < endPage3) {
						endPage3 = maxPage3;
					}

					PageInfo pi = new PageInfo(currentPage3, listCount3, limit3, maxPage3, startPage3, endPage3);

					ArrayList<Product> graphicList = new ProductService().graphicList(currentPage3, limit3);
					System.out.println("graphicList : " + graphicList);
					String page = "";

					if (graphicList != null) {
						page = "views/product/product_List.jsp";
						request.setAttribute("graphicList", graphicList);
						request.setAttribute("imgList", imgList);
						request.setAttribute("category", category);
						request.setAttribute("pi", pi);

					} else {
						page = "views/common/errorPage.jsp";
						request.setAttribute("msg", "실패");
					}
					RequestDispatcher view3 = request.getRequestDispatcher(page);
					view3.forward(request, response);
				}
			
				
				//------------------------------------------------HDD 이미지--------------------------------------------------------------		
				
				if (category.equals("hdd")) {
					int currentPage4; 
					int limit4; 
					int maxPage4; 
					int startPage4;
					int endPage4; 

					currentPage4 = 1;

					limit4 = 10;

					if (request.getParameter("currentPage4") != null) {
						currentPage4 = Integer.parseInt(request.getParameter("currentPage4"));
					}

					int listCount4 = new ProductService().getListCount4();

					maxPage4 = (int) ((double) listCount4 / limit4 + 0.9);

					startPage4 = (((int) ((double) currentPage4 / limit4 + 0.9)) - 1) * limit4 + 1;

					endPage4 = startPage4 + limit4 - 1;

					if (maxPage4 < endPage4) {
						endPage4 = maxPage4;
					}

					PageInfo pi = new PageInfo(currentPage4, listCount4, limit4, maxPage4, startPage4, endPage4);

					ArrayList<Product> hddList = new ProductService().hddList(currentPage4, limit4);
					System.out.println("hddList : " + hddList);
					String page = "";

					if (hddList != null) {
						page = "views/product/product_List.jsp";
						request.setAttribute("hddList", hddList);
						request.setAttribute("imgList", imgList);
						request.setAttribute("category", category);
						request.setAttribute("pi", pi);

					} else {
						page = "views/common/errorPage.jsp";
						request.setAttribute("msg", "실패");
					}
					RequestDispatcher view4 = request.getRequestDispatcher(page);
					view4.forward(request, response);
				}
				
				
				//------------------------------------------------ODD 이미지--------------------------------------------------------------		
				
				if (category.equals("odd")) {
					int currentPage5; 
					int limit5; 
					int maxPage5; 
					int startPage5;
					int endPage5; 

					currentPage5 = 1;

					limit5 = 10;

					if (request.getParameter("currentPage5") != null) {
						currentPage5 = Integer.parseInt(request.getParameter("currentPage5"));
					}

					int listCount5 = new ProductService().getListCount5();

					maxPage5 = (int) ((double) listCount5 / limit5 + 0.9);

					startPage5 = (((int) ((double) currentPage5 / limit5 + 0.9)) - 1) * limit5 + 1;

					endPage5 = startPage5 + limit5 - 1;

					if (maxPage5 < endPage5) {
						endPage5 = maxPage5;
					}

					PageInfo pi = new PageInfo(currentPage5, listCount5, limit5, maxPage5, startPage5, endPage5);

					ArrayList<Product> oddList = new ProductService().oddList(currentPage5, limit5);
					System.out.println("oddList : " + oddList);
					String page = "";

					if (oddList != null) {
						page = "views/product/product_List.jsp";
						request.setAttribute("oddList", oddList);
						request.setAttribute("imgList", imgList);
						request.setAttribute("category", category);
						request.setAttribute("pi", pi);

					} else {
						page = "views/common/errorPage.jsp";
						request.setAttribute("msg", "실패");
					}
					RequestDispatcher view5 = request.getRequestDispatcher(page);
					view5.forward(request, response);
				}
				
				
				//------------------------------------------------POWER 이미지--------------------------------------------------------------		
				
				if (category.equals("power")) {
					int currentPage6; 
					int limit6; 
					int maxPage6; 
					int startPage6;
					int endPage6; 

					currentPage6 = 1;

					limit6 = 10;

					if (request.getParameter("currentPage6") != null) {
						currentPage6 = Integer.parseInt(request.getParameter("currentPage6"));
					}

					int listCount6 = new ProductService().getListCount6();

					maxPage6 = (int) ((double) listCount6 / limit6 + 0.9);

					startPage6 = (((int) ((double) currentPage6 / limit6 + 0.9)) - 1) * limit6 + 1;

					endPage6 = startPage6 + limit6 - 1;

					if (maxPage6 < endPage6) {
						endPage6 = maxPage6;
					}

					PageInfo pi = new PageInfo(currentPage6, listCount6, limit6, maxPage6, startPage6, endPage6);

					ArrayList<Product> powerList = new ProductService().powerList(currentPage6, limit6);
					System.out.println("powerList : " + powerList);
					String page = "";

					if (powerList != null) {
						page = "views/product/product_List.jsp";
						request.setAttribute("powerList", powerList);
						request.setAttribute("imgList", imgList);
						request.setAttribute("category", category);
						request.setAttribute("pi", pi);

					} else {
						page = "views/common/errorPage.jsp";
						request.setAttribute("msg", "실패");
					}
					RequestDispatcher view6 = request.getRequestDispatcher(page);
					view6.forward(request, response);
				}
				
				
				//------------------------------------------------COOLLER 이미지--------------------------------------------------------------		
				
				if (category.equals("cool")) {
					int currentPage7; 
					int limit7; 
					int maxPage7; 
					int startPage7;
					int endPage7; 

					currentPage7 = 1;

					limit7 = 10;

					if (request.getParameter("currentPage7") != null) {
						currentPage7 = Integer.parseInt(request.getParameter("currentPage7"));
					}

					int listCount7 = new ProductService().getListCount7();

					maxPage7 = (int) ((double) listCount7 / limit7 + 0.9);

					startPage7 = (((int) ((double) currentPage7 / limit7 + 0.9)) - 1) * limit7 + 1;

					endPage7 = startPage7 + limit7 - 1;

					if (maxPage7 < endPage7) {
						endPage7 = maxPage7;
					}

					PageInfo pi = new PageInfo(currentPage7, listCount7, limit7, maxPage7, startPage7, endPage7);

					ArrayList<Product> coolList = new ProductService().coolList(currentPage7, limit7);
					System.out.println("coolList : " + coolList);
					String page = "";

					if (coolList != null) {
						page = "views/product/product_List.jsp";
						request.setAttribute("coolList", coolList);
						request.setAttribute("imgList", imgList);
						request.setAttribute("category", category);
						request.setAttribute("pi", pi);

					} else {
						page = "views/common/errorPage.jsp";
						request.setAttribute("msg", "실패");
					}
					RequestDispatcher view7 = request.getRequestDispatcher(page);
					view7.forward(request, response);
				}
				
				
				//------------------------------------------------CASE 이미지--------------------------------------------------------------		
				
				if (category.equals("case")) {
					int currentPage8; 
					int limit8; 
					int maxPage8; 
					int startPage8;
					int endPage8; 

					currentPage8 = 1;

					limit8 = 10;

					if (request.getParameter("currentPage8") != null) {
						currentPage8 = Integer.parseInt(request.getParameter("currentPage8"));
					}

					int listCount8 = new ProductService().getListCount8();

					maxPage8 = (int) ((double) listCount8 / limit8 + 0.9);

					startPage8 = (((int) ((double) currentPage8 / limit8 + 0.9)) - 1) * limit8 + 1;

					endPage8 = startPage8 + limit8 - 1;

					if (maxPage8 < endPage8) {
						endPage8 = maxPage8;
					}

					PageInfo pi = new PageInfo(currentPage8, listCount8, limit8, maxPage8, startPage8, endPage8);

					ArrayList<Product> caseList = new ProductService().caseList(currentPage8, limit8);
					System.out.println("caseList : " + caseList);
					String page = "";

					if (caseList != null) {
						page = "views/product/product_List.jsp";
						request.setAttribute("caseList", caseList);
						request.setAttribute("imgList", imgList);
						request.setAttribute("category", category);
						request.setAttribute("pi", pi);

					} else {
						page = "views/common/errorPage.jsp";
						request.setAttribute("msg", "실패");
					}
					RequestDispatcher view8 = request.getRequestDispatcher(page);
					view8.forward(request, response);
				}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
