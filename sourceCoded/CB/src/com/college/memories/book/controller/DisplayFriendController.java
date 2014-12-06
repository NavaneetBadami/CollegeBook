package com.college.memories.book.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.ListIterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.college.memories.book.dao.DisplayFriendDao;
import com.college.memories.book.dto.DisplayFriendBeans;


public class DisplayFriendController extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException
	{
		try
		{
			HttpSession ses=req.getSession(false); //create session
			@SuppressWarnings("unused")
			String userName=(String)ses.getAttribute("username");
			String friendName=req.getParameter("friendName").toString();//Getting values from <a> href tag...
			String friendUserName=req.getParameter("friendUserName").toString();//Getting values from <a> href tag...
			
			
					DisplayFriendBeans displayFriendBeans=new DisplayFriendBeans(); //Pass those values to bean Object.
					displayFriendBeans.setFriendName(friendName);
					displayFriendBeans.setFriendUserName(friendUserName);
					
					DisplayFriendDao displayfrienddao=new DisplayFriendDao(); //pass bean object to DAO and return LIST.
					ArrayList<DisplayFriendBeans> list=displayfrienddao.displayFriendProfile(displayFriendBeans);
					
					ListIterator<DisplayFriendBeans> listed=list.listIterator();  //Iterate the LIST.
					while(listed.hasNext())
					{
						 DisplayFriendBeans dfb=(DisplayFriendBeans)listed.next(); //DownCast the list to Bean.
						 
						 req.setAttribute("friendUserName",dfb.getFriendUserName());  //Get the Values through bean from userdetails Table.
						 req.setAttribute("gender",dfb.getGender());
						 req.setAttribute("dob",dfb.getDob());
						 req.setAttribute("homeAddress",dfb.getAddress());
						 req.setAttribute("city",dfb.getCity());
						 req.setAttribute("state",dfb.getState());
						 req.setAttribute("mobileNo",dfb.getMobileNo());
						 req.setAttribute("maritalStatus",dfb.getMarital());
						 req.setAttribute("emailId",dfb.getEmailId());
						 req.setAttribute("friendName",dfb.getFriendName());
						 
						 req.setAttribute("degree",dfb.getDegree());    //Get the Values through bean from Careers Table.
						 req.setAttribute("collegeName",dfb.getCollege());
						 req.setAttribute("location",dfb.getLocation());
						 req.setAttribute("company",dfb.getCompany());
						 req.setAttribute("desgination",dfb.getDesgination());
						 req.setAttribute("currentAddress",dfb.getCurrentAddress());
						 req.setAttribute("currentState",dfb.getCurrentState());	 			 
					}  
					RequestDispatcher rd= req.getRequestDispatcher("friendProfile-Display.jsp"); //Forward all values to View
				    rd.forward(req, resp);	
		}
		catch(Exception e)
		{
			System.out.println(e.getMessage());
			req.setAttribute("sessionTimeOut", "sessionTimeOut");
			req.getRequestDispatcher("logout.jsp").forward(req, resp);
		}
		
	}
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException 
	{
		doGet(req, resp);
	}
	
}
