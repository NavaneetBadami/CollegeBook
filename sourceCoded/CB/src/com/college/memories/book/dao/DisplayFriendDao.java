package com.college.memories.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.college.memories.book.dto.DisplayFriendBeans;
import com.college.memories.book.services.ConnectionProvider;

public class DisplayFriendDao
{
	public ArrayList<DisplayFriendBeans> displayFriendProfile(DisplayFriendBeans displayFriendBeans)
	{
		Connection con=ConnectionProvider.getObj().getCon(); //Make the Connection using service.
		
		ArrayList<DisplayFriendBeans> list=new ArrayList<DisplayFriendBeans>();
//		Statement stm=null;
		PreparedStatement pstm=null;		
		String query ="select *from collegebook.userdetails as u inner join collegebook.careers as c on u.Username=? And c.Username=? And u.Name=? And c.Name=?";
		
		try 
		{
//			stm=con.createStatement();
			pstm=con.prepareStatement(query);
			
			String friendname=displayFriendBeans.getFriendName(); //Get the values through bean
			String friendusername=displayFriendBeans.getFriendUserName();
			
					//inner join query to data from two tables,Using particular user name and Name. 
//			String query ="select *from collegebook.userdetails as u inner join collegebook.careers as c on u.Username='"+friendusername+"' And c.Username='"+friendusername+"' And u.Name='"+friendname+"' And c.Name='"+friendname+"'";
			pstm.setString(1, friendusername);
			pstm.setString(2, friendusername);
			pstm.setString(3, friendname);
			pstm.setString(4, friendname);
			
			ResultSet res=pstm.executeQuery();   //execute query.
			System.out.println("Display Connected"); //just for verify
			if(res.next())
			{
				displayFriendBeans.setFriendUserName(res.getString("Username"));   //Set all the Values from userdetails table to beans.
				displayFriendBeans.setAddress(res.getString("Address")); 
				displayFriendBeans.setGender(res.getString("Gender"));
							
						java.sql.Date sqlDate=res.getDate("DOB");  //converting SQl Date To String.
						java.util.Date udd=(Date)sqlDate;
						SimpleDateFormat sdf= new SimpleDateFormat("dd-MMM-yyyy");
						String DOB=sdf.format(udd);
				displayFriendBeans.setDob(DOB);
				
				displayFriendBeans.setCity(res.getString("City"));
				displayFriendBeans.setState(res.getString("State"));
				displayFriendBeans.setMobileNo(res.getLong("Mobileno"));
				displayFriendBeans.setMarital(res.getString("Marital"));
				displayFriendBeans.setEmailId(res.getString("Email"));
				displayFriendBeans.setFriendName(res.getString("Name"));
				
				displayFriendBeans.setDegree(res.getString("Degree"));       //Set all the Values from careers table to beans.
				displayFriendBeans.setCollege(res.getString("College"));
				displayFriendBeans.setLocation(res.getString("Location"));
				displayFriendBeans.setCompany(res.getString("Company"));
				displayFriendBeans.setDesgination(res.getString("Desgination"));
				displayFriendBeans.setCurrentAddress(res.getString("CurrentAddress"));
				displayFriendBeans.setCurrentState(res.getString("CurrentState"));
				
				list.add(displayFriendBeans);   //Add bean Object to list	
			}	
			else
			{
				return list; //If not find returns empty list.
			}	
		} 
		catch (SQLException e) 
		{
			System.out.println(e.getMessage());
		}
		finally
		{
			try
			{
				pstm.close();
	//			con.close();
			}
			catch (Exception e)
			{
				System.out.println(e.getMessage());
			}
		}
		return list; //return LIST
	}
}
