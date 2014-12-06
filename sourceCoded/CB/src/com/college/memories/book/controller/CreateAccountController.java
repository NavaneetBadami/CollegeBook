package com.college.memories.book.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.college.memories.book.dao.CreateAccountDao;
import com.college.memories.book.dto.CreateAccountBeans;
import com.college.memories.book.dto.EmailBeans;

public class CreateAccountController extends HttpServlet
{	
	/**
	 * 
	 */
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
	public void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException 
	{
		try 
		{
			String userName=req.getParameter("newUserName").trim().toUpperCase();
			String password=req.getParameter("password");
			String mobileNo=req.getParameter("mobileNo");
			String emailId=req.getParameter("emailId").trim().toLowerCase();
			
				double mobileNumber=Double.parseDouble(mobileNo);//Parsing The Values From string to double
					
				CreateAccountBeans accountBeans=new CreateAccountBeans(); //Create Bean Object assign the values
				accountBeans.setUserName(userName);
				accountBeans.setPassword(password);
				accountBeans.setEmailId(emailId);
				accountBeans.setMobileNo(mobileNumber);
				
				CreateAccountDao status=new CreateAccountDao();
				int value=status.loadValues(accountBeans,emailBeans);  //pass both UserDetails and SMTP values.
				
				String accountStatus=null;
				if(value==0) 			//if any no row updated.
				{
					accountStatus="duplicateUserName";
				}
				else if(value==1) 		//if any row updated.
				{
					accountStatus="profileCreated";
				}
				else if(value==3) 		// if Email has not been sent.
				{
					accountStatus="emailNotReSent";
				}
		
				req.setAttribute("accountStatus",accountStatus);
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp"); //Fwd to login page.
				rd.forward(req, resp);
		}
		 catch (Exception e) 
		{
			 	System.out.println(e.getMessage());
				req.setAttribute("sessionTimeOut", "sessionTimeOut");
				req.getRequestDispatcher("logout.jsp").forward(req, resp);
		}	
	}
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException 
	{
		doPost(req, resp);
	}
}
