package com.kh.MasterPiece.product.controller;

import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.product.model.dao.ProductDao;
import com.kh.MasterPiece.product.model.service.ProductService;
import com.kh.MasterPiece.product.model.vo.Product;

/**
 * Servlet implementation class ProductDetailServlet
 */
@WebServlet("/prdDetail")
public class ProductDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	String fileName;
    /**
     * @see HttpServlet#HttpServlet()
     */private Properties prop = new Properties();
    public ProductDetailServlet() {
        super();
         fileName = getClass().getResource("imgSource.properties").getPath();
		
		try
		{
			prop.load(new FileReader(fileName));
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String code = request.getParameter("code");
		System.out.println("옴");
		HashMap<String, Object> infoImg = new ProductService().infoImg();
		System.out.println("infoImg : " + infoImg);
		HashMap<String, Object> hmap = new ProductService().prdDetail(code);
		HashMap<String, Object> hmap2 = new ProductService().prdDetail2(code);
		
		Product p = (Product) hmap.get("product");
		ArrayList<Attachment> imgList = (ArrayList<Attachment>)hmap.get("attachment");
		ArrayList<Attachment> imgList2 = (ArrayList<Attachment>)hmap2.get("attachment");
		
		System.out.println("imgList2 : " + imgList2);
		
		String page = "";
		
		if(p != null){
			page = "views/product/product_info.jsp";
			request.setAttribute("p", p);
			request.setAttribute("imgList", imgList);
			request.setAttribute("imgList2", imgList2);
			
			
			if(p.getManufacturer().equals("INTEL") && p.getCategory().equals("CPU")){
				request.setAttribute("beforeBuyIntelCpu", prop.getProperty("beforeBuyIntelCpu"));
				request.setAttribute("intelCpuDevision", prop.getProperty("intelCpuDevision"));	
			}
			if(p.getManufacturer().equals("AMD") && p.getCategory().equals("CPU")){
				request.setAttribute("beforeBuyAMDCpu", prop.getProperty("beforeBuyAMDCpu"));
			}
			
			
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
