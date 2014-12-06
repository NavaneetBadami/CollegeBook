package com.college.memories.book.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.college.memories.book.dao.CareerDao;
import com.college.memories.book.dao.CompleteDao;
import com.college.memories.book.dao.LoginDao;
import com.college.memories.book.dto.CareerBeans;

public class CareerController extends HttpServlet
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
			String userName=(String)ses.getAttribute("username");
			
			String name=LoginDao.name4wholeApplication.get(userName); //hashMap name value using key from completeController or loginDao 3rd Condition.
			
				String degree=req.getParameter("degree").trim().toUpperCase();  //Get the Values from browser i.e Client
				String collegeName=req.getParameter("collegeName").trim().toUpperCase();
				String location=req.getParameter("location").trim().toUpperCase();
				String company=req.getParameter("company").trim().toUpperCase();
				String desgination=req.getParameter("desgination").trim().toUpperCase();
				String currentAddress=req.getParameter("currentAddress").trim().toUpperCase();
				String currentState=req.getParameter("currentState").trim().toUpperCase();
				
				CareerBeans careerBeans=new CareerBeans(); //Assign values to bean object.
				
				careerBeans.setUsername(userName);
				careerBeans.setName(name);
				careerBeans.setDegree(degree);
				careerBeans.setCollegeName(collegeName);
				careerBeans.setLocation(location);
				careerBeans.setCompany(company);
				careerBeans.setDesgination(desgination);
				careerBeans.setCurrentAddress(currentAddress);
				careerBeans.setCurrentState(currentState);
				
				CareerDao careerdao=new CareerDao();
				int value=careerdao.careerData(careerBeans); //Pass bean Object to DAO.
				
					if(value>0) //If values are inserted.
					{
						RequestDispatcher rd=req.getRequestDispatcher("/inbox");	
						rd.forward(req, resp);
					}
					else
					{
						resp.sendRedirect("detailsForm-Display.jsp"); //if values are not inserted.
						
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
		doGet(req, resp);
	}
}
