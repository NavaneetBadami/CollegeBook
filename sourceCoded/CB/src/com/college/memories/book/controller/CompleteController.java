package com.college.memories.book.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.college.memories.book.dao.CompleteDao;
import com.college.memories.book.dao.LoginDao;
import com.college.memories.book.dto.CompleteBeans;

public class CompleteController extends HttpServlet
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
				HttpSession ses=req.getSession(false);
				String sesUserName=(String)ses.getAttribute("username");
				
					String name=req.getParameter("name").trim().toUpperCase();  //Get the Values from browser i.e Client
					String gender=req.getParameter("gender");  
					String address=req.getParameter("homeAddress").trim().toUpperCase();
					String city=req.getParameter("city").trim().toUpperCase();
					String state=req.getParameter("state");
					String marital=req.getParameter("maritalStatus");
					String dob=req.getParameter("dob");
					
					CompleteBeans completeBeans=new CompleteBeans(); //assign or set the values to bean object
					
					completeBeans.setAddress(address);
					completeBeans.setCity(city);
					completeBeans.setDate(dob);
					completeBeans.setGender(gender);
					completeBeans.setMarital(marital);
					completeBeans.setState(state);
					completeBeans.setName(name);
					
					completeBeans.setSesUserName(sesUserName); //Set the Session object i.e Username to Bean
					
					
					CompleteDao status=new CompleteDao();
					int value=status.completeProfile(completeBeans); //Transfer that bean object to DAO
					
					if(value>0) //if values are updated
					{	
						LoginDao.name4wholeApplication.put(sesUserName, name); //<Key,Value> pair. used in careerController.
						
						req.setAttribute("basicCompleted", "basicCompleted");
						RequestDispatcher rd=req.getRequestDispatcher("detailsForm-Display.jsp");//Forward to Register.jsp for Further Process.
						rd.forward(req, resp);
					}
					else
					{
							resp.sendRedirect("detailsForm-Display.jsp"); //If any problem arises.
					}
			}
			catch(Exception e)
			{
				System.out.println(e.getMessage());
				req.setAttribute("sessionTimeOut", "sessionTimeOut");
				req.getRequestDispatcher("logout.jsp").forward(req, resp);
			}	
			
		}
		@Override
		public void doGet(HttpServletRequest req, HttpServletResponse resp)	throws ServletException, IOException
		{
			doPost(req, resp);
		}
}
