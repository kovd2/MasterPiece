package com.kh.MasterPiece.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.board.model.service.BoardService;

/**
 * Servlet implementation class DeleteOneUserEstimateServlet
 */
@WebServlet("/deleteOne.ue")
public class DeleteOneUserEstimateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteOneUserEstimateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		
		/*System.out.println("boardId : " + boardId);*/
		
		int result = new BoardService().deleteOneUserEstimate(boardId);
		
		if(result > 0)
		{
			response.sendRedirect(request.getContextPath() + "/selectList.ue");
		}
		else
		{
			request.setAttribute("msg", "견적 요청 게시판 삭제 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
