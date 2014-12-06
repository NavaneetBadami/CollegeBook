package com.college.memories.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;




import java.util.Date;

import com.college.memories.book.dto.SearchMemberBeans;
import com.college.memories.book.services.ConnectionProvider;

public class SearchMemberDao
{
	Connection con=ConnectionProvider.getObj().getCon(); //Make connection using service.
	
	public ArrayList<SearchMemberBeans> memberProfile(SearchMemberBeans searchMemberBeans)
	{
		//Connection con=ConnectionProvider.getcon(); //Make connection using service.
		
//		Statement stm=null;
		PreparedStatement pstm=null;
		String query ="select *from collegebook.userdetails as ud inner join collegebook.careers as cr on ud.Name=? And cr.Name=?";
		
		ArrayList<SearchMemberBeans> list=new ArrayList<SearchMemberBeans>();  //Create the List to Store the values.	
		try 
		{
//			stm=con.createStatement();
			pstm=con.prepareStatement(query);
			String friendName=searchMemberBeans.getFriendName(); //get the member name to search through bean.
			@SuppressWarnings("unused")
			String friendUserName=searchMemberBeans.getFriendUserName();
			
//			String query ="select *from collegebook.userdetails as u inner join collegebook.careers as c on u.Username='"+friendusername+"' AND c.Username='"+friendusername+"' And u.Name='"+friendname+"' And c.Name='"+friendname+"'";
//			String query ="select *from collegebook.userdetails as ud inner join collegebook.careers as cr on ud.Name='"+friendname+"' And cr.Name='"+friendname+"'";
			pstm.setString(1,friendName);
			pstm.setString(2,friendName);
			ResultSet res = pstm.executeQuery();   //Execute query
			
			System.out.println("Search Connected..!");   //just to verify
			
			if(res.next())
			{
				searchMemberBeans.setFriendUserName(res.getString("Username"));   //Set all the Values from userdetails table to beans.
				searchMemberBeans.setAddress(res.getString("Address")); 
				searchMemberBeans.setGender(res.getString("Gender"));
				
					java.sql.Date sqlDate=res.getDate("DOB");  //converting SQl Date To String.
					java.util.Date udd=(Date)sqlDate;
					SimpleDateFormat sdf= new SimpleDateFormat("dd-MMM-yyyy");
					String DOB=sdf.format(udd);
				searchMemberBeans.setDob(DOB);
				
				searchMemberBeans.setCity(res.getString("City"));
				searchMemberBeans.setState(res.getString("State"));
				searchMemberBeans.setMobileNo(res.getLong("Mobileno"));
				searchMemberBeans.setMarital(res.getString("Marital"));
				searchMemberBeans.setEmailId(res.getString("Email"));
				searchMemberBeans.setFriendName(res.getString("Name"));
				
				searchMemberBeans.setDegree(res.getString("Degree"));       //Set all the Values from careers table to beans.
				searchMemberBeans.setCollegeName(res.getString("College"));
				searchMemberBeans.setLocation(res.getString("Location"));
				searchMemberBeans.setCompany(res.getString("Company"));
				searchMemberBeans.setDesgination(res.getString("Desgination"));
				searchMemberBeans.setCurrentAddress(res.getString("CurrentAddress"));
				searchMemberBeans.setCurrentState(res.getString("CurrentState"));
				
				list.add(searchMemberBeans);  //add bean i.e searchmemberbeans to LIST.
			}
			else
			{
				return list;
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
	//			con.close(); //close connection.
			} 
			catch (SQLException e) 
			{
				System.out.println(e.getMessage());
			}
		}
			return list;	//return LIST
	}
	
//	public ArrayList<SearchMemberBeans> memberList(SearchMemberBeans searchMemberBeans )
//	{
//		Statement stm=null;	
//		ArrayList<SearchMemberBeans> list2=new ArrayList<SearchMemberBeans>();  //Create the List to Store the values.	
//		try 
//		{
//			stm=con.createStatement();
//
//			String friendName=searchMemberBeans.getFriendName(); //get the member name to search through bean.
//			
//			char fristChar= friendName.charAt(0,2);
//			String query ="select *from collegebook.userdetails where Name like '"+fristChar+"%'";
//			ResultSet res = stm.executeQuery(query);   //Execute query
//			
//			System.out.println("Search2 Connected..!");   //just to verify
//			
//			while(res.next())
//			{
//				searchMemberBeans.setFriendUserName(res.getString("Username"));   //Set all the Values from userdetails table to beans.
//				searchMemberBeans.setAddress(res.getString("Address")); 
//				searchMemberBeans.setGender(res.getString("Gender"));
//				searchMemberBeans.setDob(res.getString("DOB"));
//				searchMemberBeans.setCity(res.getString("City"));
//				searchMemberBeans.setState(res.getString("State"));
//				searchMemberBeans.setMobileNo(res.getLong("Mobileno"));
//				searchMemberBeans.setMarital(res.getString("Marital"));
//				searchMemberBeans.setEmailId(res.getString("Email"));
//				searchMemberBeans.setFriendName(res.getString("Name"));
//				
//				searchMemberBeans.setDegree(res.getString("Degree"));       //Set all the Values from careers table to beans.
//				searchMemberBeans.setCollegeName(res.getString("College"));
//				searchMemberBeans.setLocation(res.getString("Location"));
//				searchMemberBeans.setCompany(res.getString("Company"));
//				searchMemberBeans.setDesgination(res.getString("Desgination"));
//				searchMemberBeans.setCurrentAddress(res.getString("CurrentAddress"));
//				searchMemberBeans.setCurrentState(res.getString("CurrentState"));
//				
//				list2.add(searchMemberBeans);  //add bean i.e searchmemberbeans to LIST.
//			}
//		} 
//		catch (SQLException e)
//		{
//			System.out.println(e.getMessage());
//		}
//		finally
//		{
//			try 
//			{
//				stm.close();
//	//			con.close(); //close connection.
//			} 
//			catch (SQLException e) 
//			{
//				System.out.println(e.getMessage());
//			}
//		}
//			return list2;	//return LIST
//	}
//					
}

