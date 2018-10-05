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
import com.oreilly.servlet.MultipartRequest;

@WebServlet("/promotionModify.h")
public class promotionModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public promotionModifyServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(ServletFileUpload.isMultipartContent(request)){
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			
			String savePath = root + "images/promotion";
			
			
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
			
			String proTitle = multiRequest.getParameter("proTitle");
			String proUrl = multiRequest.getParameter("proUrl");
			String proNo = multiRequest.getParameter("proNo");

			ArrayList<Attachment> fileList = new ArrayList<Attachment>();
			
			for(int i = originFiles.size() - 1; i >= 0; i--){
				Attachment at = new Attachment();
				at.setFilePath(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				fileList.add(at);
			}
			
			int result = new testService().modifyPromotion(proTitle, proUrl, proNo, fileList);
			
			
			if(result > 0){
				response.sendRedirect(request.getContextPath() + "/promotionList.h");
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
