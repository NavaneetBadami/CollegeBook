package com.college.memories.book.services;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import com.college.memories.book.dto.DisplayPostsBeans;
import com.college.memories.book.dto.CollegeBookCommonsBeans;
import com.college.memories.book.dto.MemoriesSnapsBeans;
import com.college.memories.book.dto.UserMessageBoxBeans;

public class CollegebookCommons 
{
	public static ArrayList<CollegeBookCommonsBeans> totalMembers(String sqlQuery)
	{
		Connection con=ConnectionProvider.getObj().getCon(); //Make the connection using service.
		Statement stm=null;
		ArrayList<CollegeBookCommonsBeans> memberList= new ArrayList<>();
		try 
		{
			stm=con.createStatement();
			ResultSet res=stm.executeQuery(sqlQuery);
			while(res.next())
			{
				CollegeBookCommonsBeans collegeBookCommonsBeans= new CollegeBookCommonsBeans(); //Create a beans object.
				
				collegeBookCommonsBeans.setName(res.getString("Name"));     //Set the values.
				collegeBookCommonsBeans.setUserName(res.getString("username"));
				collegeBookCommonsBeans.setAddress(res.getString("address"));
				collegeBookCommonsBeans.setMobileNo(res.getLong("mobileno"));
				collegeBookCommonsBeans.setEmailId(res.getString("email"));
				collegeBookCommonsBeans.setCity(res.getString("city"));
				
					java.sql.Date sqlDate=res.getDate("Dob");  //converting SQl Date To String.
					java.util.Date udd=(Date)sqlDate;
					SimpleDateFormat sdf= new SimpleDateFormat("dd-MMM-yyyy");
					String dob=sdf.format(udd);

					
				collegeBookCommonsBeans.setDob(dob);
				collegeBookCommonsBeans.setGender(res.getString("gender"));
				collegeBookCommonsBeans.setMarital(res.getString("marital"));
				collegeBookCommonsBeans.setState(res.getString("state"));
				memberList.add(collegeBookCommonsBeans);   //add the bean object to array list.
			}
		} 
		catch (SQLException e) 
		{
			System.out.println(e.getMessage());
		}
		finally
		{
			try {
	//			con.close(); //close Connection
				stm.close();
			} 
			catch (SQLException e) 
			{
				System.out.println(e.getMessage());
			}
		}	
		return memberList;  //return the list.
	}
	
	public static ArrayList<DisplayPostsBeans> displayPosts(String sqlQuery)
	{
		Connection con=ConnectionProvider.getObj().getCon(); //Make the connection using service.
		PreparedStatement pstm=null;
	//	HashMap<Integer, DisplayPostsBeans> postsList= new HashMap<>();
		ArrayList<DisplayPostsBeans> postsList= new ArrayList<>();
		
		try {
			pstm=con.prepareStatement(sqlQuery);
			pstm.setString(1, "Success");
			ResultSet res=pstm.executeQuery();   //Execute the query.
			
			while(res.next())
			{
				DisplayPostsBeans displayPostsBeans= new DisplayPostsBeans();
				int id=res.getInt("id");
																	 //set the values to bean.
				displayPostsBeans.setId(id);
				displayPostsBeans.setUsername(res.getString("username"));
				displayPostsBeans.setName(res.getString("Name"));
				displayPostsBeans.setPosts(res.getString("post"));
				displayPostsBeans.setSharedFromfusername(res.getString("Sharedfromfusername"));
				displayPostsBeans.setSharedFromfname(res.getString("Sharedfromfname"));
				displayPostsBeans.setLikeCount(res.getInt("Likecount"));
				displayPostsBeans.setLikedUser(res.getString("Likeuser"));
					
					java.sql.Date sqlDate=res.getDate("date");  //converting SQl Date To String.
					java.util.Date udd=(Date)sqlDate;
					SimpleDateFormat sdf= new SimpleDateFormat("dd-MMM-yyyy");
					String postedDate=sdf.format(udd);
					displayPostsBeans.setPostedDate(postedDate);
					
				displayPostsBeans.setPostedTime(res.getString("time"));
				
				//postsList.put(id, displayPostsBeans);
				postsList.add(displayPostsBeans); // add bean object to list.
			}
		}
		catch (SQLException e) 
		{
			System.out.println(e.getMessage());
		}
		finally
		{
			try {
	//			con.close();
				pstm.close();
			} catch (SQLException e)
			{
				System.out.println(e.getMessage());
			}
		}
		return postsList;	 //return list.
	}
	
	public static ArrayList<DisplayPostsBeans> displayParticularUserPosts(String sqlQuery)
	{
		Connection con=ConnectionProvider.getObj().getCon(); //Make the connection using service.
		Statement stm=null;
		ArrayList<DisplayPostsBeans> userPostsList= new ArrayList<>();
		
		try {
			stm=con.createStatement();
			ResultSet res=stm.executeQuery(sqlQuery);   //Execute the query.
			
			while(res.next())
			{
				DisplayPostsBeans displayPostsBeans= new DisplayPostsBeans();
				int id=res.getInt("id");
																	 //set the values to bean.
				displayPostsBeans.setId(id);
				displayPostsBeans.setUsername(res.getString("username"));
				displayPostsBeans.setName(res.getString("Name"));
				displayPostsBeans.setPosts(res.getString("post"));
				displayPostsBeans.setSharedFromfusername(res.getString("Sharedfromfusername"));
				displayPostsBeans.setSharedFromfname(res.getString("Sharedfromfname"));
				displayPostsBeans.setLikeCount(res.getInt("Likecount"));
				displayPostsBeans.setLikedUser(res.getString("Likeuser"));
				
					java.sql.Date sqlDate=res.getDate("Date");  //converting SQl Date To String.
					java.util.Date udd=(Date)sqlDate;
					SimpleDateFormat sdf= new SimpleDateFormat("dd-MMM-yyyy");
					String postedDate=sdf.format(udd);
				displayPostsBeans.setPostedDate(postedDate);
				displayPostsBeans.setPostedTime(res.getString("time"));
				
				userPostsList.add(displayPostsBeans); // add bean object to list.
			}
		}
		catch (SQLException e) 
		{
			System.out.println(e.getMessage());
		}
		finally
		{
			try {
	//			con.close();
				stm.close();
			} catch (SQLException e)
			{
				System.out.println(e.getMessage());
			}
		}
		return userPostsList;	 //return list.
	}
	
