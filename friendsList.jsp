<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" 
import="com.college.memories.book.services.CollegebookCommons"
import="com.college.memories.book.dto.CollegeBookCommonsBeans"
%>
 <% 
	HttpSession ses=request.getSession(false);
	String user = (String)ses.getAttribute("username");
	String imgname=user+".jpg";
	if(user == null){
	response.sendRedirect("logout.jsp");
}
		String[] friendList=null; //String Array[].
		int i = 0;

		String commonQuery="select *from collegebook.userdetails"; //call the static totalMembers mtd() and get the ArrayList.
			ArrayList<CollegeBookCommonsBeans> memberList=CollegebookCommons.totalMembers(commonQuery);  
					Iterator<CollegeBookCommonsBeans> memListIt=memberList.iterator();
					
					 friendList = new String[memberList.size()];	// String array[] with size of ArrayList.
						while(memListIt.hasNext())
						{ 
							CollegeBookCommonsBeans collegeBookCommonsBeans=(CollegeBookCommonsBeans)memListIt.next();
							String memberUserName=collegeBookCommonsBeans.getUserName();
							String memberName=collegeBookCommonsBeans.getName();
							String memberImage=memberUserName+".jpg";	
				
							friendList[i] = memberName; // store mamber name into array.
							i++;
						}

			//jQuery related start		
				String query = (String)request.getParameter("q");
				
				int cnt=1;
				for(int j=0;j<friendList.length;j++)
				{
					if(friendList[j].toUpperCase().startsWith(query.toUpperCase()))
					{
						out.print(friendList[j]+"\n");
						if(cnt>=5)
							break;
						cnt++;
					}
				}
			//jQuery related end.
 %>