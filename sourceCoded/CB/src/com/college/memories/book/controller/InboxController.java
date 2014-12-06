package com.college.memories.book.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.ListIterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.college.memories.book.dao.InboxDao;
import com.college.memories.book.dao.LoginDao;
import com.college.memories.book.dto.InboxBeans;
public class InboxController extends HttpServlet
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
			HttpSession ses=req.getSession(false); //Session Object to false
			String userName=(String)ses.getAttribute("username");
			
				InboxBeans inboxBeans=new InboxBeans(); //set the session value(userName) to inboxBeans.
				inboxBeans.setUserName(userName);
				
				InboxDao status=new InboxDao();          //And transfer session value to DAO i.e InboxDao
				ArrayList<InboxBeans> list=status.inboxDisplay(inboxBeans);  //The return Type of DAO is List			
				ListIterator<InboxBeans> listed=list.listIterator();  	//Use Iterator for getting the values
				
				while(listed.hasNext())
				{
					InboxBeans ib=(InboxBeans)listed.next(); 		 //DownCast the list to beans
																	//Set the Attributes
					 req.setAttribute("password",ib.getPassword()); //Here we can also use String password=ib.getPassword();req.setAttribute("password",password);
					 req.setAttribute("gender",ib.getGender());
					 req.setAttribute("dob",ib.getDob());
					 req.setAttribute("homeAddress",ib.getAddress());
					 req.setAttribute("city",ib.getCity());
					 req.setAttribute("state",ib.getState());
					 req.setAttribute("mobileNo",ib.getMobileNo());
					 req.setAttribute("maritalStatus",ib.getMarital());
					 req.setAttribute("emailId",ib.getEmail());
					 req.setAttribute("name",ib.getName());
					 															//From table careers.
					 req.setAttribute("degree",ib.getDegree());
					 req.setAttribute("collegeName",ib.getCollegeName());
					 req.setAttribute("location",ib.getLocation());
					 req.setAttribute("company",ib.getCompany());
					 req.setAttribute("desgination",ib.getDesgination());
					 req.setAttribute("currentAddress",ib.getCurrentAddress());
					 req.setAttribute("currentState",ib.getCurrentState());
				}
				
				 String notfound=(String)req.getAttribute("notfound");//This Object is being taken from SearchMamberController to indicate Member Not Found.
				 req.setAttribute("notfound", notfound);              //pass  notfound string to View
				 
				 String updated=(String)req.getAttribute("updated"); //This Object is being taken from UpdateController to indicate that values have been changed
				 req.setAttribute("updated", updated);  			//pass updated String to view
				 
				 RequestDispatcher rd= req.getRequestDispatcher("/inBox-Display.jsp"); //forward all Fetched Values to inboxdisp.jsp for view
				 rd.forward(req, resp);	// forward
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
