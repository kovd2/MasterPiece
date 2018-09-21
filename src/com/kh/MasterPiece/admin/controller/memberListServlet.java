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
import com.kh.MasterPiece.board.model.vo.PageInfo;
import com.kh.MasterPiece.member.model.vo.Member;

/**
 * Servlet implementation class memberListServlet
 */
@WebServlet("/memberList.swy")
public class memberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//페이징처리 추가시 필요 변수 선언
				int currentPage;		//현재 페이지를 표시할 변수
				int limit;				//한 페이지에 게시글이 몇 개가 보여질 것인지 표시
				int maxPage;			//전체 페이지에서 가장 마지막 페이지
				int startPage;          //한 번에 표시될 페이지가 시작할 페이지
				int endPage;            //한 번에 표시될 페이지가 끝나는 페이지

				//게시판은 1페이지부터 시작함
				currentPage = 1;

				//한 페이지에 보여질 목록 갯수
				limit = 10;

				if(request.getParameter("currentPage") != null){
					currentPage 
					= Integer.parseInt(request.getParameter("currentPage"));
				}

				//전체 목록 갯수를 리턴받음
				int listCount = new testService().getMemberListCount();
				System.out.println("listCount : " + listCount);
				//총 페이지수 계산
				//예) 목록 수가 123개이면 페이지가 13개가 필요함
				maxPage = (int)((double)listCount / limit + 0.9);
				System.out.println("maxPage : " + maxPage);
				//시작페이지 계산
				//11, 21, 31
				startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
				System.out.println("startPage : " + startPage);
				//목록 아래쪽에 보여질 마지막 페이지 수
				endPage = startPage + limit - 1;
				System.out.println("endPage : " + endPage);
				if(maxPage < endPage){
					endPage = maxPage;
				}

				PageInfo pi = new PageInfo(currentPage, listCount, limit, maxPage, startPage, endPage);

				//ArrayList<Product> list = new testService().productList();
				ArrayList<Member> list = new testService().selectMemberList(currentPage, limit);
				String page = "";
				if(list != null){
					page = "views/admin/member/member.jsp";
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
