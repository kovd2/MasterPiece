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
import javax.swing.plaf.synth.SynthStyle;

import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.board.model.vo.Board;
import com.kh.MasterPiece.main.model.service.MainService;
import com.kh.MasterPiece.main.model.vo.MainPageInfo;
import com.kh.MasterPiece.product.model.vo.Product;


@WebServlet("/main.tn")
public class SelectMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SelectMainServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Product> list = new MainService().allList();
		
		//-----------------------------------------------그래픽카드--------------------------------------------------------
		int currentPage1;	//현재 페이지를 표시할 변수
		int limit1;			//한 페이지에 게시글이 몇 개가 보여질 것인지 표시
		int maxPage1;		//전체 페이지에서 가장 마지막 페이지
		int startPage1;		//한 번에 표시될 페이지가 시작할 페이지
		int endPage1;		//한 번에 표시될 페이지가 끝나는 페이지

		currentPage1 = 1;

		limit1 = 3;

		if(request.getParameter("currentPage1") != null){
			currentPage1 = Integer.parseInt(request.getParameter("currentPage1"));
		}

		int listCount1 = new MainService().getlistCount1();

		maxPage1 = (int)((double)listCount1 / limit1 + 0.9);

		startPage1 = (((int)((double)currentPage1 / limit1 + 0.9)) - 1) * limit1 + 1;

		endPage1 = startPage1 + limit1 - 1;

		if(maxPage1 < endPage1){
			endPage1 = maxPage1;
		}

		MainPageInfo pi1 = new MainPageInfo(currentPage1, listCount1, limit1, maxPage1, startPage1, endPage1);

		System.out.println(pi1);
		//ArrayList<HashMap<String, Object>> list = new MainService().selectGraphicList(currentPage1, limit1);
		ArrayList<Product> list1 = new MainService().graphicList(currentPage1, limit1);


		//-----------------------------------------------cpu--------------------------------------------------------
		int currentPage2;	//현재 페이지를 표시할 변수
		int limit2;			//한 페이지에 게시글이 몇 개가 보여질 것인지 표시
		int maxPage2;		//전체 페이지에서 가장 마지막 페이지
		int startPage2;		//한 번에 표시될 페이지가 시작할 페이지
		int endPage2;		//한 번에 표시될 페이지가 끝나는 페이지

		currentPage2 = 1;

		limit2 = 3;

		if(request.getParameter("currentPage1") != null){
			currentPage2 = Integer.parseInt(request.getParameter("currentPage1"));
		}

		int listCount2 = new MainService().getlistCount2();

		maxPage2 = (int)((double)listCount2 / limit2 + 0.9);

		startPage2 = (((int)((double)currentPage2 / limit2 + 0.9)) - 1) * limit2 + 1;

		endPage2 = startPage2 + limit2 - 1;

		if(maxPage2 < endPage2){
			endPage2 = maxPage2;
		}

		MainPageInfo pi2 = new MainPageInfo(currentPage2, listCount2, limit2, maxPage2, startPage2, endPage2);

		ArrayList<Product> list2 = new MainService().cpuList(currentPage2, limit2);
		//----------------------------------------------------------------------

		HashMap<String, Attachment> imgList = new MainService().selectImageList();
		
		ArrayList<Board> banner = new MainService().mainBanner();
		
		String page = null;
		if(list != null){
			page = "index.jsp";
			request.setAttribute("list", list);
			request.setAttribute("list1", list1);
			request.setAttribute("list2", list2);
			request.setAttribute("imgList", imgList);
			request.setAttribute("pi", pi1);
			request.setAttribute("banner", banner);
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
