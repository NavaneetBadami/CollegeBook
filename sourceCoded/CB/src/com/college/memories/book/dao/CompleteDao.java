package com.college.memories.book.dao;

import java.net.Inet4Address;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.college.memories.book.dto.CompleteBeans;
import com.college.memories.book.services.ConnectionProvider;

public class CompleteDao 
{
	public int completeProfile(CompleteBeans completeBeans)
	{
		Connection con=ConnectionProvider.getObj().getCon(); //Make the Connection using Services.
		PreparedStatement pstm=null;
		String query="update collegebook.userdetails set Gender=?,DOB=?,Address=?,City=?,State=?,Marital=?,Name=?,ProfileCompletedDate=?,ProfileCompletedTime=?,ProfileCompletedSystem_IP=?,IsProfileCompleted=? where Username=?";
		int status=0;
		try 
		{
			 pstm=con.prepareStatement(query);
			 String sesUserName=completeBeans.getSesUserName();//Get the session object through bean.
			 					
			 String gender=completeBeans.getGender();   //Get The values from completeBeans Object.
			 String name=completeBeans.getName();
			 String address=completeBeans.getAddress();
			 String city=completeBeans.getCity();
			 String state=completeBeans.getState();
			 String marital=completeBeans.getMarital();
			 String dob=completeBeans.getDate();
				 SimpleDateFormat sdfDOB=new SimpleDateFormat("dd/MM/yyyy"); //Convert string Date into SQl DateFormat.
				 java.util.Date uDob=sdfDOB.parse(dob);
				 java.sql.Date sqlDOB = new java.sql.Date(uDob.getTime());
			 
			 Date sysdatetime = new java.util.Date();
			 SimpleDateFormat stf =  new SimpleDateFormat("HH:mm:ss");		//Make simple time Format according to SQl Format.
			 SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");		//Make simple date Format according to SQl Format.
			 String time = stf.format(sysdatetime); 		//Pass the Date& Time object in Your Format.
			 String date= sdf.format(sysdatetime);
			 
			 String System_ip_address=Inet4Address.getLocalHost().getHostAddress(); //Get profile completed system IP Address.
			 
			 	pstm.setString(1, gender);
				pstm.setDate(2, sqlDOB);
				pstm.setString(3, address);
				pstm.setString(4, city);
				pstm.setString(5, state);
				pstm.setString(6, marital);
				pstm.setString(7, name);
				pstm.setString(8, date);
				pstm.setString(9, time);
				pstm.setString(10, System_ip_address);
				pstm.setString(11, "YETNOT");  ///------------------------imp still career section has to get filled.
				pstm.setString(12, sesUserName);
	
				status=pstm.executeUpdate(); 	 //Execute query.
		} 
		catch (SQLException e)
		{
			System.out.println(e.getMessage());
		} 
		catch (Exception e) 
		{
			System.out.println(e.getMessage());
		}
		finally
		{
			try 
			{
				pstm.close();
			//	con.close();   //Close connection
			}
			catch (SQLException e)
			{
				System.out.println(e.getMessage());
			}
		}
		return status; //return the status
	}
	
}
