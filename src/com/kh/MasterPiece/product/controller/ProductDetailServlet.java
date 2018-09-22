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
		
		/*Product p = new ProductService().prdDetail(code);*/
		HashMap<String, Object> hmap = new ProductService().prdDetail(code);
		
		Product p = (Product) hmap.get("product");
		ArrayList<Attachment> imgList = (ArrayList<Attachment>)hmap.get("attachment");
		
		
		
		String page = "";
		
		if(p != null){
			page = "views/product/product_info.jsp";
			request.setAttribute("p", p);
			request.setAttribute("imgList", imgList);
			
			if(p.getManufacturer().equals("Intel") && p.getCategory().equals("CPU")){
				request.setAttribute("beforeBuyIntelCpu", prop.getProperty("beforeBuyIntelCpu"));
				request.setAttribute("intelCpuDevision", prop.getProperty("intelCpuDevision"));	
				request.setAttribute("i3_8100InfoImage", prop.getProperty("i3_8100InfoImage"));
			}
			if(p.getManufacturer().equals("AMD") && p.getCategory().equals("CPU")){
				request.setAttribute("beforeBuyAMDCpu", prop.getProperty("beforeBuyAMDCpu"));
				request.setAttribute("R5_1500X_info", prop.getProperty("R5_1500X_info"));
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
