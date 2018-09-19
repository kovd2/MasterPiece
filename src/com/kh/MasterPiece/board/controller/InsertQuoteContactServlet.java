package com.kh.MasterPiece.board.controller;

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

import com.kh.MasterPiece.board.model.service.BoardService;
import com.kh.MasterPiece.board.model.vo.Attach;
import com.kh.MasterPiece.board.model.vo.Board;
import com.kh.MasterPiece.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class InsertBoardServlet
 */
@WebServlet("/insert.qc")
public class InsertQuoteContactServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertQuoteContactServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{	
		if(ServletFileUpload.isMultipartContent(request))
		{
			int maxSize = 1024 * 1024 * 10;
			
			String root = request.getSession().getServletContext().getRealPath("/");
			
			System.out.println("파일 root : " + root);
			
			String savePath = root + "file_upload/";
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();
			
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements())
			{
				String name = files.nextElement();
				
				saveFiles.add(multiRequest.getFilesystemName(name));
				originFiles.add(multiRequest.getOriginalFileName(name));
				
				System.out.println("fileSystem name : " + multiRequest.getFilesystemName(name));
				System.out.println("originFile : " + multiRequest.getOriginalFileName(name));
			}
			
			//String multiTitle = multiRequest.getParameter("title");
			
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String writer = String.valueOf(((Member)(request.getSession().getAttribute("loginUser"))).getUserId());
			String boardPassword = multiRequest.getParameter("boardPassword");
			
			System.out.println("title : " + title);
			System.out.println("content : " + content);
			System.out.println("writer : " + writer);
			System.out.println("boardPassword : " + boardPassword);
			
			Board b = new Board();
			
			b.setBOARD_TITLE(title);
			b.setBOARD_CONTENT(content);
			b.setBOARD_WRITER(writer);
			b.setBOARD_PWD(boardPassword);
			
			//System.out.println(savePath);
			
			ArrayList<Attach> fileList = new ArrayList<Attach>();
			
			for(int i=originFiles.size()-1; i>=0; i--)
			{
				Attach at = new Attach();
				
				at.setSaveRoute(savePath);
				at.setOriginName(originFiles.get(i));
				at.setChangeName(saveFiles.get(i));
				
				fileList.add(at);
			}
			
			int result = new BoardService().insertBoard(b, fileList);
			
			/*System.out.println("result : " + result);*/
			
			if(result > 0)
			{
				response.sendRedirect(request.getContextPath() + "/selectList.qc");
			}
			else
			{
				for(int i=0; i<saveFiles.size(); i++)
				{
					File failedFile = new File(savePath + saveFiles.get(i));
					
					failedFile.delete();
				}
				request.setAttribute("msg", "게시판 사진 등록 실패");
				request.getRequestDispatcher("views/common/errorPage.jsp");
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