	public static ArrayList<UserMessageBoxBeans> userMessageInbox(String sqlQuery)
	{
		Connection con=ConnectionProvider.getObj().getCon(); //Make the connection using service.
		Statement stm=null;
		ArrayList<UserMessageBoxBeans> inboxMessages= new ArrayList<>();
		
		try {
			stm=con.createStatement();
			ResultSet res=stm.executeQuery(sqlQuery);   //Execute the query.
			
			while(res.next())
			{
				UserMessageBoxBeans userMessageBoxBeans= new UserMessageBoxBeans();  // set the Values.
				
				userMessageBoxBeans.setId(res.getInt("id"));
				userMessageBoxBeans.setSenderUsername(res.getString("senderUsername"));
				userMessageBoxBeans.setSenderName(res.getString("senderName"));
				userMessageBoxBeans.setSenderMessage(res.getString("Sendermessage"));
					
						java.sql.Date sqlDate=res.getDate("sendDate");  //converting SQl Date To String.
						java.util.Date udd=(Date)sqlDate;
						SimpleDateFormat sdf= new SimpleDateFormat("dd-MMM-yyyy");
						String receivedDate=sdf.format(udd);
				
				userMessageBoxBeans.setSentDate(receivedDate);
				userMessageBoxBeans.setSendTime(res.getString("sendTime"));
			
				inboxMessages.add(userMessageBoxBeans); // add bean object to list.
			}
		}
		catch (SQLException e) 
		{
			System.out.println(e.getMessage());
		}
		finally
		{
			try {
				stm.close();
//				con.close();
			} catch (SQLException e)
			{
				System.out.println(e.getMessage());
			}
		}
		return inboxMessages;	 //return list.
	}
	
	public static ArrayList<UserMessageBoxBeans> userSentMessages(String sqlQuery)
	{
		Connection con=ConnectionProvider.getObj().getCon(); //Make the connection using service.
		Statement stm=null;
		ArrayList<UserMessageBoxBeans> sentMessages= new ArrayList<>();
		
		try {
			stm=con.createStatement();
			ResultSet res=stm.executeQuery(sqlQuery);   //Execute the query.
			
			while(res.next())
			{
				UserMessageBoxBeans userMessageBoxBeans= new UserMessageBoxBeans();  // set the Values.
				
				userMessageBoxBeans.setId(res.getInt("id"));
				userMessageBoxBeans.setSenderMessage(res.getString("Sendermessage"));
				userMessageBoxBeans.setReceiverUserName(res.getString("receiverUsername"));
				userMessageBoxBeans.setReceiverName(res.getString("receivername"));
				
					java.sql.Date sqlDate=res.getDate("sendDate");  //converting SQl Date To String.
					java.util.Date udd=(Date)sqlDate;
					SimpleDateFormat sdf= new SimpleDateFormat("dd-MMM-yyyy");
					String sendDate=sdf.format(udd);
					
					userMessageBoxBeans.setSentDate(sendDate);
					userMessageBoxBeans.setSendTime(res.getString("sendTime"));
			
				sentMessages.add(userMessageBoxBeans); // add bean object to list.
			}
		}
		catch (SQLException e) 
		{
			System.out.println(e.getMessage());
		}
		finally
		{
			try {
				stm.close();
//				con.close();
			} catch (SQLException e)
			{
				System.out.println(e.getMessage());
			}
		}
		return sentMessages;	 //return list.
	}
	
	
	public static ArrayList<MemoriesSnapsBeans> memoriesSnapsDetails(String sqlQuery)
	{
		Connection con=ConnectionProvider.getObj().getCon(); //Make the connection using service.
		Statement stm=null;
		ArrayList<MemoriesSnapsBeans> memoriesSnapsList= new ArrayList<>();
		
		try {
			stm=con.createStatement();
			ResultSet res=stm.executeQuery(sqlQuery);   //Execute the query.
			
			while(res.next())
			{
				MemoriesSnapsBeans memoriesSnapsBeans= new MemoriesSnapsBeans();  // set the Values.
				
				memoriesSnapsBeans.setSnapId(res.getInt("snapId"));
				memoriesSnapsBeans.setSnapName(res.getString("snapName"));
				memoriesSnapsBeans.setUploadedUserName(res.getString("uploadedUsername"));
				memoriesSnapsBeans.setUploadedFriendName(res.getString("uploadedFriendName"));
				memoriesSnapsBeans.setUploadedDate(res.getString("uploadedDate"));
				memoriesSnapsBeans.setUploadedTime(res.getString("uploadedTime"));
				
				memoriesSnapsList.add(memoriesSnapsBeans); // add bean object to list.
			}
		}
		catch (SQLException e) 
		{
			System.out.println(e.getMessage());
		}
		finally
		{
			try {
				stm.close();
//				con.close();
			} catch (SQLException e)
			{
				System.out.println(e.getMessage());
			}
		}
		return memoriesSnapsList;	 //return list.
	}
}
