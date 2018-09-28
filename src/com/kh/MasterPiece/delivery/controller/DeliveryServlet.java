package com.kh.MasterPiece.delivery.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.cart.model.vo.Cart;
import com.kh.MasterPiece.delivery.model.service.DeliveryService;

/**
 * Servlet implementation class DeliveryServlet
 */
@WebServlet("/delivery")
public class DeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public DeliveryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String value = request.getParameter("val");
		String values [] = value.split(",");
		
		int result = new DeliveryService().insertDelivery(values);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}














