package com.college.memories.book.dao;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.college.memories.book.dto.DeleteProfileBeans;
import com.college.memories.book.services.ConnectionProvider;

public class DeleteProfileDao
{
	public int deleteprofile(DeleteProfileBeans deleteProfileBeans)
	{
		Connection con=ConnectionProvider.getObj().getCon(); //Make the connection using service.
		Statement stm=null;
		int status=0;
		try 
		{
			stm=con.createStatement();
			status = 0;
			String userName=deleteProfileBeans.getDeleteUserName(); //Get the Username using bean i.e about to be Deleted.And about query is as below which join four table in one DB and delete record according to username which matches in all four Tables.
			String query="Delete collegebook.userdetails,collegebook.postsdb,collegebook.careers,collegebook.messagedb from collegebook.userdetails inner join collegebook.postsdb inner join collegebook.careers inner join collegebook.messagedb where collegebook.userdetails.username='"+userName+"' AND collegebook.postsdb.username='"+userName+"' AND collegebook.careers.username='"+userName+"' AND collegebook.messagedb.receiverusername='"+userName+"'";
			
			System.out.println("Delete Connected");  //Just verify.
			
			 status=stm.executeUpdate(query);  //Execute Query.
			 if(status>0)
			 {
				 						//After deleting the record then delete all user profile image,cover image,album photos.
				String profileImage=userName+".jpg";
				String coverImage=userName+"_CI"+".jpg";
				String albumPhoto1=userName+"_AP1"+".jpg";
				String albumPhoto2=userName+"_AP2"+".jpg";
				String albumPhoto3=userName+"_AP3"+".jpg";
				String albumPhoto4=userName+"_AP4"+".jpg";
																							
				File profileImageFile=new File("C:/apache-tomcat-7.0.27/webapps/CollegeBook/img/upload/"+profileImage); //set the path for profile image.
				
				File coverImageFile=new File("C:/apache-tomcat-7.0.27/webapps/CollegeBook/img/upload/Album/"+coverImage);   //set the path for cover image and album photos.
				File albumPhoto1File=new File("C:/apache-tomcat-7.0.27/webapps/CollegeBook/img/upload/Album/"+albumPhoto1);
				File albumPhoto2File=new File("C:/apache-tomcat-7.0.27/webapps/CollegeBook/img/upload/Album/"+albumPhoto2);
				File albumPhoto3File=new File("C:/apache-tomcat-7.0.27/webapps/CollegeBook/img/upload/Album/"+albumPhoto3);
				File albumPhoto4File=new File("C:/apache-tomcat-7.0.27/webapps/CollegeBook/img/upload/Album/"+albumPhoto4);
					
				profileImageFile.delete();   //call the delete function.
				coverImageFile.delete();
				albumPhoto1File.delete();
				albumPhoto2File.delete();
				albumPhoto3File.delete();
				albumPhoto4File.delete();
				System.out.println("Profile has been deleted from server");	//just to verify.
					
				return status; //If record deleted, return 1;
			 
			 }
			 else
			 {
				 return status; //If record not deleted, returns 0;
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
				stm.close();
	//			con.close(); //close connection;
			} 
			catch (SQLException e) 
			{
				System.out.println(e.getMessage());
			}
		}
		return status; //returns status;
	}
}
