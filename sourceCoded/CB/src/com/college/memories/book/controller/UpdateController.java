package com.college.memories.book.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.college.memories.book.dao.UpdateDao;
import com.college.memories.book.dto.UpdateBeans;

public class UpdateController extends HttpServlet
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
			 HttpSession ses=req.getSession(false);
			 String userName=(String) ses.getAttribute("username");
			 
			 	String name=req.getParameter("uname").trim().toUpperCase();
				String password=req.getParameter("upassword");  //Get the values from User update form.
				String gender=req.getParameter("ugender");
				String address=req.getParameter("uhomeAddress").trim().toUpperCase();
				String city=req.getParameter("ucity").trim().toUpperCase();
				String state=req.getParameter("ustate");
				String mobileNo=req.getParameter("umobileNo"); 
				String emailId=req.getParameter("uemailId").trim().toLowerCase();
				String marital=req.getParameter("umaritalStatus");
				String dob=req.getParameter("udob");
				
				
				if("".equals(name)||"".equals(password)||"".equals(mobileNo)) //Checking For these field must not be Blank.
				{
					req.setAttribute("emptyFields", "emptyFields");
					RequestDispatcher rd=req.getRequestDispatcher("updateForm-Display.jsp"); //not in process.
					rd.forward(req, resp);
				}
				
				else
				{
					double mobileno=Double.parseDouble(mobileNo);//parsing From string to double.
					
				UpdateBeans updateBeans=new UpdateBeans();//Assign or set values to Bean object.
				
				updateBeans.setPassword(password);
				updateBeans.setGender(gender);
				updateBeans.setAddress(address);
				updateBeans.setCity(city);
				updateBeans.setMobileNo(mobileno);
				updateBeans.setEmailId(emailId);
				updateBeans.setMarital(marital);
				updateBeans.setDob(dob);
				updateBeans.setName(name);
				updateBeans.setState(state);
				
				updateBeans.setSesUserName(userName);//Set session object i.e username to bean.
				
				UpdateDao status=new UpdateDao(); //Pass the Updatebeans object to DAO.
				int value=status.updatevalues(updateBeans);
					if(value>0)
					{				
						req.setAttribute("updated","done"); //pass this object to Inbox.jsp only just to indicates Values have been changed.
						RequestDispatcher rd=req.getRequestDispatcher("/inbox"); // profile Updated.
						rd.forward(req, resp);
					}
					else
					{
						resp.sendRedirect("updateForm-Display.jsp"); //Not Updated.
					}
				}
		}
		catch(Exception e)
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
