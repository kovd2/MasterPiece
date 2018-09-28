package com.kh.MasterPiece.admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.admin.model.service.testService;
import com.kh.MasterPiece.admin.model.vo.Promotion;
import com.kh.MasterPiece.admin.model.vo.Promotion_ATT;

@WebServlet("/promotionDetail.h")
public class promotionDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public promotionDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String no = request.getParameter("no");
		
		Promotion p = new testService().promotionDetail(no);
		Promotion_ATT pa = new testService().promotion_ATTDetail(no);
		
		String page = "";
		if(p != null && pa != null){
			page = "views/admin/promotion/promotionDetail.jsp";
			request.setAttribute("Promotion", p);
			request.setAttribute("Promotion_ATT", pa);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "에러");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
