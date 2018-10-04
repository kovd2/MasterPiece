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
import com.kh.MasterPiece.board.model.vo.Board;
import com.kh.MasterPiece.board.model.vo.PageInfo;

/**
 * Servlet implementation class questionServlet
 */
@WebServlet("/question.swy")
public class questionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public questionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
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

				int listCount = new testService().getQuestionListCount();
				maxPage = (int)((double)listCount / limit + 0.9);
				startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
				endPage = startPage + limit - 1;
				if(maxPage < endPage){
					endPage = maxPage;
				}

				PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);

				ArrayList<Board> list = new testService().selectQuestionList(currentPage, limit);
				String page = "";
				if(list != null){
					page = "views/admin/question/question.jsp";
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
