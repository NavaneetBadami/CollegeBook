package com.college.memories.book.dao;

import java.net.Inet4Address;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.college.memories.book.dto.UpdateBeans;
import com.college.memories.book.services.ConnectionProvider;

public class UpdateDao 
{
	public int updatevalues(UpdateBeans updateBeans)
	{
		Connection con=ConnectionProvider.getObj().getCon(); //Make the Connection using service.
		int status=0;
		
		PreparedStatement pstm=null;
		String query="UPDATE collegebook.userdetails u,collegebook.careers c,collegebook.postsdb p SET u.Password=?,u.Gender=?,u.DOB=?,u.Address=?,u.City=?,u.State=?,u.Mobileno=?,u.Marital=?,u.Email=?,u.Name=?,u.ProfileUpdatedDate=?,u.ProfileUpdatedTime=?,u.ProfileUpdatedSystem_IP=?,c.Name=?,p.Name=? WHERE u.username=? AND c.username=? AND p.username=?";
	
		try 
		{
			pstm=con.prepareStatement(query);
			
		    String password=updateBeans.getPassword(); //Get Values through beans.
		    String name=updateBeans.getName();
		    String emailId=updateBeans.getEmailId();
		    double mobileNo=updateBeans.getMobileNo();
		    String gender=updateBeans.getGender();
		    String address=updateBeans.getAddress();
		    String city=updateBeans.getCity();
		    String state=updateBeans.getState();
			String marital=updateBeans.getMarital();
			String dob=updateBeans.getDob();
				SimpleDateFormat sdfDOB=new SimpleDateFormat("dd/MM/yyyy");  //Convert string Date into SQl DateFormat.
				Date uDob=sdfDOB.parse(dob);
				java.sql.Date sqlDOB = new java.sql.Date(uDob.getTime());
			
		    String sesUserName=updateBeans.getSesUserName(); //getting session object through bean
		    
		    Date sysDateTime = new java.util.Date();
		    SimpleDateFormat stf =  new SimpleDateFormat("HH:mm:ss");		//Make simple time Format according to Sql Format.
		    SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");		//Make simple date Format according to Sql Format.
		    String profileUpdatedtime = stf.format(sysDateTime); 		//Pass the Date& Time object in Your Format.
		    String profileUpdatedDate= sdf.format(sysDateTime);
		    
		    String System_ip_address=Inet4Address.getLocalHost().getHostAddress(); //Get Updated system IP Address.
		  
		    pstm.setString(1, password);
		    pstm.setString(2, gender);
		    pstm.setDate(3, sqlDOB);
		    pstm.setString(4, address);
		    pstm.setString(5, city);
		    pstm.setString(6, state);
		    pstm.setDouble(7, mobileNo);
		    pstm.setString(8, marital);
		    pstm.setString(9, emailId);
		    pstm.setString(10, name);
		    pstm.setString(11, profileUpdatedDate);
		    pstm.setString(12, profileUpdatedtime);
		    pstm.setString(13, System_ip_address);
		    pstm.setString(14, name);
		    pstm.setString(15, name);
		    pstm.setString(16, sesUserName);
		    pstm.setString(17, sesUserName);
		    pstm.setString(18, sesUserName);
		    
		    status=pstm.executeUpdate();
		    System.out.println("Update connected nd executed "+ status);
			
		} 
		catch (SQLException e) 
		{
			System.out.println(e.getMessage());
			return status;
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
//				con.close();  //Connection close.
			} 
			catch (SQLException e) 
			{
				System.out.println(e.getMessage());
			}
		}
		return status; //return status.
	}
}
