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
				//폼 전송을 multipart/form-data로 전송하는 경우에는
				//기존처럼 request.getParameter로 값을 받을 수 없다.
				//cos.jar가 파일도 받고 다른 값들도 받아주는 역할을 한다.
				//com.orellilly.servlet의 약자이다.
				
				/*String title = request.getParameter("title");
				System.out.println(title);*/
				
				if(ServletFileUpload.isMultipartContent(request)){
					//전송 파일 용량 제한 : 10MB로 제한한 경우
					int maxSize = 1024 * 1024 * 10;
					
					//웹 서버 컨테이너 경로 추출함
					String root = request.getSession().getServletContext().getRealPath("/");
					
					System.out.println(root);
					
					//파일 저장 경로 설정
					String savePath = root + "images/product";
					
					//사용자가 올린 파일명을 그대로 저장하지 않는 것이 일반적이다.
					//1. 같은 파일명이 있는 경우 이전 파일을 덮어 쓸 수 있다.
					//2. 한글로 된 파일명, 특수기호나 띄어쓰기 등은 서버에 따라서 문제가 생길 수 도 있다.
					//DefaultFileRenamePolicy는 같은 파일명이 존재하는지를 검사하고
					//파일명이 겹치는 경우 파일명 뒤에 숫자를 붙여준다.
					//ex : aaa.zip, aaa1.zip, aaa2.zip
					
					/*MultipartRequest multiRequest 
					= new MultipartRequest(request, savePath, maxSize, 
											"UTF-8", new DefaultFileRenamePolicy());*/
					
					MultipartRequest multiRequest
					= new MultipartRequest(request, savePath, maxSize,
											"UTF-8", new MyFileRenamePolicy());
					
					
					//저장한 파일의 이름을 저장할 arrayList생성
					ArrayList<String> saveFiles = new ArrayList<String>();
					//원본 파일의 이름을 저장할 arrayList생성
					ArrayList<String> originFiles = new ArrayList<String>();
					
					//파일의 이름을 반환한다.
					Enumeration<String> files = multiRequest.getFileNames();
					
					//각 파일의 정보를 구해 DB에 저장할 목적의 데이터를 꺼낸다.
					while(files.hasMoreElements()){
						String name = files.nextElement();
						
						saveFiles.add(multiRequest.getFilesystemName(name));
						originFiles.add(multiRequest.getOriginalFileName(name));
						
						System.out.println("fileSystem name : " + multiRequest.getFilesystemName(name));
						System.out.println("originFile : " + multiRequest.getOriginalFileName(name));
					}
					
					//multipartRequest 객체에서 파일 이외의 값을 가져올 수 도 있다.
					String multiName = multiRequest.getParameter("name");
					String multiCode = multiRequest.getParameter("code");
					int multiPrice = Integer.parseInt(multiRequest.getParameter("price"));
					String multiCategory = multiRequest.getParameter("category");
					String multiManufacturer = multiRequest.getParameter("MANUFACTURER");
					int multiStock = Integer.parseInt(multiRequest.getParameter("stock"));
					System.out.println(multiName);
					System.out.println(multiCode);
					System.out.println(multiPrice);
					System.out.println(multiCategory);
					System.out.println(multiManufacturer);
					System.out.println(multiStock);
					
					Product p = new Product();
					p.setPrd_name(multiName);
					p.setPrd_code(multiCode);
					p.setPrice(multiPrice);
					p.setCategory(multiCategory);
					p.setManufacturer(multiManufacturer);
					p.setStock(multiStock);
					//Attachment객체 생성하여 ArrayList객체 생성
					ArrayList<Attachment> fileList = new ArrayList<Attachment>();
					
					for(int i = originFiles.size() - 1; i >= 0; i--){
						Attachment at = new Attachment();
						at.setFilePath(savePath);
						at.setOriginName(originFiles.get(i));
						System.out.println(originFiles.get(i));
						at.setChangeName(saveFiles.get(i));
						
						fileList.add(at);
					}
					
					//service 전송
					int result = new testService().insertProduct(p, fileList);
					
					System.out.println("결과 : " + result);
					
					if(result > 0){
						response.sendRedirect(request.getContextPath() + "/productList.swy");
					}else{
						//실패시 저장된 파일 삭제
						for(int i = 0; i < saveFiles.size(); i++){
							//파일시스템에 저장된 이름으로 파일 객체 생성함
							File failedFile = new File(savePath + saveFiles.get(i));
							
							failedFile.delete();
						}
						
						//에러페이지로 메세지 전달
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
