package com.kh.MasterPiece.admin.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.MasterPiece.admin.model.service.testService;
import com.kh.MasterPiece.board.model.vo.Attachment;
import com.kh.MasterPiece.common.MyFileRenamePolicy;
import com.kh.MasterPiece.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class productInsertServlet
 */
@WebServlet("/productInsert.swy")
public class productInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public productInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
				if(ServletFileUpload.isMultipartContent(request)){
					int maxSize = 1024 * 1024 * 10;
					
					String root = request.getSession().getServletContext().getRealPath("/");
					
					
					String savePath = root + "images/product";
					
					
					MultipartRequest multiRequest
					= new MultipartRequest(request, savePath, maxSize,
											"UTF-8", new MyFileRenamePolicy());
					
					
					ArrayList<String> saveFiles = new ArrayList<String>();
					ArrayList<String> originFiles = new ArrayList<String>();
					
					Enumeration<String> files = multiRequest.getFileNames();
					
					while(files.hasMoreElements()){
						String name = files.nextElement();
						
						saveFiles.add(multiRequest.getFilesystemName(name));
						originFiles.add(multiRequest.getOriginalFileName(name));
						
					}
					
					String multiName = multiRequest.getParameter("name");
					String multiCode = multiRequest.getParameter("code");
					int multiPrice = Integer.parseInt(multiRequest.getParameter("price"));
					String multiCategory = multiRequest.getParameter("category");
					String multiManufacturer = multiRequest.getParameter("MANUFACTURER");
					int multiStock = Integer.parseInt(multiRequest.getParameter("stock"));
					
					Product p = new Product();
					p.setPrd_name(multiName);
					p.setPrd_code(multiCode);
					p.setPrice(multiPrice);
					p.setCategory(multiCategory);
					p.setManufacturer(multiManufacturer);
					p.setStock(multiStock);
					ArrayList<Attachment> fileList = new ArrayList<Attachment>();
					
					for(int i = originFiles.size() - 1; i >= 0; i--){
						Attachment at = new Attachment();
						at.setFilePath(savePath);
						at.setOriginName(originFiles.get(i));
						at.setChangeName(saveFiles.get(i));
						
						fileList.add(at);
					}
					
					int result = new testService().insertProduct(p, fileList);
					
					
					if(result > 0){
						response.sendRedirect(request.getContextPath() + "/productList.swy");
					}else{
						for(int i = 0; i < saveFiles.size(); i++){
							File failedFile = new File(savePath + saveFiles.get(i));
							
							failedFile.delete();
						}
						
						request.setAttribute("msg", "사진게시판 등록 실패!");
						request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
						
					}
					
					
				}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
