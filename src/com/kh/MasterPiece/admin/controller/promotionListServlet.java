package com.kh.MasterPiece.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.admin.model.service.testService;
import com.kh.MasterPiece.admin.model.vo.Promotion;
import com.kh.MasterPiece.board.model.vo.PageInfo;
import com.kh.MasterPiece.member.model.vo.Member;

@WebServlet("/promotionList.h")
public class promotionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public promotionListServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			int currentPage;		
			int limit;				
			int maxPage;			
			int startPage;          
			int endPage;            

			currentPage = 1;

			limit = 10;

			if(request.getParameter("currentPage") != null){
				currentPage 
				= Integer.parseInt(request.getParameter("currentPage"));
			}

			int listCount = new testService().getPromotionListCount();
			maxPage = (int)((double)listCount / limit + 0.9);
			startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
			endPage = startPage + limit - 1;
			if(maxPage < endPage){
				endPage = maxPage;
			}
	
			PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
			
			ArrayList<Promotion> list = new testService().selectPromotionList(currentPage, limit);
			String page = "";
			if(list != null){
				page = "views/admin/promotion/pro.jsp";
				request.setAttribute("list", list);
				request.setAttribute("pi", pi);
				request.setAttribute("cate", "전체");
			}else{
				page = "views/common/errorPage.jsp";
				request.setAttribute("msg", "에러");
			}
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
