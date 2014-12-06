package com.college.memories.book.others;

import java.io.IOException;
import java.net.Inet4Address;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.college.memories.book.dao.LoginDao;
import com.college.memories.book.services.ConnectionProvider;
@WebServlet(name = "/sharepost", urlPatterns = { "/sharepost" }) //providing link between .jsp and servlet.

public class SharePost extends HttpServlet
{
	Connection con=ConnectionProvider.getObj().getCon();  //make connection using service.
	PreparedStatement pstm=null;
	String query="select *from collegebook.postsdb where id=?";  
	
	@Override
	public void init() throws ServletException 
	{
		try 
		{
			pstm=con.prepareStatement(query);	
			} 
			catch (SQLException e) 
			{
				System.out.println(e.getMessage());
			}
	}
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException 
	{
		
		HttpSession ses=req.getSession(false);
		String userName=(String)ses.getAttribute("username");  //get user name.
		String name=LoginDao.name4wholeApplication.get(userName);
		
		try
		{
			String id=req.getParameter("id").toString();          //get the id from href.
			int idValue=Integer.parseInt(id);					//parse it to integer.	
		
			try {
				pstm.setInt(1, idValue);
				ResultSet res= pstm.executeQuery();            //execute query.
				
				if(res.next())								//check the id.
				{
					String fUserName=res.getString(2);
					String fName=res.getString(3);					//get the friend name,user name and his post.
					String fPost=res.getString(4);
					
					  Date sysDateTime = new java.util.Date();
				      SimpleDateFormat stf =  new SimpleDateFormat("HH:mm:ss");
				      SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");
				      String sharedTime = stf.format(sysDateTime);
				      String sharedDate= sdf.format(sysDateTime);
					
				      String System_ip_address=Inet4Address.getLocalHost().getHostAddress(); //Get message posted system IP Address.
				       					//Then create another Prepared statement,query and execute the query.
				      
						PreparedStatement pstm=null;
						String query2="insert into collegebook.postsdb(Username,Name,Post,Date,Time,Sharedfromfusername,Sharedfromfname,System_IP,Status) values(?,?,?,?,?,?,?,?,?)";
						
						pstm=con.prepareStatement(query2);
						pstm.setString(1, userName);
						pstm.setString(2, name);
						pstm.setString(3, fPost);
						pstm.setString(4, sharedDate);
						pstm.setString(5, sharedTime);
						pstm.setString(6, fUserName);
						pstm.setString(7, fName);
						pstm.setString(8, System_ip_address);
						pstm.setString(9, "Success");
						
						pstm.executeUpdate();                   //execute query.
						System.out.println("Post shared..!");  //just to verify.
						resp.sendRedirect("postBox-Display.jsp"); //Skip to message display page.
					}
					else
					{
						resp.sendRedirect("postBox-Display.jsp"); //if post not shared.
					}
				} 
				catch (SQLException e) 
				{
					System.out.println(e.getMessage());
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
	@Override
	public void destroy()
	{
		try
		{
			pstm.close(); //close Connection and optional statement
//			con.close();
		} 
		catch (SQLException e) 
		{
			System.out.println(e.getMessage());
		}
	}
}
