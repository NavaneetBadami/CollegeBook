package com.college.memories.book.others;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.Inet4Address;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.college.memories.book.dao.LoginDao;
import com.college.memories.book.dto.MemoriesSnapsBeans;
import com.college.memories.book.services.CollegebookCommons;
import com.college.memories.book.services.ConnectionProvider;

public class MemoriesSnaps extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private final String UPLOAD_DIRECTORY = "C:/apache-tomcat-7.0.27/webapps/CollegeBook/img/gallary/memoriesSnaps"; //Path where image is going to store.  
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException
	{  
		HttpSession ses=req.getSession(false);
		String uploadeduserName=(String)ses.getAttribute("username"); //Session Object.
		String uploadedFriendName=LoginDao.name4wholeApplication.get(uploadeduserName);  // from LoginDao to maintain Same FriendName.
		try
		{
			PrintWriter out = resp.getWriter();  
		    if(ServletFileUpload.isMultipartContent(req)) //process only if its multiPart content.
		    {
		    	try
		        {
		           List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(req);																						//These all are builtin Functions();
		           for(FileItem item : multiparts)
		           {
		             if(!item.isFormField())
		             {
		            	 String sqlQuery="select * from collegeBook.memoriesSnapDetails"; // get only snapId.
		            	 ArrayList<MemoriesSnapsBeans> snapDetails= CollegebookCommons.memoriesSnapsDetails(sqlQuery); //Static Method.
		            	 Iterator<MemoriesSnapsBeans> snapDetailsIt=snapDetails.iterator();
		            	 
		            	 int snapId=0;
		            	 while(snapDetailsIt.hasNext())
		            	 {
		            		 MemoriesSnapsBeans memoriesSnapsBeans=(MemoriesSnapsBeans) snapDetailsIt.next(); 
		            		 snapId=memoriesSnapsBeans.getSnapId();   //get the SnapId.
		            	 }
		            	 
		            	 snapId=snapId+1;  //Add previous or last ID= id + 1 bcoZ to store current id Value.---Tricky.  
		            	 String memoriesSnapName="memoriesSnap_"+snapId+".jpg";   // Generate Snap Name.
		            	 
		            	 Date sysDateTime = new Date();
					     SimpleDateFormat stf =  new SimpleDateFormat("HH:mm:ss");
					     SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");
					     String uploadedTime = stf.format(sysDateTime); 
					     String uploadedDate= sdf.format(sysDateTime);
						 String System_ip_address=Inet4Address.getLocalHost().getHostAddress();
						   
						   
	//		            String name = new File(item.getName()).getName();    
			            Connection con=ConnectionProvider.getObj().getCon();			//Get the Connection And Store values.
			            String query="insert into collegebook.memoriesSnapDetails (snapName,uploadeduserName,uploadedFriendName,uploadedDate,uploadedTime,uploadedSys_IpAddress,uploadedStatus) values(?,?,?,?,?,?,?)";
			            PreparedStatement pstm= con.prepareStatement(query);		          		            		            
			            pstm.setString(1,memoriesSnapName );
			            pstm.setString(2,uploadeduserName);
			            pstm.setString(3,uploadedFriendName);
			            pstm.setString(4,uploadedDate);
			            pstm.setString(5,uploadedTime);
			            pstm.setString(6,System_ip_address);
			            pstm.setString(7,"Success");
		            
			            int res=pstm.executeUpdate(); // if Values Stored successfully then only upload the Snap into Server.      
			            	if(res>0)
			            	{
			            		item.write( new File(UPLOAD_DIRECTORY + File.separator + memoriesSnapName));                       
			            		out.write("<a href=\"uploadimage?fileName="+item.getName()+"\">Download "+item.getName()+"</a>"); //This function is not being used currently.   
			            	}
		             }
		           }                         
		        } 
		        catch (Exception ex) 
		        {
		        	System.out.println(ex.getMessage());
		        	req.setAttribute("error_AP","sorry image not loaded."); //just a exception when unable to store the image.
		        }                          
		    }       		
		    else  
		    {
		       req.setAttribute("error_AP", "Sorry its not a multipart content."); //if its not a MultiPart request.
		       System.out.println("not an Multi part...");
		    }   
		    
		     RequestDispatcher rd=req.getRequestDispatcher("snapsIndex.jsp"); //Forward all resources to view.
			 rd.forward(req,resp);
		}
		catch(Exception e) // if session expires.
		{
			System.out.println(e.getMessage());
			req.setAttribute("sessionTimeOut", "sessionTimeOut");
			req.getRequestDispatcher("logout.jsp").forward(req, resp);
		}  	   
	}
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException 
	{
		doPost(req, resp);
	}
}
