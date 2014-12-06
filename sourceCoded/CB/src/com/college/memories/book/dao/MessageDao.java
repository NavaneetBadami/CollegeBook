package com.college.memories.book.dao;

import java.net.Inet4Address;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.college.memories.book.dto.MessageBeans;
import com.college.memories.book.services.ConnectionProvider;

public class MessageDao 
{
	public int sendMessage(MessageBeans messageBeans)
	{
		int status=0;
		Connection con=ConnectionProvider.getObj().getCon(); //make connection using service
		Statement stm=null;
		
		try
		{
			stm=con.createStatement();
			String receiverUserName=messageBeans.getReceiverUserName();  //get receiver name through bean.
				
			String query="select *from collegebook.userdetails where username='"+receiverUserName+"'";
			ResultSet res=stm.executeQuery(query);   //execute query just to verify weather member present or not.	
			
			if(res.next())    //if member found then send the message.
			{
				String receiverName=res.getString("Name");
				long receiverMobileNo=res.getLong("mobileno");
				System.out.println("Member Found..!");
				
				try 
				{
					String query2="insert into collegebook.messageDB(ReceiverUsername,ReceiverName,ReceiverMobileno,SenderMessage,SenderUsername,Sendername,Sendermobileno,SendDate,SendTime,System_IP)values(?,?,?,?,?,?,?,?,?,?)";
					PreparedStatement pstm=con.prepareStatement(query2);  //Then Create another statement with same connection.
					
					String receiver_UserName=messageBeans.getReceiverUserName();  // get the all values through bean.
					String receiverMessage=messageBeans.getMessage();
					String senderUserName=messageBeans.getSenderUserName();
					String senderName=messageBeans.getSenderName();
					double senderMobileNo=messageBeans.getSenderMobileNo();
					
					Date sysDateTime = new java.util.Date();
					SimpleDateFormat stf =  new SimpleDateFormat("HH:mm:ss");		//Make simple time Format according to Sql Format.
					SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");		//Make simple date Format according to Sql Format.
					String sentTime = stf.format(sysDateTime); 		//Pass the Date& Time object in Your Format.
					String sentDate= sdf.format(sysDateTime);
					
					String System_ip_address=Inet4Address.getLocalHost().getHostAddress(); //Get Sent Message system IP Address.
					
//					String query2="insert into collegebook.messageDB(ReceiverUsername,ReceiverName,ReceiverMobileno,SenderMessage,SenderUsername,Sendername,Sendermobileno,SendDate,SendTime,System_IP)values('"+receiver_username+"','"+receivername+"','"+receivermobileno+"','"+receivermessage +"','"+senderusername +"','"+sendername +"','"+sendermobileno +"','"+date+"','"+time+"','"+System_ip_address+"')";
//					status =stm2.executeUpdate(query2);	   //execute the query i.e store sender message along with some data.
					
					pstm.setString(1, receiver_UserName);
					pstm.setString(2, receiverName);
					pstm.setDouble(3, receiverMobileNo);
					pstm.setString(4, receiverMessage);
					pstm.setString(5, senderUserName);
					pstm.setString(6, senderName);
					pstm.setDouble(7, senderMobileNo);
					pstm.setString(8, sentDate);
					pstm.setString(9, sentTime);
					pstm.setString(10,System_ip_address);
					
					status=pstm.executeUpdate(); //execute query.
					System.out.println("Message Sent...!");  //just to verify.
				} 
				catch (Exception e) 
				{
					System.out.println("Nested Try Block "+e.getMessage());
				}
			}
			else
			{
				return status;  //if Member not found...!
			}
			
		}
		catch (Exception e) 
		{
			System.out.println("Message Not Sent...!");  //just to verify.
			System.out.println(e.getMessage());
		}
		finally
		{
			try 
			{
				stm.close();
//				con.close();  //close the connection.
			} 
			catch (SQLException e) 
			{
				System.out.println(e.getMessage() );	
			}
		}
		return status;  //return status.	
	}
}
