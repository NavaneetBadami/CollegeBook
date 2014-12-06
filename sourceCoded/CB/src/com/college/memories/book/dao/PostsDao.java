package com.college.memories.book.dao;

import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.college.memories.book.dto.PostsBeans;
import com.college.memories.book.services.ConnectionProvider;

public class PostsDao 
{
	public int storePosts(PostsBeans postsBeans)
	{
		int status=0;
		Connection con=ConnectionProvider.getObj().getCon(); //make connection using service.
		
		PreparedStatement pstm=null;
		String query="insert into collegebook.postsdb (Username,Name,Post,Date,Time,System_IP,Status) values(?,?,?,?,?,?,?)";
		try 
		{
		
			pstm=con.prepareStatement(query);
			
			 String sesUserName=postsBeans.getSesUserName(); //get session and other object through bean.
			 String iName=postsBeans.getiName();
			 String post=postsBeans.getPost();
			 											//Create Date Object to store in DB acco to post stores. 
			   Date sysDateTime = new java.util.Date();
		       SimpleDateFormat stf =  new SimpleDateFormat("HH:mm:ss");//Make simple time Format accor to Sql Format.
		       SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");//Make simple date Format accor to Sql Format.
		       String postedTime = stf.format(sysDateTime); //Pass the Date& Time object in Your Format.
		       String postedDate= sdf.format(sysDateTime);
		       
			   String System_ip_address=Inet4Address.getLocalHost().getHostAddress(); //Get post Message system IP Address.
			   pstm.setString(1,sesUserName );
			   pstm.setString(2, iName);
			   pstm.setString(3, post);
			   pstm.setString(4, postedDate);
			   pstm.setString(5, postedTime);
			   pstm.setString(6, System_ip_address);
			   pstm.setString(7, "Success");
			   status = pstm.executeUpdate();  //Execute query.
			
		} 
		catch (SQLException e)
		{
			System.out.println(e.getMessage());
		} 
		catch (UnknownHostException e) 
		{
			System.out.println(e.getMessage());
		}
		finally
		{
			try 
			{
				pstm.close();
	//			con.close();   //close connection.
			}
			catch (SQLException e) 
			{
				System.out.println(e.getMessage());
			}
		}
		return status;   //return status;
	}
}
