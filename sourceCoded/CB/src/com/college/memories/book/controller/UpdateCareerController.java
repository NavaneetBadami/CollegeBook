package com.college.memories.book.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.college.memories.book.dao.UpdateCareerDao;
import com.college.memories.book.dto.UpdateCareerBeans;

public class UpdateCareerController extends HttpServlet
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
			
//			String ucareerName=(String)ses.getAttribute("ucareername"); //From Update Controller, to insert a Updated Name.
//			String name=(String)ses.getAttribute("iname");              //From inboxdisp.
			
				String degree=req.getParameter("udegree").trim().toUpperCase();  //Get the new Values from browser i.e Client
				String collegeName=req.getParameter("ucollegeName").trim().toUpperCase();
				String location=req.getParameter("ulocation").trim().toUpperCase();
				String company=req.getParameter("ucompany").trim().toUpperCase();
				String desgination=req.getParameter("udesgination").trim().toUpperCase();
				String currentAddress=req.getParameter("ucurrentAddress").trim().toUpperCase();
				String currentState=req.getParameter("ucurrentState").trim().toUpperCase();
				
				
				UpdateCareerBeans updateCareerBeans=new UpdateCareerBeans(); //Assign values to bean object.
				updateCareerBeans.setUserName(userName);
				updateCareerBeans.setDegree(degree);
				updateCareerBeans.setCollegeName(collegeName);
				updateCareerBeans.setLocation(location);
				updateCareerBeans.setCompany(company);
				updateCareerBeans.setDesgination(desgination);
				updateCareerBeans.setCurrentAddress(currentAddress);
				updateCareerBeans.setCurrentState(currentState);
				
				UpdateCareerDao updatecareerdao=new UpdateCareerDao();
				int value=updatecareerdao.updateCareerData(updateCareerBeans);	 //Pass bean Object to DAO.
				
					if(value>0) //If values are Updated.
					{
						RequestDispatcher rd=req.getRequestDispatcher("/inbox");
						rd.forward(req, resp);
					}
					else
					{
						resp.sendRedirect("updateForm-Display.jsp"); //if values are not updated.
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
