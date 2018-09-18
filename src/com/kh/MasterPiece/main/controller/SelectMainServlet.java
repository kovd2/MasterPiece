package com.kh.MasterPiece.main.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.plaf.synth.SynthStyle;

import com.kh.MasterPiece.main.model.service.MainService;
import com.kh.MasterPiece.main.model.vo.MainTest;


@WebServlet("/main.tn")
public class SelectMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectMainServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<MainTest> list = new MainService().selectProduct();
		
		String page = null;
		if(list != null){
			page = "index.jsp";
			request.setAttribute("list", list);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "실패");
		}
		
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
