package com.college.memories.book.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.college.memories.book.dao.ForgotUsernameOrPasswordDAO;
import com.college.memories.book.dto.EmailBeans;
import com.college.memories.book.dto.ForgotUsernameOrPasswordBeans;

public class ForgotUsernameOrPasswordController extends HttpServlet
{
	private static final long serialVersionUID = 1L;
	private String host;
	private String port;
	private String adminUser;
	private String adminPass;
	
	EmailBeans emailBeans=null;
	
	public void init() 
	{
		// reads SMTP server setting from web.xml file
		ServletContext context = getServletContext();
		host=context.getInitParameter("host");;
		port= context.getInitParameter("port");
		adminUser = context.getInitParameter("user");
		adminPass = context.getInitParameter("pass");
		
		emailBeans = new EmailBeans();  //set SMTP values to beans.
		emailBeans.setHost(host);
		emailBeans.setPort(port);
		emailBeans.setAdminUser(adminUser);
		emailBeans.setAdminPass(adminPass);
		
	}
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException 
	{
		String emailId=req.getParameter("forgetUnOrPass"); //get email from user.
		
		ForgotUsernameOrPasswordBeans forgotUsernameOrPasswordBeans= new ForgotUsernameOrPasswordBeans();
		forgotUsernameOrPasswordBeans.setEmailId(emailId);  //set email to beans.
		
		int status=new ForgotUsernameOrPasswordDAO().sendUsernameOrPassword(forgotUsernameOrPasswordBeans,emailBeans);
		
		if(status==1)   //if sending fail because some technical reason.
		{
			System.out.println(status);
			req.setAttribute("forgotUnPsEmailFailed", "forgotUnPsEmailFailed");
			RequestDispatcher rd= req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		}
		else if(status==2)   //if Sending Success.
		{
			System.out.println(status);
			req.setAttribute("forgotUnPsEmailSuccess", "forgotUnPsEmailSuccess");
			RequestDispatcher rd= req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		}
		else    //if email doesn't exists.
		{
			System.out.println(status);
			req.setAttribute("forgotUnPsNotValidEmail", "forgotUnPsNotValidEmail");
			RequestDispatcher rd= req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);
		}
	}
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException 
	{
		doGet(req, resp);
	}
}
