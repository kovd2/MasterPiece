package com.kh.MasterPiece.board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.MasterPiece.board.model.service.BoardService;
import com.kh.MasterPiece.board.model.vo.Board;
import com.kh.MasterPiece.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class InsertBoardServlet
 */
@WebServlet("/insert.qc")
public class InsertQuoteContactServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertQuoteContactServlet() {
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
		String boardPassword = request.getParameter("boardPassword");

		System.out.println("title : " + title);
		System.out.println("content : " + content);
		System.out.println("writer : " + writer);
		System.out.println("boardPassword : " + boardPassword);

		Board b = new Board();

		b.setBOARD_TITLE(title);
		b.setBOARD_CONTENT(content);
		b.setBOARD_WRITER(writer);
		b.setBOARD_PWD(boardPassword);

		//System.out.println(savePath);

		int result = new BoardService().insertQuoteContact(b);

		/*System.out.println("result : " + result);*/

		if(result > 0)
		{
			response.sendRedirect(request.getContextPath() + "/selectList.qc");
		}
		else
		{
			request.setAttribute("msg", "견적 요청 게시판 등록 실패");
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