package com.kh.MasterPiece.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.board.model.service.BoardService;
import com.kh.MasterPiece.board.model.vo.Board;
import com.kh.MasterPiece.board.model.vo.PageInfo;

/**
 * Servlet implementation class SearchQuoteContactServlet
 */
@WebServlet("/search.qc")
public class SearchQuoteContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchQuoteContactServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String searchCondition = request.getParameter("searchCondition");
		
		ArrayList<Board> list = null;
		
		int currentPage = 1;
		int limit = 15;
		int maxPage;
		int startPage;
		int endPage;
		
		if(request.getParameter("currentPage") != null)
		{
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int listCount = new BoardService().getQuoteContactListCount();
		
		/*System.out.println("listcount : " + listCount);*/
		
		maxPage = (int)((double)listCount / limit + 1.4);
		
		startPage = (((int)((double)currentPage / limit + 1.4)) - 1) * limit + 1;
		
		endPage = startPage + limit - 1;
		
		if(maxPage < endPage)
		{
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
		
		if(searchCondition.equals("title"))
		{
			String title = request.getParameter("searchValue");
			
			list = new BoardService().searchTitle(title, currentPage, limit);
		}
		else if(searchCondition.equals("writer"))
		{
			String writer = request.getParameter("searchValue");
			
			list = new BoardService().searchWriter(writer, currentPage, limit);
		}
		else
		{
			String content = request.getParameter("searchValue");
			
			list = new BoardService().searchContent(content, currentPage, limit);
		}
		
		String page = "";
		
		if(list != null)
		{
			page = "views/board/quoteContact.jsp";
			
			request.setAttribute("list", list);
			request.setAttribute("searchCondition", searchCondition);
			request.setAttribute("pi", pi);
		}
		else
		{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "견적 요청 게시판 조회 실패");
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
