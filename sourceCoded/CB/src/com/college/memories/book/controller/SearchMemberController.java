package com.college.memories.book.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.ListIterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.college.memories.book.dao.SearchMemberDao;
import com.college.memories.book.dto.SearchMemberBeans;

public class SearchMemberController extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException 
	{
		try
		{
			HttpSession ses=req.getSession(false);   //Create Session object.
			@SuppressWarnings("unused")
			String userName=(String)ses.getAttribute("username");
			String friendUserName=(String)ses.getAttribute("friendusername"); // not  working.
			
				String friendName=req.getParameter("friendName").trim();    //Get the member name to be search.
			
				SearchMemberBeans searchMemberBeans=new SearchMemberBeans();  //Set member username and name to bean.
				searchMemberBeans.setFriendName(friendName);
				searchMemberBeans.setFriendUserName(friendUserName);
				
				SearchMemberDao status=new SearchMemberDao();
				ArrayList<SearchMemberBeans> list=status.memberProfile(searchMemberBeans);    //pass bean object to DAO and it returns LIST. 
				
				ListIterator<SearchMemberBeans> listed=list.listIterator();      //Iterate the LIST.
				
				if(listed.hasNext())
				{
					SearchMemberBeans smb=(SearchMemberBeans)listed.next();  //Downcast the list to searchmember beans.
						
					 req.setAttribute("friendUserName",smb.getFriendUserName());  //Get the Values through bean from userdetails Table.
					 req.setAttribute("gender",smb.getGender());
					 req.setAttribute("dob",smb.getDob());
					 req.setAttribute("homeAddress",smb.getAddress());
					 req.setAttribute("city",smb.getCity());
					 req.setAttribute("state",smb.getState());
					 req.setAttribute("mobileNo",smb.getMobileNo());
					 req.setAttribute("maritalStatus",smb.getMarital());
					 req.setAttribute("emailId",smb.getEmailId());
					 req.setAttribute("friendName",smb.getFriendName());
					 
					 req.setAttribute("degree",smb.getDegree());    //Get the Values through bean from Careers Table.
					 req.setAttribute("collegeName",smb.getCollegeName());
					 req.setAttribute("location",smb.getLocation());
					 req.setAttribute("company",smb.getCompany());
					 req.setAttribute("desgination",smb.getDesgination());
					 req.setAttribute("currentAddress",smb.getCurrentAddress());
					 req.setAttribute("currentState",smb.getCurrentState());
					 
					 RequestDispatcher rd= req.getRequestDispatcher("friendProfile-Display.jsp"); //Forward all values to View.
					 rd.forward(req, resp);
				}
				else
				{
//					SearchMemberDao status2=new SearchMemberDao();
//					ArrayList<SearchMemberBeans> list2=status2.memberList(searchMemberBeans);    //pass bean object to DAO and it returns LIST. 
//					
//					ListIterator<SearchMemberBeans> listed2=list2.listIterator();      //Iterate the LIST.
//					
//					if(listed2.hasNext())
//					{
//						SearchMemberBeans smb=(SearchMemberBeans)listed2.next();  //cast the list to searchmember beans.
//							
//						 req.setAttribute("friendUserName",smb.getFriendUserName());  //Get the Values through bean from userdetails Table.
//						 req.setAttribute("gender",smb.getGender());
//						 req.setAttribute("dob",smb.getDob());
//						 req.setAttribute("homeAddress",smb.getAddress());
//						 req.setAttribute("city",smb.getCity());
//						 req.setAttribute("state",smb.getState());
//						 req.setAttribute("mobileNo",smb.getMobileNo());
//						 req.setAttribute("maritalStatus",smb.getMarital());
//						 req.setAttribute("emailId",smb.getEmailId());
//						 req.setAttribute("friendName",smb.getFriendName());
//						 
//						 req.setAttribute("degree",smb.getDegree());    //Get the Values through bean from Careers Table.
//						 req.setAttribute("collegeName",smb.getCollegeName());
//						 req.setAttribute("location",smb.getLocation());
//						 req.setAttribute("company",smb.getCompany());
//						 req.setAttribute("desgination",smb.getDesgination());
//						 req.setAttribute("currentAddress",smb.getCurrentAddress());
//						 req.setAttribute("currentState",smb.getCurrentState());
//						 
//						 RequestDispatcher rd= req.getRequestDispatcher("Memberlist.jsp"); //Forward all values to View.
//						 rd.forward(req, resp);
//					}
//					else
//					{
						req.setAttribute("notFoundFriendName", friendName);
						RequestDispatcher rd=req.getRequestDispatcher("/inbox");
						rd.forward(req, resp);
				//	}

				}			
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
		doGet(req, resp);
	}
}
