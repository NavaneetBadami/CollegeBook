package com.college.memories.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.college.memories.book.dto.InboxBeans;
import com.college.memories.book.services.ConnectionProvider;

public class InboxDao 
{
	public ArrayList<InboxBeans> inboxDisplay(InboxBeans inboxBeans) //Return Type is ArrayLIST.
	{
		Connection con=ConnectionProvider.getObj().getCon();  //create a connection using service.
		
//		Statement stm=null;
		PreparedStatement pstm=null;
		String query ="select *from collegebook.userdetails as u inner join collegebook.careers as c on u.Username=? And c.Username=?";
		
		ArrayList<InboxBeans> list=new ArrayList<InboxBeans>(); //Create List to Store fetched values from DB.
		
		try 
		{
//			stm=con.createStatement();
			pstm=con.prepareStatement(query);
			String userName=inboxBeans.getUserName();  //Get The session using bean object and SetString.
			
			pstm.setString(1,userName);
			pstm.setString(2,userName);
													  //Inner join the two table userDateils and Careers table using unique field i.e Username.
//			String query ="select *from collegebook.userdetails as u inner join collegebook.careers as c on u.Username='"+username+"' And c.Username='"+username+"'";
		    ResultSet res=pstm.executeQuery();       //Execute query.
		    
		    if(res.next())
		    {		    											
				String password=res.getString("Password");  //Get all the data using userName from UserDetails table.
				String gender=res.getString("Gender");
				
					java.sql.Date sqlDOB=res.getDate("DOB");   //converting sqlDate format to String.
					java.util.Date udd=(Date)sqlDOB;
					SimpleDateFormat sdf= new SimpleDateFormat("dd-MMM-yyyy");
					String dob=sdf.format(udd);
					
//				String address=res.getString("Address");
				String city	=res.getString("City");
				String state=res.getString("State");
				long mobileNo=res.getLong("Mobileno");
				String marital=	res.getString("Marital");
				String emailId=res.getString("Email");
				String name =res.getString("Name");    	
															//Get all the data using userName from careers table.
				String degree=res.getString("Degree");
				String collegeName=res.getString("College");
				String location=res.getString("Location");
				String company=res.getString("Company");
				String desgination=res.getString("Desgination");
				String currentAddress=res.getString("CurrentAddress");
				String currentState=res.getString("CurrentState");
				
				inboxBeans.setUserName(userName);   //Set all the data to beans variables to transfer.
				inboxBeans.setAddress(res.getString(5)); //<--we can also use in this way...
				inboxBeans.setPassword(password);
				inboxBeans.setGender(gender);
				inboxBeans.setDob(dob);
				inboxBeans.setCity(city);
				inboxBeans.setState(state);
				inboxBeans.setMobileNo(mobileNo);
				inboxBeans.setMarital(marital);
				inboxBeans.setEmail(emailId);
				inboxBeans.setName(name);
				
				inboxBeans.setDegree(degree);
				inboxBeans.setCollegeName(collegeName);
				inboxBeans.setLocation(location);
				inboxBeans.setCompany(company);
				inboxBeans.setDesgination(desgination);
				inboxBeans.setCurrentAddress(currentAddress);
				inboxBeans.setCurrentState(currentState);
				
				list.add(inboxBeans);	//Add that inboxBeans Object to LIST
		    }
		    else
		    {
		    	return list;
		    }
	
			
		} catch (SQLException e)
		{
			System.out.println(e.getMessage());
		}
		finally
		{
			try 
			{
				pstm.close();
	//			con.close();  //Close The Connection
			} 
			catch (SQLException e)
			{
				System.out.println(e.getMessage());
			}
		}		
		
		return list; //return the LIST to CONTROLLER
	}
}
