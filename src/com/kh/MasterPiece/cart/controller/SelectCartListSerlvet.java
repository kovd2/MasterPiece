package com.kh.MasterPiece.cart.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.admin.model.service.testService;
import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.board.model.vo.PageInfo;
import com.kh.MasterPiece.cart.model.vo.Cart;
import com.kh.MasterPiece.member.model.vo.Member;

/**
 * Servlet implementation class SelectCartListSerlvet
 */
@WebServlet("/SelectCartList.swy")
public class SelectCartListSerlvet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectCartListSerlvet() {
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
				Member m = (Member)request.getSession().getAttribute("loginUser");
				
				int listCount = new testService().getCartList(m);
				
				maxPage = (int)((double)listCount / limit + 0.9);
			
				startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
			
				endPage = startPage + limit - 1;
				if(maxPage < endPage){
					endPage = maxPage;
				}

				PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);
				HashMap<String, Attachment> imgList = new testService().imgList();
				ArrayList<Cart> list = new testService().selectCartList(currentPage, limit, m);
				String page = "";
				if(list != null){
					page = "views/mypage/cart/cart_myPage.jsp";
					request.setAttribute("list", list);
					request.setAttribute("imgList", imgList);
					request.setAttribute("pi", pi);
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
