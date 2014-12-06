package com.college.memories.book.dao;
import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import com.college.memories.book.dto.CreateAccountBeans;
import com.college.memories.book.dto.EmailBeans;
import com.college.memories.book.others.EmailUtility;
import com.college.memories.book.services.ConnectionProvider;

public class CreateAccountDao
{
	Random randomNo = new Random();   // Generate some random no.
	int accNo = randomNo.nextInt(100000000);
	
	public int loadValues(CreateAccountBeans accountBeans, EmailBeans emailBeans)
	{
		Connection con=ConnectionProvider.getObj().getCon(); //Making Connection from service.ConnectionProvider.
//		Statement stm=null;
		PreparedStatement pstm=null;
		String query="insert into collegebook.userdetails(Username,Password,Mobileno,Email,AccCreatedDate,AccCreatedTime,AccCreatedSystem_IP,AccountVerificationCode,IsNewUser) values(?,?,?,?,?,?,?,?,?)";
		int status=0;
		try 
		{
//				stm=con.createStatement();
				pstm=con.prepareStatement(query);
				
				String userName=accountBeans.getUserName(); //Getting Set Values from beans.
				String password=accountBeans.getPassword();
				String emailId=accountBeans.getEmailId();
				double mobileNo=accountBeans.getMobileNo();
				
				Date sysDateTime = new java.util.Date();
			    SimpleDateFormat stf =  new SimpleDateFormat("HH:mm:ss");		//Make simple time Format according to Sql Format.
			    SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");		//Make simple date Format according to Sql Format.
			    String time = stf.format(sysDateTime); 		//Pass the Date& Time object in Your Format.
			    String date= sdf.format(sysDateTime);
			    
				String System_ip_address=Inet4Address.getLocalHost().getHostAddress(); //Get Account Created system IP Address.
				
				
				String randomStr=userName.toLowerCase();  //get some random code for verification.
				Integer randomNo= new Integer(accNo);
				String randomNumber=randomNo.toString();
				String code1=randomNumber.substring(0,4);
				String code2=randomNumber.substring(4,randomNumber.length());
				String accountVerificationCode=code1.concat(randomStr).concat(code2);
				
//				String query="insert into collegebook.userdetails(Username,Password,Mobileno,Email,AccCreatedDate,AccCreatedTime,AccCreatedSystem_IP) values('"+username+"','"+password+"','"+mobileno+"','"+email+"','"+date+"','"+time+"','"+System_ip_address+"')";
				pstm.setString(1, userName);
				pstm.setString(2, password);
				pstm.setDouble(3, mobileNo);
				pstm.setString(4, emailId);
				pstm.setString(5, date);
				pstm.setString(6, time);
				pstm.setString(7, System_ip_address);
				pstm.setString(8, accountVerificationCode);
				pstm.setString(9, "YES");
				status= pstm.executeUpdate(); //execute the query.
				
				try    //THIS BLOCK IS FOR SENDING CODE EMAIL TO NEW USER FOR ACCOUNT VERIFICATION.
				{
					String host=emailBeans.getHost();    //Get the SMTP values through beans.
					String port=emailBeans.getPort();
					String adminUser=emailBeans.getAdminUser();
					String adminPass=emailBeans.getAdminPass();
					
					String recipient = emailId;
					String subject = "CollegeBook Verification";
					String content = "Hi "+userName+",\n  \nWelCome to CollegeBook, thanks for joining CollegeBook. \nPlease use this code for Account Verification: " +accountVerificationCode+" \n \nRegards, \nCollegeBook Team";  // Email Message.
				
					EmailUtility.sendEmail(host, port, adminUser, adminPass, recipient, subject, content); //Call the Static sendEmail method.
					System.out.println("The e-mail was sent successfully");

				}
				catch(Exception e)
				{
					System.out.println(e.getMessage());
					System.out.println("Sorry...! Email Not sent..");
					status=3;
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
		//			con.close(); //Close Connection.
				} 
				catch (SQLException e)
				{
					System.out.println(e.getMessage());
				}
			}
			return status;	//return the value 0 or 1;
	}
}
