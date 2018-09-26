package com.kh.MasterPiece.serviceCenter.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.board.model.service.BoardService;
import com.kh.MasterPiece.board.model.vo.Board;

/**
 * Servlet implementation class SelectOneServiceCenterMoreServlet
 */
@WebServlet("/selectOneMoreBoard.sc")
public class SelectOneServiceCenterMoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneServiceCenterMoreServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		
		Board b = new BoardService().selectServiceCenterMoreBoardOne(boardNo);
		
		String page = "";
		
		if(b != null)
		{
			page = "views/serviceCenter/serviceCenterMoreBoardDetail.jsp";
			request.setAttribute("b", b);
		}
		else
		{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "유저 견적 게시판 상세보기 실패");
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
