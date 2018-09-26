package com.kh.MasterPiece.serviceCenter.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.MasterPiece.serviceCenter.model.service.AfterServiceService;
import com.kh.MasterPiece.serviceCenter.model.vo.AfterService;

/**
 * Servlet implementation class InsertAfterServiceServlet
 */
@WebServlet("/insertExchange.af")
public class InsertAfterServiceServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAfterServiceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String userId = request.getParameter("userId");
		String prdCode = request.getParameter("prdCode");
		String reason = request.getParameter("reason");
		String boardContent = request.getParameter("boardContent");
		String howToRegister = request.getParameter("howToRegister");
		String bank = request.getParameter("bank");
		String bankNum = request.getParameter("bankNum");
		String bankUserName = request.getParameter("bankUserName");
		
		System.out.println("userId : " + userId);
		System.out.println("prdCode : " + prdCode);
		System.out.println("reason : " + reason);
		System.out.println("boardContent : " + boardContent);
		System.out.println("howToRegister : " + howToRegister);
		System.out.println("bank : " + bank);
		System.out.println("bankNum : " + bankNum);
		System.out.println("bankUserName : " + bankUserName);
		
		AfterService as = new AfterService();
		
		as.setUserId(userId);
		as.setPrdCode(prdCode);
		as.setReason(reason);
		as.setBoardContent(boardContent);
		as.setHowToRegister(howToRegister);
		as.setBank(bank);
		as.setBankNum(bankNum);
		as.setBankUserName(bankUserName);
		
		System.out.println("------------------------------");
		System.out.println("userId : " + as.getUserId());
		System.out.println("prdCode : " + as.getPrdCode());
		System.out.println("reason : " + as.getReason());
		System.out.println("boardContent : " + as.getBoardContent());
		System.out.println("howToRegister : " + as.getHowToRegister());
		System.out.println("bank : " + as.getBank());
		System.out.println("bankNum : " + as.getBankNum());
		System.out.println("bankUserName : " + as.getBankUserName());
		
		int result = new AfterServiceService().insertAfterService(as);
		
		if(result > 0)
		{
			response.sendRedirect(request.getContextPath() + "/selectExchange.af");
		}
		else
		{
			request.setAttribute("msg", "교환.반품.AS 등록 실패");
			request.getRequestDispatcher("views/common/errorPage.jsp");
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
