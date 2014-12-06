package com.college.memories.book.dao;

import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

import com.college.memories.book.dto.CareerBeans;
import com.college.memories.book.services.ConnectionProvider;

public class CareerDao 
{
	public int careerData(CareerBeans careerBeans)
	{
		int status=0;
		Connection con=ConnectionProvider.getObj().getCon(); //Make the Connection using Services.
		
		PreparedStatement pstm=null;
		String query="insert into collegebook.careers (Username,Name,Degree,College,Location,Company,Desgination,CurrentAddress,CurrentState,CareerCompletedDate,CareerCompletedTime,CareerCompletedSystem_IP) values (?,?,?,?,?,?,?,?,?,?,?,?)";
		System.out.println("careers Connected"); //just to verify.
		try
		{
			pstm=con.prepareStatement(query);  //create statement.
				
			String userName=careerBeans.getUsername();  //Get The values from beans Object.
			String name=careerBeans.getName();
			String degree=careerBeans.getDegree();
			String collegeName=careerBeans.getCollegeName();
			String location=careerBeans.getLocation();
			String company=careerBeans.getCompany();
			String desgination=careerBeans.getDesgination();
			String currentAddress=careerBeans.getCurrentAddress();
			String currentState=careerBeans.getCurrentState();
			
			Date Csysdatetime = new java.util.Date();
		    SimpleDateFormat Cstf =  new SimpleDateFormat("HH:mm:ss");		//Make simple time Format according to Sql Format.
		    SimpleDateFormat Csdf =  new SimpleDateFormat("yyyy-MM-dd");		//Make simple date Format according to Sql Format.
		    String careerCompletedTime = Cstf.format(Csysdatetime); 		//Pass the Date& Time object in Your Format.
		    String careerCompletedDate= Csdf.format(Csysdatetime);
			String CSystem_ip_address=Inet4Address.getLocalHost().getHostAddress(); //Get Career completed system IP Address.
			
			pstm.setString(1, userName);
			pstm.setString(2, name);
			pstm.setString(3, degree);
			pstm.setString(4, collegeName);
			pstm.setString(5, location);
			pstm.setString(6, company);
			pstm.setString(7, desgination);
			pstm.setString(8, currentAddress);
			pstm.setString(9, currentState);
			pstm.setString(10,careerCompletedDate );
			pstm.setString(11,careerCompletedTime);
			pstm.setString(12, CSystem_ip_address);
			
			status=pstm.executeUpdate();  //execute the query.
		
			if(status>=1)
			{	
				String adminMsg="Hello,"+" "+ name+"("+userName+") Welcome to CollegeBook.";
				Date sysdatetime = new java.util.Date();
			    SimpleDateFormat stf =  new SimpleDateFormat("HH:mm:ss");		//Make simple time Format according to Sql Format.
			    SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");		//Make simple date Format according to Sql Format.
			    String time = stf.format(sysdatetime); 		//Pass the Date& Time object in Your Format.
			    String date= sdf.format(sysdatetime);
		
				Statement stm2= con.createStatement();
				String query2="insert into collegebook.messageDB(ReceiverUsername,ReceiverName,ReceiverMobileno,SenderMessage,SenderUsername,Sendername,Sendermobileno,SendDate,SendTime,System_IP)values('"+userName+"','"+name+"',0000000000,'"+adminMsg+"','COLLEGEBOOK','CollegeBook_Team',9964456424,'"+date+"','"+time+"','Admin')";
				int res=stm2.executeUpdate(query2);  //Execute query.
				System.out.println("Admin Message sent");
				
				Statement stm3=con.createStatement();
				String query3="insert into collegebook.postsdb(Username,Name,Post,Time,Date,System_IP,Status) values('"+userName+"','"+name+"','Welcome "+userName+".','"+time+"','"+date+"','Admin','SuccessByAdmin')";
				int res2=stm3.executeUpdate(query3);  //Execute query.
				System.out.println(res2 +" "+"User has successfully Regtd");// successfully. 
				
				Statement stm4=con.createStatement();
				String query4="update collegebook.userdetails set IsProfileCompleted='YESCOMPLETED' where UserName='"+userName+"'"; 
				int res3=stm4.executeUpdate(query4);  //Execute query.
				System.out.println(res3 +" "+"Whole PRofile Completed.");// successfully. 
			}
			
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
		//		con.close();   //Close connection.
			} 
			catch (SQLException e)
			{
				System.out.println(e.getMessage());
			}
		}	
		return status;  //return.
	}
}
