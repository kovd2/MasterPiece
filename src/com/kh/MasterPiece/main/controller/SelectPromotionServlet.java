package com.kh.MasterPiece.main.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.admin.model.vo.Promotion;
import com.kh.MasterPiece.admin.model.vo.Promotion_ATT;
import com.kh.MasterPiece.main.model.service.MainService;

@WebServlet("/promotion.tn")
public class SelectPromotionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public SelectPromotionServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		ArrayList<Promotion> list = new MainService().promotionList();
		HashMap<String, Promotion_ATT> imgList = new MainService().promotionImageList();
		
		for(int i = 0; i < imgList.size(); i++){
			System.out.println(imgList + "프로모션");
		}
		
		String page = "";
		if(list != null){
			page = "mainTest.jsp";
			request.setAttribute("list", list);
			request.setAttribute("imgList", imgList);
		}else{
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "실패");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
