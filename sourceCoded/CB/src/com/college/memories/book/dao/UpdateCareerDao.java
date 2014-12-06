package com.college.memories.book.dao;

import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.college.memories.book.dto.UpdateCareerBeans;
import com.college.memories.book.services.ConnectionProvider;

public class UpdateCareerDao 
{
	public int updateCareerData(UpdateCareerBeans updateCareerBeans)
	{
		int status=0;
		Connection con=ConnectionProvider.getObj().getCon();//Make the Connection using Services.
		
		PreparedStatement pstm=null;
		String query="update collegebook.careers set Degree=?,College=?,Location=?,Company=?,Desgination=?,CurrentAddress=?,CurrentState=?,CareerUpdatedDate=?,CareerUpdatedTime=?,CareerUpdatedSystem_IP=? where Username=?";
	
		try 
		{
			pstm=con.prepareStatement(query);
														
			String userName=updateCareerBeans.getUserName();  //Get The values from beans Object.
//			String name=updateCareerBeans.getName();
			String degree=updateCareerBeans.getDegree();
			String collegeName=updateCareerBeans.getCollegeName();
			String location=updateCareerBeans.getLocation();
			String company=updateCareerBeans.getCompany();
			String desgination=updateCareerBeans.getDesgination();
			String currentAddress=updateCareerBeans.getCurrentAddress();
			String currentState=updateCareerBeans.getCurrentState();
			
			Date sysDateTime = new java.util.Date();
		    SimpleDateFormat stf =  new SimpleDateFormat("HH:mm:ss");		//Make simple time Format according to Sql Format.
		    SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");		//Make simple date Format according to Sql Format.
		    String UpdatedCareerTime = stf.format(sysDateTime); 		//Pass the Date& Time object in Your Format.
		    String UpdatedCareerDate= sdf.format(sysDateTime);
			String System_ip_address=Inet4Address.getLocalHost().getHostAddress(); //Get career updated system IP Address.
			
			pstm.setString(1, degree);
			pstm.setString(2, collegeName);
			pstm.setString(3, location);
			pstm.setString(4, company);
			pstm.setString(5, desgination);
			pstm.setString(6, currentAddress);
			pstm.setString(7, currentState);
			pstm.setString(8, UpdatedCareerDate);
			pstm.setString(9, UpdatedCareerTime);
			pstm.setString(10,System_ip_address);
			pstm.setString(11,userName);
			
			status=pstm.executeUpdate();  //Execute query.
			System.out.println("CareerUpdate connected nd ecexuted "+status); //Just for verify.
			
		}
		catch (SQLException e)
		{
			System.out.println(e.getMessage());
			return status;
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
//				con.close();   //Close connection.
			} 
			catch (SQLException e)
			{
				System.out.println(e.getMessage());
			}
		}
		return status;  //return.
	}
}
