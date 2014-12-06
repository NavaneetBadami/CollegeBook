package com.college.memories.book.others;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.college.memories.book.services.ConnectionProvider;
@WebServlet(name = "/likecount", urlPatterns = { "/likecount" }) //providing link between .jsp and servlet

public class LikeCount extends HttpServlet
{
	Connection con=ConnectionProvider.getObj().getCon(); //Make the Connection using service
	Statement stm=null;
	
	@Override
	public void init() throws ServletException
	{
		try
		{
			stm=con.createStatement();
			System.out.println("Like connceted"); //just for verify.
		} 
		catch (SQLException e)
		{
			System.out.println(e.getMessage());
		}			
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException 
	{
		HttpSession ses=req.getSession(false);
		String userName=(String)ses.getAttribute("username");
		try
		{
			String idValue=req.getParameter("id").toString(); //Get the Id From client and parse it.
			int id=Integer.parseInt(idValue);
			
			String likedCounts=req.getParameter("likedCounts").toString(); //Get the No_of Counts from client and parse it.
			int likeCount=Integer.parseInt(likedCounts);
			 
			String likedUser=req.getParameter("likedUser").toString(); //Get the Name of User who Liked this post.
			likeCount=likeCount+1; //ADD No_OF_likes + 1;
			try
			{ 
				//INSERT ONLY USERNAME,NAME,POST NOT ID BCOZ THAT IS AUTO_INCEREMENT CONSTRAINT...
				String query="update collegebook.postsdb set Likecount='"+likeCount+"',Likeuser='"+likedUser+"' where id='"+id+"'";
				stm.executeUpdate(query);
				resp.sendRedirect("postBox-Display.jsp");
			  }
			catch (SQLException e) 
			{
				 resp.sendRedirect("postBox-Display.jsp");	//if Count couldn't loaded
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
	public void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException 
	{
		doPost(req, resp);
	}
	@Override
	public void destroy()
	{
		try
		{
			stm.close(); //close Connection and optional statement
	//		con.close();
		} catch (SQLException e) 
		{
			System.out.println(e.getMessage());
		}
	}
}
