package com.college.memories.book.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.college.memories.book.dao.LoginDao;
import com.college.memories.book.dao.MessageDao;
import com.college.memories.book.dto.MessageBeans;

public class MessageController extends HttpServlet
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
	//		resp.setContentType("text/html"); 
			HttpSession ses=req.getSession(false);
			String sesUserName=(String)ses.getAttribute("username");
			
			String senderName=LoginDao.name4wholeApplication.get(sesUserName);// to maintain same userName in two tables i.e userDetails and MessageDb tables.		
			
			String senderMobile=LoginDao.name4wholeApplication.get("mobileNo4wholeApplication");  //to maintain same mobileNo in two tables i.e userDetails and MessageDb tables.
			double senderMobileNo=Double.parseDouble(senderMobile);
			
			String receiverUserName=req.getParameter("receiverUserName").trim().toUpperCase();  //get the receiver name and message from sender.
			String textMessage=req.getParameter("textMessage");
		
			
				MessageBeans messageBeans=new MessageBeans();   //Create a bean objects.
				messageBeans.setSenderUserName(sesUserName);    //Assign all the values to bean objects.
				messageBeans.setSenderName(senderName);
				messageBeans.setSenderMobileNo(senderMobileNo);
				messageBeans.setReceiverUserName(receiverUserName);
				messageBeans.setMessage(textMessage);
				
				MessageDao messageDao=new MessageDao();     //Transfer bean object to DAO.
				int status=messageDao.sendMessage(messageBeans);   //get the integer as a status.
				
				
				 String message=null;
//			     PrintWriter out = resp.getWriter();
				if(status>0)
				{
					req.setAttribute("messageSent","messageSent");
//					System.out.println("Stataus "+ status);              //Using Ajax printing mesage. 
//					message="Message has been Sent to "+receiverUserName+".";
				}
				else
				{
					System.out.println("Member Not Found...!");
					req.setAttribute("memberNotFound", "memberNotFound");       //if member not found.
					
//					System.out.println("Stataus "+ status);
//					message="Sorry..! Sending fail, please Check Friend UserName.";
				}
			//	out.println(message);
//				resp.getWriter().write(message);  //print directly to jsp page without reloading.
				RequestDispatcher rd=req.getRequestDispatcher("messageBox-Display.jsp");
				rd.forward(req , resp);
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());   //if session expires.
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
