package com.kh.MasterPiece.serviceCenter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.board.model.service.BoardService;
import com.kh.MasterPiece.board.model.vo.Board;
import com.kh.MasterPiece.member.model.vo.Member;

/**
 * Servlet implementation class InsertServiceCenterQuestionServlet
 */
@WebServlet("/insertQuestion.sc")
public class InsertServiceCenterQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertServiceCenterQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getUserId());
		String category = request.getParameter("category");

		System.out.println("title : " + title);
		System.out.println("content : " + content);
		System.out.println("writer : " + writer);
		System.out.println("category : " + category);

		Board b = new Board();

		b.setBOARD_TITLE(title);
		b.setBOARD_CONTENT(content);
		b.setBOARD_WRITER(writer);
		b.setBOARD_CATEGORY(category);

		int result = new BoardService().insertServiceCenterQuestion(b);

		System.out.println("result : " + result);

		if(result > 0)
		{
			response.sendRedirect(request.getContextPath() + "/selectQuestionList.sc");
		}
		else
		{
			request.setAttribute("msg", "1:1문의 작성 실패");
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
