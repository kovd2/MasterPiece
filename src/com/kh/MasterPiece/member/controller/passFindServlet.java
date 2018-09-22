package com.kh.MasterPiece.member.controller;

import java.io.IOException;
import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.member.model.service.MemberService;
import com.kh.MasterPiece.member.util.Gmail;


@WebServlet("/passFind")
public class passFindServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public passFindServlet() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String userId = request.getParameter("userId");
		String email = request.getParameter("email");
		
		int result = new MemberService().passFind(userId, email);

		String page = "";
		
		if(result > 0){
			page = "views/member/findPassBefore.jsp";
			
			Properties props = System.getProperties();
	        props.put("mail.smtp.user", "masterpieceTest1@gmail.com");
	        props.put("mail.smtp.host", "smtp.gmail.com");
	        props.put("mail.smtp.port", "465");
	        props.put("mail.smtp.starttls.enable", "true");
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.socketFactory.port", "465");
	        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	        props.put("mail.smtp.socketFactory.fallback", "false");

	        Authenticator auth = new Gmail();
	        
	        //세션 생성 및 마임메세지 생성
	        
	        Session session = Session.getDefaultInstance(props, auth);
	        MimeMessage msg = new MimeMessage(session);
	        
	        try{
	        	
	        	msg.setSentDate(new Date());
	        	
	        	InternetAddress from = new InternetAddress("masterpieceTest1@gmail.com");
	        	
	        	//이메일 발신자
	        	msg.setFrom(from);
	        	
	        	//이메일 수신자
	        	InternetAddress to = new InternetAddress(email);
	        	msg.setRecipient(Message.RecipientType.TO, to);
	        	
	        	//이메일 제목
	        	msg.setSubject("MasterPiece 비밀번호 찾기 입니다.", "UTF-8");
	        	
	        	//이메일 내용
	        	String code = request.getParameter("code_check"); //인증번호 값받기
	        	
	        	request.setAttribute("code", code);
	        	msg.setText(code, "UTF-8");
	        	
	        	//이메일 헤더
	        	msg.setHeader("content-Type", "text/html");
	        	
	        	//이메일 보내기
	        	javax.mail.Transport.send(msg);

	        }catch(AddressException addr_e){
	        	addr_e.printStackTrace();
	        }catch(MessagingException msg_e){ 	
	        	msg_e.printStackTrace();
	        }

			request.setAttribute("userId", userId);
			request.setAttribute("email", email);
		}else{
			
			
			page = "views/member/passFindError.jsp";
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
