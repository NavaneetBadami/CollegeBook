package com.college.memories.book.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;




import com.college.memories.book.dao.LoginDao;
import com.college.memories.book.dto.LoginBeans;

public class LoginController extends HttpServlet implements HttpSessionListener
{
	//private static ArrayList<String> currentUserName= new ArrayList<>();
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException 
	{
		HttpSession ses= req.getSession(true); //Create Session Object
		
		String userName=req.getParameter("userName").toUpperCase(); //Convert userName into Upper case bcoz to maintain Same String between session and DB through out the Application.
		String password=req.getParameter("password");
		
			Date d1=new Date();   // checking how much time takes to login.
			long timeStarts=d1.getTime();
			
			LoginBeans loginBeans=new LoginBeans();		//Assign or Set the Values to bean object
			loginBeans.setUserName(userName);
			loginBeans.setPassword(password);
			
			LoginDao status=new LoginDao(); 		//Pass that same bean object to DAO
			int value=status.validateUser(loginBeans); 		 //it returns integer value.
			String profileStatus=null;
			
			Date d2= new Date();  //end Time.
			long timeEnds=d2.getTime();
			
			if(value==1)  		//New User,so verify Account.
			{
				System.out.println("Time taken to login: " + (timeEnds-timeStarts) +" "+ "millisec");
				ses.setAttribute("username", userName);  //CREATE SESSION OBJECT HERE.
				req.setAttribute("isNewUser", "YES");
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
				
			}
			else if(value==2)		 //Account has been Verified,so skip to register page.
			{
				System.out.println("Time taken to login: " + (timeEnds-timeStarts) +" "+ "millisec");
				ses.setAttribute("username", userName);  		//CREATE SESSION OBJECT HERE.
				profileStatus="basiNotCompleted";
				req.setAttribute("profileStatus", profileStatus);
				RequestDispatcher rd=req.getRequestDispatcher("detailsForm-Display.jsp"); 
				rd.forward(req, resp);
			}
			else if(value==3) 		 //Account has been Verified but not Career,so skip to register page.
			{	
				System.out.println("Time taken to login: " + (timeEnds-timeStarts) +" "+ "millisec");
				ses.setAttribute("username", userName);  	//CREATE SESSION OBJECT HERE.
				profileStatus="carrerNotCmpleted";
				req.setAttribute("profileStatus", profileStatus);
				RequestDispatcher rd=req.getRequestDispatcher("detailsForm-Display.jsp"); 
				rd.forward(req, resp);
			}
			else if(value==4) 	 //All done,so skip to inBox.
			{	
				System.out.println("Time taken to login: " + (timeEnds-timeStarts) +" "+"millisec");
				ses.setAttribute("username", userName);  	//CREATE SESSION OBJECT HERE.
				RequestDispatcher rd=req.getRequestDispatcher("/inbox"); 
				rd.forward(req, resp);
			}
			else   		//if Wrong userName or Password.
			{
				System.out.println("Time taken to login: " + (timeEnds-timeStarts) +" "+ "millisec");
				req.setAttribute("notValidUser", "yes");
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.forward(req, resp);
			}
		}	
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException 
	{
		doPost(req, resp);
	}
	
	private List sessions= new ArrayList<>();    	// This Section for Getting current online users count i.e Sessions.
	public void sessionCreated(HttpSessionEvent event)
	{
		HttpSession session= event.getSession();
		sessions.add(session.getId());
		session.setAttribute("counter", this);
	}
	
	@Override
	public void sessionDestroyed(HttpSessionEvent event) 
	{
		HttpSession session= event.getSession();
		sessions.remove(session.getId());
		session.setAttribute("counter", this);
		
	}
	public int getActiveSessionUser()
	{
		return sessions.size();
	}
}
