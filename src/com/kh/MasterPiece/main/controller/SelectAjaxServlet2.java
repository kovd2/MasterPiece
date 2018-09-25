package com.kh.MasterPiece.main.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.main.model.service.MainService;
import com.kh.MasterPiece.main.model.vo.Box;
import com.kh.MasterPiece.main.model.vo.MainPageInfo;
import com.kh.MasterPiece.product.model.vo.Product;

/**
 * Servlet implementation class SelectAjaxServlet2
 */
@WebServlet("/selectMain2.tn")
public class SelectAjaxServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAjaxServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//-----------------------------------------------CPU--------------------------------------------------------
				int currentPage2;	//현재 페이지를 표시할 변수
				int limit2;			//한 페이지에 게시글이 몇 개가 보여질 것인지 표시
				int maxPage2;		//전체 페이지에서 가장 마지막 페이지
				int startPage2;		//한 번에 표시될 페이지가 시작할 페이지
				int endPage2;		//한 번에 표시될 페이지가 끝나는 페이지

				currentPage2 = 1;

				limit2 = 3;

				if(request.getParameter("cp") != null){
					currentPage2 = Integer.parseInt(request.getParameter("cp"));
				}

				int listCount2 = new MainService().getlistCount2();
				
				maxPage2 = (int)((double)listCount2 / limit2 + 0.9);

				startPage2 = (((int)((double)currentPage2 / limit2 + 0.9)) - 1) * limit2 + 1;

				endPage2 = startPage2 + limit2 - 1;

				if(maxPage2 < endPage2){
					endPage2 = maxPage2;
				}

				MainPageInfo pi2 = new MainPageInfo(currentPage2, listCount2, limit2, maxPage2, startPage2, endPage2);

				//ArrayList<HashMap<String, Object>> list = new MainService().selectGraphicList(currentPage2, limit2);
				ArrayList<Product> list2 = new MainService().cpuList(currentPage2, limit2);
				
				//----------------------------------------------------------------------
				
				HashMap<String, Attachment> imgList = new MainService().selectImageList();
				
				Box mainBox2 = new Box();
				
				mainBox2.setPi(pi2);
				mainBox2.setList(list2);
				mainBox2.setImgList(imgList);
				
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");
				new Gson().toJson(mainBox2, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
