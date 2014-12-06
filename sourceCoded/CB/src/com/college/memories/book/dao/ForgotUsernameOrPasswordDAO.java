package com.college.memories.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.college.memories.book.dto.EmailBeans;
import com.college.memories.book.dto.ForgotUsernameOrPasswordBeans;
import com.college.memories.book.others.EmailUtility;
import com.college.memories.book.services.ConnectionProvider;

public class ForgotUsernameOrPasswordDAO 
{
	public int sendUsernameOrPassword(ForgotUsernameOrPasswordBeans forgotUsernameOrPasswordBeans,EmailBeans emailBeans)
	{
		Connection con=ConnectionProvider.getObj().getCon();  //make connection using services.
		PreparedStatement pstm=null;
		String query="select *from collegeBook.userdetails where Email=?";
		int status=0;
		try 
		{
			String emailId=forgotUsernameOrPasswordBeans.getEmailId();  //get email through bean.
			pstm=con.prepareStatement(query);
			pstm.setString(1, emailId);
			ResultSet res=pstm.executeQuery();  //execute the query.
			
			if(res.next())
			{
				forgotUsernameOrPasswordBeans.setUsername(res.getString("username")); //get values and set it to beans.
				forgotUsernameOrPasswordBeans.setPassword(res.getString("password"));
				forgotUsernameOrPasswordBeans.setEmailId(res.getString("email"));
				
				String username=forgotUsernameOrPasswordBeans.getUsername();
				String password=forgotUsernameOrPasswordBeans.getPassword();
				String emailID=forgotUsernameOrPasswordBeans.getEmailId();
				
				String host=emailBeans.getHost();    //Get the SMTP values through beans.
				String port=emailBeans.getPort();
				String adminUser=emailBeans.getAdminUser();
				String adminPass=emailBeans.getAdminPass();
				
				String recipient = emailID;   //generate some email.
				String subject = "CollegeBook Forgotten Username or Password";
				String content = "Hi "+username+",\n\nYour Details are as below. \nUSERNAME: "+username+"\nPASSWORD: "+password+"\nEMAILID: "+emailID+" \n \n Thanks,\n CollegeBook Team.  ";  // Email Message.
			
				try 
				{
					EmailUtility.sendEmail(host, port, adminUser, adminPass, recipient, subject, content);//Call the Static sendEmail method.
					System.out.println("The e-mail was sent successfully");
					status=2;
				} 
				catch (Exception e)
				{
					System.out.println(e.getMessage());
					System.out.println("Email not sent");
					status=1;
				} 
			}
			else
			{
				status=3;
				System.out.println("not valid email.");
			}
			
		} 
		catch (SQLException e) 
		{
			System.out.println("not working..");
			System.out.println(e.getMessage());
		}
		finally
		{
			try 
			{
				pstm.close();
	//			con.close();  //close connection.
			} 
			catch (SQLException e) 
			{
				System.out.println(e.getMessage());
			}
		}
		return status;  //return.
	}
}
