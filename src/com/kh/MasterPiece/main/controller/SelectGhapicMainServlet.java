package com.kh.MasterPiece.main.controller;

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
import com.kh.MasterPiece.main.model.service.MainService;
import com.kh.MasterPiece.main.model.vo.MainPageInfo;
import com.kh.MasterPiece.product.model.vo.Product;

@WebServlet("/graphic.tn")
public class SelectGhapicMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectGhapicMainServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;	//현재 페이지를 표시할 변수
		int limit;			//한 페이지에 게시글이 몇 개가 보여질 것인지 표시
		int maxPage;		//전체 페이지에서 가장 마지막 페이지
		int startPage;		//한 번에 표시될 페이지가 시작할 페이지
		int endPage;		//한 번에 표시될 페이지가 끝나는 페이지
	
		currentPage = 1;
		
		limit = 3;
		
		if(request.getParameter("currentPage") != null){
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = new MainService().getListCount();
		
		maxPage = (int)((double)listCount / limit + 0.9);
		
		startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
		
		endPage = startPage + limit - 1;
		
		if(maxPage < endPage){
			endPage = maxPage;
		}
		
		MainPageInfo pi = new MainPageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		//ArrayList<HashMap<String, Object>> list = new MainService().selectGraphicList(currentPage, limit);
		ArrayList<Product> list = new MainService().selectList(currentPage, limit);
		
		
		HashMap<String, Attachment> imgList = new MainService().selectImageList();
		String page = "";
		
		if(list != null){
			//page = "index.jsp";
			page = "mainTest.jsp";
			request.setAttribute("list", list);
			request.setAttribute("imgList", imgList);
			request.setAttribute("pi", pi);
			
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "실패");
		}
		
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}













