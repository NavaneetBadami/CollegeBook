package com.college.memories.book.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.college.memories.book.dao.LoginDao;
import com.college.memories.book.dao.PostsDao;
import com.college.memories.book.dto.PostsBeans;

public class PostsController extends HttpServlet 
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
			HttpSession ses=req.getSession(false);
			String sesUserName=(String)ses.getAttribute("username");
			
			String iName=LoginDao.name4wholeApplication.get(sesUserName);	//Maintain same Name in two tables i.e userDetails and postsDb tables.
			
				String post=req.getParameter("userPost");  //Get the post from user
			
				PostsBeans postsBeans=new PostsBeans(); //create postBeans object
				postsBeans.setSesUserName(sesUserName); //set the values.
				
				postsBeans.setiName(iName);
				postsBeans.setPost(post);
				
				PostsDao status=new PostsDao();  //Transfer that bean object to DAO
				int value=status.storePosts(postsBeans);     //returns integer 
				if(value>0)
				{
					resp.sendRedirect("postBox-Display.jsp");  //post stored in DB
				}
				else
				{
					resp.sendRedirect("inbox");  //not Stored.
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
