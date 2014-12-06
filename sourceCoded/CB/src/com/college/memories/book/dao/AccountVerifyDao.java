package com.college.memories.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.college.memories.book.dto.AccountVerifyBeans;
import com.college.memories.book.services.ConnectionProvider;

public class AccountVerifyDao 
{
	public int accountVerify(AccountVerifyBeans accountVerifyBeans)
	{
		Connection con=ConnectionProvider.getObj().getCon(); //Make the Connection using Services.
		PreparedStatement pstm=null;
		String query="select * from collegebook.userdetails where userName=? AND AccountVerificationCode=?";
		int status=0;
		try 
		{
			pstm=con.prepareStatement(query);
			
			String userName=accountVerifyBeans.getUserName();    // get the values from bean.
			String verifyCode=accountVerifyBeans.getVerifyCode();   
			
			pstm.setString(1,userName);
			pstm.setString(2,verifyCode);
			ResultSet res= pstm.executeQuery();  
			
			if(res.next())    // update isnewUser to NO, if code is valid.
			{
				String query2="Update collegeBook.userdetails set isNewUser='NO' where userName='"+userName+"'";
				Statement stm=con.createStatement();
				status=stm.executeUpdate(query2);
//				System.out.println("second query.." + status);  // if update success.
			}
			else
			{
				status=0;    // if update fail.
			}
		} 
		catch (SQLException e) 
		{
			System.out.println(e.getMessage());
		}
		return status;   //return status.
	}
}
