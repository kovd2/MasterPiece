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

@WebServlet("/promotionInsert.tn")
public class promotionInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public promotionInsertServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
			if(ServletFileUpload.isMultipartContent(request)){
				//전송 파일 용량 제한 : 10MB로 제한한 경우
				int maxSize = 1024 * 1024 * 10;
				
				//웹 서버 컨테이너 경로 추출함
				String root = request.getSession().getServletContext().getRealPath("/");
				
				
				//파일 저장 경로 설정
				String savePath = root + "images/promotion";
				
				//사용자가 올린 파일명을 그대로 저장하지 않는 것이 일반적이다.
				//1. 같은 파일명이 있는 경우 이전 파일을 덮어 쓸 수 있다.
				//2. 한글로 된 파일명, 특수기호나 띄어쓰기 등은 서버에 따라서 문제가 생길 수 도 있다.
				//DefaultFileRenamePolicy는 같은 파일명이 존재하는지를 검사하고
				//파일명이 겹치는 경우 파일명 뒤에 숫자를 붙여준다.
				//ex : aaa.zip, aaa1.zip, aaa2.zip
				
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
					
				}
				
				String proTitle = multiRequest.getParameter("proTitle");
				String proUrl = multiRequest.getParameter("proUrl");

				//Attachment객체 생성하여 ArrayList객체 생성
				ArrayList<Attachment> fileList = new ArrayList<Attachment>();
				
				for(int i = originFiles.size() - 1; i >= 0; i--){
					Attachment at = new Attachment();
					at.setFilePath(savePath);
					at.setOriginName(originFiles.get(i));
					at.setChangeName(saveFiles.get(i));
					
					fileList.add(at);
				}
				
				//service 전송
				int result = new testService().insertPromotion(proTitle, proUrl, fileList);
				
				
				if(result > 0){
					response.sendRedirect(request.getContextPath() + "/promotionList.h");
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
