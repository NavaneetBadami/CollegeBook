package com.college.memories.book.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.college.memories.book.dao.AccountVerifyDao;
import com.college.memories.book.dto.AccountVerifyBeans;

public class AccountVerifyController extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException 
	{
		try
		{
			HttpSession ses= req.getSession(false); // Create session object.
			
			String userName=(String)ses.getAttribute("username");  
			String verifyCode=req.getParameter("verifyCode").trim();		//Get the verify code from user.
			
			AccountVerifyBeans accountVerifyBeans =new AccountVerifyBeans();  //set code to bean.
			accountVerifyBeans.setUserName(userName);    
			accountVerifyBeans.setVerifyCode(verifyCode);
			
			AccountVerifyDao accountVerifyDao= new AccountVerifyDao();   //pass bean object to DAO, and get status.
			int status=accountVerifyDao.accountVerify(accountVerifyBeans);
			
			if(status>0)  // if account verified successfully. 
			{
				req.setAttribute("profileStatus", "basiNotCompleted");
				RequestDispatcher rd=req.getRequestDispatcher("detailsForm-Display.jsp");
				rd.forward(req, resp);
			}
			else       //if verified code is wrong.
			{
				System.out.println("verify Processs if not: "+status);
				req.setAttribute("wrongCode", "wrongCode");
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
			}
			
		}
		catch(Exception e)    //if session is invalidate.
		{
			System.out.println(e.getMessage());
			req.setAttribute("sessionTimeOut", "sessionTimeOut");
			req.getRequestDispatcher("logout.jsp").forward(req, resp);
		}
		
	}
}
