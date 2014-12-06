package com.college.memories.book.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.college.memories.book.dao.DeleteProfileDao;
import com.college.memories.book.dto.DeleteProfileBeans;

public class DeleteProfileController extends HttpServlet
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
			HttpSession ses= req.getSession(false);
			String userName=(String)ses.getAttribute("username");//This User will deleted.
			
			
				DeleteProfileBeans deleteProfileBeans=new DeleteProfileBeans(); //Set username to bean object. 
				deleteProfileBeans.setDeleteUserName(userName);
				
				DeleteProfileDao status=new DeleteProfileDao(); //Pass bean object to DAO. It Returns integer value.
				int value=status.deleteprofile(deleteProfileBeans); 
				
				if(value>0)       //If record Deleted.
				{
					resp.sendRedirect("logout.jsp");
				}
				else             //If record Not deleted.
				{
					req.setAttribute("onepost","onepost"); //If case profile not deleted.
					RequestDispatcher rd=req.getRequestDispatcher("/inbox");
					rd.forward(req, resp);
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
	public void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException 
	{
		doGet(req, resp);
	}
}
