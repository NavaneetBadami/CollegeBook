package com.college.memories.book.others;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.college.memories.book.dto.EmailBeans;
import com.college.memories.book.services.ConnectionProvider;

public class ReSendVerificationCode extends HttpServlet
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
		Connection con=ConnectionProvider.getObj().getCon();
		Statement stm=null;
		String userName=req.getParameter("resendEmailTo").trim().toUpperCase();
		String query="select *from collegebook.userdetails where username='"+userName+"'";
		String value=null;
		
		try 
		{
			stm=con.createStatement();
			ResultSet res=stm.executeQuery(query);
			if(res.next())            //if userName found.
			{
				String emailId=res.getString("email");                 //get the email and Code.
				String accountVerificationCode=res.getString("AccountVerificationCode");
				
				String host=emailBeans.getHost();    //Get the SMTP values through beans.
				String port=emailBeans.getPort();
				String adminUser=emailBeans.getAdminUser();
				String adminPass=emailBeans.getAdminPass();
				
				String recipient = emailId;
				String subject = "CollegeBook Verification";
				String content = "Hi "+userName+",\n  \nWelCome to CollegeBook, thanks for joining CollegeBook. \nPlease use this code for Account Verification: " +accountVerificationCode+" \n \nRegards, \nCollegeBook Team";  // Email Message.
				
				try 
				{
					EmailUtility.sendEmail(host, port, adminUser, adminPass, recipient, subject, content);//Call the Static sendEmail method.
					
					value="reSentEmail";   //resent code email successfully.
					System.out.println("The resent e-mail was sent successfully");
				} 
				catch (Exception e)
				{
					value="emailNotReSent";	 //resent code email fail.
					System.out.println("Email not Resent "+e.getMessage());	
				} 	
			}
			else           //if userName is wrong.
			{
				System.out.println("wrong username");
				value="worngUserName";
			}
			
			req.setAttribute("status", value);   //forward Status to login.jsp.
			RequestDispatcher rd= req.getRequestDispatcher("login.jsp");
			rd.forward(req, resp);	
		}
		catch (SQLException e) 
		{
			System.out.println(e.getMessage());
		}
		finally
		{
			try 
			{
				stm.close();
	//			con.close();
			} catch (SQLException e) 
			{
				e.printStackTrace();
			}
		}

	}
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException 
	{
		doPost(req, resp);
	}
}
