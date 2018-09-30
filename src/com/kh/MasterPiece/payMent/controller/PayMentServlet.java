package com.kh.MasterPiece.payMent.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.member.model.vo.Member;
import com.kh.MasterPiece.payMent.model.service.payMentService;

/**
 * Servlet implementation class DeliveryServlet
 */
@WebServlet("/payMent")
public class PayMentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PayMentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("옴");
		String id = request.getParameter("id");
		int price = Integer.parseInt(request.getParameter("price"));
		String select = request.getParameter("select");
		String name = request.getParameter("name");
		String applyno = request.getParameter("applyno");
		System.out.println("id : " + id);
		System.out.println("price : " + price);
		System.out.println("select : " + select);
		System.out.println("name : " + name);
		System.out.println("applyno : " + applyno);
		Member m = (Member)request.getSession().getAttribute("loginUser");
		String orderCheck = m.getOrderCheck();
		
		if(select.equals("bank")){
			int result = new payMentService().payMentBank(id, price, select, name);
			int result1 = new payMentService().testUp(orderCheck,result);
			
			if(result > 0){
				response.sendRedirect(request.getContextPath() + "/views/product/complet_payment.jsp");	
			}else{
				response.sendRedirect(request.getContextPath() + "/views/common/errorPage.jsp");
			}	
		}else{
			int result3 = new payMentService().applyno(id, price, select, applyno);
			
			if(result3 > 0){
				response.sendRedirect(request.getContextPath() + "/views/product/complet_payment.jsp");
			}else{
				response.sendRedirect(request.getContextPath() + "/views/common/errorPage.jsp");
			}	
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
