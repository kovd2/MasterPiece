package com.kh.MasterPiece.payMent.controller;

import java.io.IOException;
import java.util.HashMap;

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
		String id = request.getParameter("id");
		int price = Integer.parseInt(request.getParameter("price"));
		String select = request.getParameter("select");
		String name = request.getParameter("name");
		String applyno = request.getParameter("applyno");
		String recipient = request.getParameter("recipient");
		String address = request.getParameter("address");
		String tel = request.getParameter("tel");
		String etc = request.getParameter("etc");
		String count = request.getParameter("count");
		
		Member m = (Member)request.getSession().getAttribute("loginUser");
		String orderCheck = m.getOrderCheck();
		
		int result =0;
		if(select.equals("bank")){
			 result = new payMentService().payMentBank(id, price, select, name, recipient, address, tel, etc);
			int result1 = new payMentService().testUp(orderCheck, result);
			//int result4 = new payMentService().afterPayment(id, orderCheck);
			int result6 = new payMentService().buyHistory(orderCheck);
			//int result7 = new payMentService().sellCountUp()
			
		}else{
			 result = new payMentService().payMentCard(id, price, select, applyno, recipient, address, tel, etc);
			int result3 = new payMentService().testUp2(orderCheck, result);
			//int result5 = new payMentService().afterPayment(id, orderCheck);
			int result6 = new payMentService().buyHistory2(orderCheck);
			
		}
		/*System.out.println("test : "+result);
		HashMap<String,Integer> map = new payMentService().count(orderCheck);
		System.out.println(map);
		int result8 = new payMentService().update(map);
		System.out.println(result8);*/
		if(result > 0){
			m.setOrderCheck(null);
			request.getSession().setAttribute("loginUser", m);
			request.getRequestDispatcher("/views/product/complet_payment.jsp").forward(request, response);
			//response.sendRedirect(request.getContextPath() + "/views/product/complet_payment.jsp");
		}else{
			response.sendRedirect(request.getContextPath() + "/views/common/errorPage.jsp");
		}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
