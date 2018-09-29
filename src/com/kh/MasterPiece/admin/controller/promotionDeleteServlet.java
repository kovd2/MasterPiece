package com.kh.MasterPiece.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.admin.model.service.testService;

@WebServlet("/promotionDelete.h")
public class promotionDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public promotionDeleteServlet() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String proNo = request.getParameter("proNo");

		int result = new testService().promotionDelete(proNo);
		
		if(result > 0){
			
			response.sendRedirect(request.getContextPath() + "/promotionList.h");
			
			
		}else{
	
			request.setAttribute("msg", "프로모션 삭제 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		};
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
