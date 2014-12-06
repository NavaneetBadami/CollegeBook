package com.college.memories.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import com.college.memories.book.dto.LoginBeans;
import com.college.memories.book.services.ConnectionProvider;

public class LoginDao 
{
	public static HashMap<String, String> name4wholeApplication= new HashMap<>(); // Static HashMap used for storing NAME.
	
	public int validateUser(LoginBeans loginBeans)
	{
		
		Connection con=ConnectionProvider.getObj().getCon(); //Make the Connection using Service.
		PreparedStatement stm=null;
		String query="select *from collegebook.userdetails where Username=? AND Password=?";
		int status=0;
		try 
		{
			stm=con.prepareStatement(query);
			
			String username=loginBeans.getUserName(); //Getting Set Values from beans. 
			String password=loginBeans.getPassword();
			
			stm.setString(1, username); 
			stm.setString(2, password);
			ResultSet res=stm.executeQuery();   //Execute query.
		
			if(res.next())                 //if record found then Check for New user or Exiting User.
			{
				String UserName=res.getString("username");
				String Name=res.getString("Name");
				double mobileNo=res.getDouble("Mobileno");
				String isNewUser=res.getString("IsNewUser");
				String isProfileCompleted=res.getString("isProfileCompleted");
				
				if((isNewUser.equalsIgnoreCase("YES")))
				{
					status=1;					// Account Verification.
				}
				else if(Name==null && isNewUser.equalsIgnoreCase("NO"))
				{
					status=2;    				// Skip to basic details in register page.
				}
				else if(isProfileCompleted.equalsIgnoreCase("YETNOT"))   //Skip to Career Section in register page.
				{
					name4wholeApplication.put(UserName, Name);  // store name, bCoz careerController needs name field. <Key,Value> pair
					status=3;
				}
				else if(isProfileCompleted.equalsIgnoreCase("YESCOMPLETED"))  
				{
					Double mobileNo4wholeApplication=(Double)mobileNo;     //these attributes are used in postController and MessageController.<Key,Value> pair
					name4wholeApplication.put(UserName, Name);
					name4wholeApplication.put("mobileNo4wholeApplication", mobileNo4wholeApplication.toString());
					
					status=4;    				// Skip to inBox.
				}
			}
			else
			{
				status=5; //error i.e record not found.
			}	
		} 
		catch (SQLException e)
		{
			System.out.println(e.getMessage());
		}
		finally{
			try 
			{
				stm.close();
	//			con.close(); //close connection.
			} 
			catch (SQLException e)
			{
				System.out.println(e.getMessage());
			}
		}
		
		return status;    //return Values.
	}
//	
//	public int validateUser(LoginBeans loginBeans)
//	{
//		
//		Connection con=ConnectionProvider.getcon(); //Make the Connection using Service.
//		PreparedStatement stm=null;
//		String query="select *from collegebook.userdetails";
//		int status=0;
//		try 
//		{
//			stm=con.prepareStatement(query);
//			
//			String username=loginBeans.getUserName(); //Getting Set Values from beans. 
//			String password=loginBeans.getPassword();
//			
////			stm.setString(1, username); 
////			stm.setString(2, password);
//			ResultSet res=stm.executeQuery();   //Execute query.
//			System.out.println("user :"+username +" "+password); //just for verify.
//			
//			HashMap<String, LoginBeans> lst= new HashMap<>();
//			
//			while(res.next())                 //if record found then Check for New user or Exiting User.
//			{
//				LoginBeans b= new LoginBeans();
//				b.setUserName(res.getString("Username"));
//				b.setPassword(res.getString("password"));
//				b.setMobileNo(res.getDouble("mobileno"));
//				b.setName(res.getString("Name"));
//				
//				lst.put(res.getString("Username"),b);
////				String Name=res.getString("Name");
////				double Mobileno=res.getDouble("Mobileno");
////				
////				if((Name==null)||(Mobileno==0))// To check complete profile.
////				{
////					status=1;	//register Page.
////				}
////				else
////				{
////					status=2;    //inbox page.
////				}
//			}
//			for ( LoginBeans ll : lst.values()) 
//			{
//				System.out.println(ll.getUserName() +" "+ ll.getName());
//			}
//			for ( LoginBeans l : lst.values()) 
//			{
//			//	System.out.println(l.getUserName() +" "+ l.getName());
//				
//				while(l.getUserName().equals(username) && l.getPassword().equals(password))
//				{
//					System.out.println("Found "+ l.getUserName() +" "+ l.getPassword());
//					 status=2;
//				}
////				if(l.getUserName().equals(username) && l.getPassword().equals(password))
////				{
////					System.out.println("Found "+ l.getUserName() +" "+ l.getPassword());
////					return status=2;
////				}
////				else
////				{
////					return status=3;
////				}
//				status =3;
//			}
//			
//
//		} 
//		catch (SQLException e)
//		{
//			System.out.println(e.getMessage());
//		}
//		finally{
//			try 
//			{
//				stm.close();
//				con.close(); //close connection.
//			} 
//			catch (SQLException e)
//			{
//				System.out.println(e.getMessage());
//			}
//		}
//		
//		return status;    //return Values.
//	}
	
}
