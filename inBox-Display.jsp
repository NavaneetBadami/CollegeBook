<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" 
import="java.lang.*,java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.io.*,javax.servlet.RequestDispatcher.*,java.util.ArrayList"
import="com.college.memories.book.services.ConnectionProvider" 
import="com.college.memories.book.controller.LoginController"
import="com.college.memories.book.services.CollegebookCommons"
import="com.college.memories.book.dto.CollegeBookCommonsBeans"
import="com.college.memories.book.dao.LoginDao"
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<!-- Set the viewport width to device width for mobile -->
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<TITLE>CollegeBook</TITLE>
<link rel="icon" href="img/Fevicon.ico">

<!--Not Allow to come back again ones logout -->
// <SCRIPT type="text/javascript">
//    window.history.forward();
//    function noBack() { window.history.forward(); }
//</SCRIPT> 

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script><!-- problem 30-06-2014 -->
<link href="css/toastr.css" rel="stylesheet" type="text/css"/>
<script src="js/toastr.js" type="text/javascript"></script>
<script type="text/javascript">
								toastr.options.closeButton = true;
								toastr.options.positionClass = "toast-bottom-left";
								toastr.options.newestOnTop = false;
</script>


<link href="css/bootstrap.css" rel="stylesheet">
<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
<link href="css/bootstrap-responsive.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">  
<link href="css/SearchResults.css" rel="stylesheet">  
<link rel="stylesheet" href="./css/bootstrap-extension.css" />
<!-- <link rel="stylesheet" href="css/carousel-custom-01.css" /> -->
<link rel="stylesheet" href="./js/touchTouch/assets/touchTouch/touchTouch.css" />
 <link rel="stylesheet" type="text/css" href="./css/autoComplete.css" /> 

<script type="text/javascript" src="js/jquery-1.4.2.min.js"> </script>  <!-- Conflit of two queries jq-1.10 and jq 1.4  08-08-2014-->
 <script type='text/javascript'>
	 var $auotComplete = jQuery.noConflict(); 
	 jQuery( document ).ready( 
	 function($auotComplete){ 
			 $auotComplete("#friendName").autocomplete("friendsList.jsp");  //auto complete list.
		 });
</script>  
 <script src="js/jquery.autocomplete.js"> </script>

<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/bootstrap-carousel.js"></script>

<style>

.dropdown{ font-family: Helvetica, Arial, sans-serif; font-size: 12px; }
#nnavbar{position:absolute; right: 0px}
#searchfriend {position:absolute; left: 200px; top:10px;}
#searchfriend i{position:absolute; left: 195px; top:12px;}
#postbutton{position:absolute; right: 350px; top: 470px;}
#postbuttonshadow{position:absolute; right:349px; top:513px; width:200px; height:25px;}
#x{color:red; font-size:30px;}

#friendsprofilelist{position:absolute; right: 25px; top: 370px;}

#sidecontent_options{position:absolute;top:150px;}

#friendName{position:absolute;left:-40px;}

 #ncontent{
			min-height:100px;
			width:230px;
			position:relative;
			float:center;
			padding-top:10px;
			 }

 #nwrapper {
            height: 230px;
            width: 230px;
            overflow: auto;
			 }

#profile{
				height:580px;
				width:550px;
				position:absolute;
				top:70px;
				left:180px;
				/* box-shadow: 0 5px 10px rgba(0.2, 0, 0, 0.2);*/
				}
#basic{
				height:280px;
				width:550px;
				border: 1px solid gray ;
				position:absolute;
				top:00px;
				left:00;
				border-radius:2px;
			    border: 1px solid #ccc;
			    border: 1px solid rgba(0, 0, 0, 0.2);
			    box-shadow: 0 5px 10px rgba(0.2, 0, 0, 0.2);
				}

#graduate{
				height:270px;
				width:350px;
				border: 1px solid gray ;
				position:absolute;
				top:300px;
				left:00;
				border-radius:4px;
			    border: 1px solid #ccc;
			    border: 1px solid rgba(0, 0, 0, 0.2);
			    box-shadow: 0 5px 10px rgba(0.2, 0, 0, 0.2);
				}
#present{
				height:270px;
				width:180px;
				border: 1px solid gray ;
				position:absolute; 
				top:300px;
				right:00px;
				border-radius:4px;
				border: 1px solid #ccc;
			    border: 1px solid rgba(0, 0, 0, 0.2);
				 box-shadow: 0 5px 10px rgba(0.2, 0, 0, 0.2);
				}

#inbox_profile_img>a>img{ /*rest of the code is in style.css */
           
			background:url("img/default_profileimage.jpg") 50% 0% fixed no-repeat;
			background-position: 15px 75px, 20px 0px;
			}

	.navbar .nav > li > a {

		font-size: 13px;
		padding: 15px 13px; 
	}
</style>
</HEAD>

<!-- <BODY data-spy="scroll" data-target=".nnavbar" onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">
 -->
<BODY>
<%

HttpSession ses=request.getSession(false);
Connection conn=ConnectionProvider.getcon(); //Make the Connection using Services.

String user = (String)ses.getAttribute("username");
String imgname=user+".jpg";
if(user == null){
response.sendRedirect("logout.jsp");
}
		    String gender=(String)request.getAttribute("gender");
			String dob=(String)request.getAttribute("dob");
			String homeAddress=(String)request.getAttribute("homeAddress");
			String city=(String)request.getAttribute("city");
			String state=(String)request.getAttribute("state");
			Long mobileNo=(Long)request.getAttribute("mobileNo");
			String maritalStatus=(String)request.getAttribute("maritalStatus");
			String emailId=(String)request.getAttribute("emailId");
			String name=(String)request.getAttribute("name");
																	//These fields from careers table.
			String degree=(String)request.getAttribute("degree");
			String collegeName=(String)request.getAttribute("collegeName");
			String location=(String)request.getAttribute("location");
			String company=(String)request.getAttribute("company");
			String desgination=(String)request.getAttribute("desgination");
			String currentAddress=(String)request.getAttribute("currentAddress");
			String currentState=(String)request.getAttribute("currentState");


//				ArrayList<String> currentUserName= new ArrayList();
//				currentUserName.add(user);
//				for (String VU : currentUserName) 
//				{
//					System.out.println("User" + VU);
//				}

				
		//		System.out.println("User" + currentUserName);

	
%>
 

<!-- Main Cointainer -->
 <div class="container"> 

	
<!-- Navigation bar on Top -->
<div class="navbar navbar-fixed-top"> 
	<div class="navbar-inner">
		<ul class="nav navbar-nav navbar-right">
		<li><h1 id="logo"><a href="inbox" title="HOME" class="tip"><IMG SRC="img/logo.jpg" width=130/></a></h1></li>
		</ul>

<div id="searchfriend"><!-- Search member field 08-Jan-14 -->
	<ul class="nav">
		<form class="navbar-form form-search pull-right" action="searchMember" method="post">
		<input id="friendName" type="text" class="input_text" name="friendName" placeholder="Enter Friend Name..." autocomplete="off" /><i class="icon-search"></i>
		<BR>
		&nbsp;<BR>
	
		<% String notFoundFriendName=(String)request.getAttribute("notFoundFriendName"); //if Record Not Found..!30-Jan-14
			
			if(notFoundFriendName!=null)
			{
			Connection con=ConnectionProvider.getcon(); //Make the Connection using Services. 02-07-2014
			Statement stmt=con.createStatement();
			 try
				 {
					String firstTwoCharacterOfName=notFoundFriendName.substring(0,2);
//					char fristChar=firstTwoCharacterOfName.charAt(0);
					String query ="select *from collegebook.userdetails where Name like '"+firstTwoCharacterOfName+"%'";
					
					ResultSet rs=stmt.executeQuery(query);
					
					String friendName=null;
					String friendUserName=null;
					String friendImg=null;

					if(rs.isBeforeFirst())   //if first two character of friend name in DB.
					{%>
					<div class="searchSuggestion">
						<a href="inbox" class="close" data-dismiss="alert"><b id="x">&times;</b></a>
						<div class="modal-header">
							<h4 id="myModalLabel">Sorry...! Member Not found.</h4>
						Suggestions...
						</div>
						<table class="table table-hover">
						<%
						while(rs.next())
						{
							 friendName=rs.getString("Name");
							 friendUserName=rs.getString("Username");
							 friendImg=friendUserName+".jpg";
//							 System.out.println(friendName+" "+friendUserName);
						%>
							<tr><th> <img src="../CollegeBook/img/upload/<%=friendImg%>" width=20 alt=":-)"/>&nbsp;&nbsp; 
							<A HREF="friendProfile?friendName=<%=friendName%>&friendUserName=<%=friendUserName%>"><%=friendName%></a></th></tr>
						<%}%> 
						</table>
					</div><!-- Endo of collegeBookModal -->
					<%}
						else   // If no first two character matches in DB of friend name.
						{%>
							<label data-dismiss="alert" class="alert alert-error">Sorry..! Record Not Found</label>
						<%}
				}
				catch(Exception e)
				{%>
					<label data-dismiss="alert" class="alert alert-error">Sorry..! Record Not Found</label>
					<%
					System.out.println(e.getMessage());
				}
				finally
				{
						stmt.close();
						con.close();
				}
			}
			%>
		</form>
	</ul>
</div><!-- End Sm -->

	<div id="nnavbar"  role="navigation"> <!-- elements on right side 08-Jan-14 -->
		<ul class="nav navbar-nav navbar-right ">
						
						<li><a href="#Section-1"  class="tip" title="Home">Home</a></li>
						<li><a href="#Section-2" title="Gallary section" class="tip">Gallary</a></li>
						<li><a href="#footer" title="Contact details" class="tip">Contact</a></li>
						<li><a href="postBox-Display.jsp" title="Post Box" class="tip"><i class="icon icon-envelope"></i>&nbsp;Posts Box</a></li>
						<li><a href="messageBox-Display.jsp" title="Your MessageBox" class="tip"><i class="icon icon-envelope"></i>&nbsp;Message Box</a></li>
						<li><a href="friendProfile?friendName=<%=name%>&friendUserName=<%=user%>" title="Your Profile View" class="tip">Profile</a></li>
						<li><a href="userAlbum-Display.jsp" title="Album" class="tip">Album</a></li>
						<li><a href="inbox" title="HOME" class="tip"><img src="../CollegeBook/img/upload/<%=imgname%>" height="20" width="25"/>&nbsp;<%=name%>&nbsp;</a></li>

						<li class="dropdown"><!-- Elements on settings -->
							<a href="#" class="dropdown-toggle tip" data-toggle="dropdown" title="Settings"><i class="icon icon-cog"></i><b class="caret"></b></a>
							<ul class="dropdown-menu pull-right">
						
								<li><a href="logout.jsp">Logout</a></li>
								<li class="divider"></li>
						
								<li class="dropdown-submenu"><!-- Sub Menu li-->
								<a tabindex="-1" href="#">Account Settings</a>
								<ul class="dropdown-menu">
									<li><a href="updateForm-Display.jsp">Update Profile</a></li>	<!-- 25-Jan-14 -->
									<li class="divider"></li>
									<li><a href="#deleteprofilemodal" class="tip" title="To delete your profile...!" data-toggle="modal">Delete Account</a></li>	
								</ul><!-- end dropMenu ul  -->

								<li><a href="#">Help</a></li>
								</li><!-- end Sub Menu li-->

					 </li><!-- elements li -->
							</ul><!-- End of Pull-right -->		
		</ul>
	</div>
	
	</div><!--End of Navbar inner -->
</div><!--End of Navigation Bar -->
											<!-- If Record Not deleted -->				
<% String onepost=(String)request.getAttribute("onepost");
			if(onepost!=null)
			{%>
				 <script type="text/javaScript">
							alert('Sorry..! Unable to Delete your Account.Try again');		
				</script> 
<%}%>


<!-- Begining Of Section-1 -->
<section id="Section-1">
			
			<!-- Left sidebar 07-Jan-14 -->
		<div id="leftsidewrapper">
			<div id="inbox_profile_img"> <!-- Profile Image -->
				<a href="userAlbum-Display.jsp"><img src="../CollegeBook/img/upload/<%=imgname%>"  width="125"  class="tip" title="Change image" class="tip"/></a>
			</div>

			<div id="sidecontent_options">
			<h5><i class="icon icon-user"></i>&nbsp;&nbsp;<%=name%></h5>  <!-- Current online user. -->
				<%
					LoginController c=(LoginController) session.getAttribute("counter");
				%>																			<!--06-07-2014 -->
				<h5><IMG SRC="img/bullet[1].gif" WIDTH="31" HEIGHT="14" BORDER="0" ALT="">
				Online Users:<%=c.getActiveSessionUser()%></h5>
			</div>

		</div><!-- End of Left sidebar 07-Jan-14 -->
		
		<!-- Carousel Div -->
		<div class="carousel slide" id="home-carousel">
			<div class="carousel-inner">
				<div class="item active"><IMG SRC="img/gallary/i.jpg" WIDTH="500"  ALT="not diaplayed..!" ></div>
				<div class="item ">	<IMG SRC="img/gallary/i2.jpg" WIDTH="500"   ALT="not diaplayed..!" ></div>
				<div class="item ">	<IMG SRC="img/gallary/i3.jpg" WIDTH="500"  ALT="not diaplayed..!" ></div>
			</div>
		</div><!-- End OF carousel -->


	<div id="profile">
				<div id="basic">
					<table class="table table-hover"><!-- Bootstrap.css-2009 padding changed 8px to 5px; -->
						<TR class="info">
						<Th><i class="icon icon-user"></i>&nbsp;Name</Th>
						<TD><%=name%></TD>
						</TR>
						<TR class="info">
						<Th>UserName</Th>
						<TD><%=user%></TD>
						</TR>
						<% 
							String updated=(String)request.getAttribute("updated"); //From InboxController to display new password, only when user updates their the profile.
							String newPassword=(String)request.getAttribute("password"); //get the password
							if(updated!=null){ %>
									<TR  class="error">
									<Th><span class="label label-success">New Password</span></Th>
									<TD><%=newPassword%></TD >
									</TR>
									<script type="text/javascript">   //Not Working perfect under RD.
									toastr.success('your Profile has been updated.');
									</script>
						  <% } %>
						<TR class="info">
						<Th>Home Address</Th>
						<TD><%=homeAddress%></TD>
						</TR>
						<TR class="info">
						<Th>DOB</Th>
						<TD><%=dob%></TD>
						</TR>
						<TR class="info">
						<Th>State</Th>
						<TD><%=state%></TD>
						</TR>
						<TR class="info">
						<Th>City</Th>
						<TD ><%=city%></TD>
						</TR>
						<TR class="info">
						<Th>Gender</Th>
						<TD><%=gender%></TD>
						</TR>
						<TR class="info">
						<Th>Marital Status</Th>
						<TD><%=maritalStatus%></TD>
						</TR>
					</Table>
				</div><!-- End of Basic -->

				<div id="graduate">
							
					<h5 class="infoalert alert-info">&nbsp;Graduate From.</h5>
					<table class="table table-hover">	
					<tr><th><i class="icon icon-book"></i>&nbsp;<strong>Degree&nbsp;&nbsp;:</strong></th><td><%=degree%></td></tr>
					<tr><th><i class="icon icon-random"></i>&nbsp;<strong>College&nbsp;:</strong></th><td><%=collegeName%></td></tr>
					<tr><th><i class="icon icon-map-marker"></i>&nbsp;<strong>Location:</strong></th><td><%=location%></td></tr>
					</table>

					<table class="table table-hover">
					<tr><label class="infoalert alert-info">&nbsp;Working at.</label></tr>
					<tr><th><i class="icon icon-briefcase"></i>&nbsp;<strong>Comapany&nbsp;&nbsp;&nbsp;:</strong></th><td><%=company%></td></tr>
					<tr><th><i class="icon icon-lock"></i>&nbsp;<strong>Desgination:</strong></th><td><%=desgination%></td></tr>
					</table>
				</div>

				<div id="present">	

					<h5 class="infoalert alert-info">&nbsp;Current Location.</h5>
					<address>
					<strong><%=name%></strong><br>
					<p><i class="icon icon-map-marker"></i>&nbsp;<%=currentAddress%><BR>
					<%=currentState%>
					</p><br>

					<h5>Mobile:<a href="tel:<%=mobileNo%>"><%=mobileNo%></a><BR>
					<h5>Email: <%=emailId%></h5><BR>
					</address>
				</div>
				
</div><!-- End of Profile -->
		
		
<IMG SRC="img/shadow.png" WIDTH="829" id="postbuttonshadow"/>
<div id="postbutton">								
<!-- Button to trigger modal 26-Jan-14 -->
<a href="#postmodal" role="button" class="btn btn-large btn-primary tip" data-toggle="modal" title="Post your Message">Post Your Message</a><BR>

<!-- post Modal -->
	<div id="postmodal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><b id="x">×</b></button>
			<h4 id="myModalLabel">Post Your Message</h4>
		</div>
					<div class="modal-body">
						<FORM METHOD=POST ACTION="posts">
						<textarea rows="4" name="userPost" class="span5" placeholder="Share Your Thoughts,Message,Information here." ></textarea><BR>
					</div>

			<div class="modal-footer">
				<button type="submit" class="btn btn-medium btn-primary btn-primary">Post</button>
				<button type="reset" class="btn btn-medium btn-default">Reset</button>
				</form>
			</div>
	
	</div><!-- End Of postmadal -->
	
	<!--  <div class="alert">
    </div>  -->
</div> <!-- End of Post div -->

							
<!-- Delete Modal -->
	<div id="deleteprofilemodal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

		<div class="modal-header alert-error">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><b id="x">×</b></button>
			<h4 id="myModalLabel">Do you want to delete your profile..?</h4>
		</div>

					<div class="modal-body alert-error">
							<h5><p>Ones you press the delete button your profile, profile picture, album photos, Messages and other personal data belongs to you would be deleted from the CollegeBook...!</p> </h5>
					</div>

			<div class="modal-footer">
				<a href="deleteProfile" class="btn btn-medium btn-primary">Delete</a>
				<button type="reset" class="btn btn-medium btn-default" data-dismiss="modal">Cancel</button>
				</form>
		    </div>

</div><!-- End Of Delete modal -->
	
			<!-- Fri Profile -->
				<div id="friendsprofilelist">
				
				<h4>&nbsp;&nbsp;<i class="icon icon-user"></i>&nbsp;Friends profile</h4>
				
				<!-- nwWrapper Div -->
				<div id="nwrapper"> 
				<div id="ncontent"> 
				<table class="table table-striped table-bordered table-hover table-condensed">
				<%
				String commonQuery="select *from collegebook.userdetails"; //call the static totalMembers mtd() and get the ArrayList.
				ArrayList<CollegeBookCommonsBeans> memberList=CollegebookCommons.totalMembers(commonQuery);  
					Iterator<CollegeBookCommonsBeans> memList=memberList.iterator();
						while(memList.hasNext())
						{ 
							CollegeBookCommonsBeans collegeBookCommonsBeans=(CollegeBookCommonsBeans)memList.next();
							String memberUserName=collegeBookCommonsBeans.getUserName();
							String memberName=collegeBookCommonsBeans.getName();
							String memberImage=memberUserName+".jpg";	
						%>
							<tr><th> <img src="../CollegeBook/img/upload/<%=memberImage%>" width=20 alt=":)"/>&nbsp;&nbsp; <A HREF="friendProfile?friendName=<%=memberName%>&friendUserName=<%=memberUserName%>"><%=memberName%></a></th></tr> 
						<%}
				
					%>
					</table>
				</div> 
				</div> <!-- End Of nWrapeerdiv -->
				</div><!-- End of nFripro Porfile -->
</section><!-- End OF Section 1 -->

<!-- SECTION-2 -->
		 <section id="Section-2">
		 <div class="container">
				<h3 class="" align="center">Gallary
				<p class="alert alert-success">"Memories for the Life Time"</p></h3>	

				<div class="row"><!-- Begining of Images div -->
          <!-- *********************************FIRST ROW OF IMAGES*********************************03-Jan-14 -->
					<div class="span12">
					<ul class="thumbnails">
						<li class="span2 zoom">
						<a href="./img/gallary/R1.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R1.jpg" alt="Toppers Of the Class..!">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R1.2.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R1.2.jpg" alt="At Final Photo shot.">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R1.3.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R1.3.jpg" alt="Smile For the last time..!">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R1.4.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R1.4.jpg" alt="Respected Staff Of ISE Branch.">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R1.5.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R1.5.jpg" alt="Going for Final Foto shot">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R1.6.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R1.6.jpg" alt="With Respected Prof.Sankad sir.">
						</a>
					</li>
					</ul>
					</div><!-- END OF 1ST ROW -->
           <!-- *********************************SECONT  ROW OF IMAGES********************************************** -->
					<div class="span12">
					<ul class="thumbnails">
					<li class="span2 zoom">
					<a href="./img/gallary/R2.1.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R2.1.jpg" alt="Team Of Techkriti-2K12.">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R2.2.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R2.2.jpg" alt="Team Of Techkriti-2K12.">
							</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R2.3.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R2.3.jpg" alt="Team Of Techkriti-2K12 with Coordinator Prof. Noola Mam.">
							</a>
					</li>
				
					<li class="span2 zoom">
						<a href="./img/gallary/R2.4.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R2.4.jpg" alt="Team Of Techkriti-2K12.">
						</a>
					  </li>
					 <li class="span2 zoom">
						<a href="./img/gallary/R2.5.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R2.5.jpg" alt="Ice Braking During 5th Sem.">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R2.6.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R2.6.jpg" alt="Ice Braking During 5th Sem.">
						</a>
					</li>
					  </ul>
				      </div><!-- END OF 2ND ROW -->
           <!-- *********************************THIRD ROW OF IMAGES********************************************** -->
					<div class="span12">
					<ul class="thumbnails">
					<li class="span2 zoom"> 
						<a href="./img/gallary/R3.1.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R3.1.jpg" alt="Fresher Party-Nispranavi-12.">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R3.2.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R3.2.jpg" alt="Fresher Party-Nisparvani-12.">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R3.3.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R3.3.jpg" alt="Fresher Party-Nisparvani-12.">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R3.4.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R3.4.jpg" alt="Farewell Party- Ananmaya-11.">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R3.5.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R3.5.jpg" alt="Ramp Walk-Ananmaya-12.">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R3.6.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R3.6.jpg" alt="Ananamaya-12.">
						</a>
					</li>

				    </ul>
				    </div><!-- END OF 3RD ROW -->

<!-- *********************************fourth ROW OF IMAGES********************************************** --><!-- 21-jan-14 -->
					<div class="span12">
					<ul class="thumbnails">
					<li class="span2 zoom">
						<a href="./img/gallary/R4.1.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R4.1.jpg" alt="VTU zonel volley Ball match SDMCET,Dharwad.">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R4.2.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R4.2.jpg" alt="Rangoli Competation-Esperenza-12.">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/D.2.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/D.2.jpg" alt="Farewell party Ananmaya-12">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R4.4.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R4.4.jpg" alt="Parking Hangout.">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R4.5.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R4.5.jpg" alt="With Respected HOD Prof. Chadan sir-Nispravani-12.">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R4.6.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R4.6.jpg" alt="Fake Cup duning Fun time.">
						</a>
					</li>
				    </ul>
				    </div><!-- END OF 4Th ROW -->
<!-- *********************************fifth ROW OF IMAGES********************************************** -->
					<div class="span12">
					<ul class="thumbnails">
					<li class="span2 zoom">
						<a href="./img/gallary/R5.1.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R5.1.jpg" alt="Won inter college volleyBall Tournament BLDEACET,Bijapur.">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R5.2.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R5.2.jpg" alt="With Juniors -Ananmaya-12.">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R5.3.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R5.3.jpg" alt="During Project Time-Belgaum.">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R5.4.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R5.4.jpg" alt="Last Day in College.">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R5.5.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R5.5.jpg" alt="Last Class(DSS) OF ENGG with prof. Pradeep sir.">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="./img/gallary/R5.6.jpg" class="thumbnail tip" title="Click..!">
							<img src="./img/gallary/R5.6.jpg" alt="ONES LAST TIME OUR CLASS MATES.">
						</a>
					</li>
				    </ul>
				    </div><!-- END OF 5Th ROW -->
					</div><!-- END of Images div -->
				
		</div><!-- END of Container -->
</section><!-- END Section-2 -->
</div><!-- End of Main div cointainer -->

 <footer id="footer" > 
		 <div class="container">
			<div class="row">
				<div class="span4">
					<h4>About Me</h4>
					<blockquote>Navaneet Badami, Software Trainee at Riseon Technologies Pvt Limited, Bangalore.
					</blockquote>
				</div> 
	
				<div class="span4">
					<h4>Location and Contacts</h4>
					<p><i class="icon-map-marker"></i>&nbsp;Karnataka, Bijapur</p>
					<p><i class="icon-globe"></i>&nbsp;Phone: +919964456424</p>
					<p><i class="icon-envelope"></i>&nbsp;Email: Navi.dj89@yahoo.in</p>

				</div>
				<div class="span4">
					<h4>&nbsp;&nbsp;&nbsp;Follow Us on Socials</h4>
					<p>
					<a href="http://www.facebook.com/Navaneet.Badami/b "><img src="img/socials/facebook.png" alt="" /></a>
					<a href="http://www.twitter.com/Navaneet.Badami"><img src="img/socials/twitter.png" alt="" /></a>
					<a href="http://www.youtube.com/Navaneet.Badami"><img src="img/socials/youtube.png" alt="" /></a>
					</p>
				</div>
			</div>
			<div class="row">
				<div class="span6">
				<p>&copy; Copyright CollegeBook 2014.</p>
				</div>
			</div>
					
	</div>
</footer><!-- End Of Footer -->

	<a class="scrolltotop" href="#Section-1"><span>up</span></a>

	<!--<script src="./js/jquery-1.8.3.min.js" type="text/javascript"></script> -->
    <script src="./js/bootstrap.min.js"></script> 
 	<script src="./js/jquery-validate/assets/js/jquery.validate.min.js"></script>
	<script src="./js/jquery-validate/assets/js/messages_it.js"></script>
	<script src="./js/jquery.isotope.min.js"></script>
	<script src="./js/touchTouch/assets/touchTouch/touchTouch.jquery.js"></script>
	<script src="./js/touchTouch/assets/touchTouch/script.js"></script>
	<script src="./js/holder.js"></script>
	<script src="./js/script.js"></script>				

	<script src="js/jquery.nicescroll.min.js" type="text/javascript"></script>
	<script src="js/jquery.localscroll-1.2.7-min.js" type="text/javascript"></script> 
	<script src="js/jquery.parallax-1.1.3.js" type="text/javascript"></script>
   <script src="js/jquery.scrollTo-1.4.6-min.js" type="text/javascript"></script>

	<!--  <script src="js/jquery-1.8.0.min.js" type="text/javascript"></script> -->
    <script src="js/mockjax.js" type="text/javascript"></script>
    <script src="js/bootstrap-typeahead.js" type="text/javascript"></script>
	<script src="js/demo.js" type="text/javascript"></script> 

	<script>						
			//scroll bar custom
				jQuery(document).ready(
			  function() {  
				jQuery("html").niceScroll({cursorcolor:"#3366FF"});
			  }
			);
		</script>
		<script>			
			jQuery(document).ready(function(){
				jQuery('#nnavbar').localScroll(3000);//#nnavbar is for auto scrolling..
				
				//.parallax(xPosition, speedFactor, outerHeight) options:
				//xPosition - Horizontal position of the element
				//inertia - speed to move relative to vertical scroll. Example: 0.1 is one tenth the speed of scrolling, 2 is twice the speed of scrolling
				//outerHeight (true/false) - Whether or not jQuery should use it's outerHeight option to determine when a section is in the viewport
				
			});
		</script>
<script>
		$(document).ready(function(){
		$('.carousel').carousel({interval:2000});
		}); // end document.ready
</script>
<script>						
		//#nwrapper scroll bar custom
		jQuery(document).ready(function(){jQuery("#nwrapper").niceScroll({cursorcolor:"#3366FF"});});
</script>

		<script> // BootStrap typeahead for search box. under process or not in use.
	/*	$('#friendNamee').typeahead({
        source: [
		    { id: 1, name: 'Aniket' },
		    { id: 2, name: 'Navaneet' },
		    { id: 3, name: 'New York' },
		    { id: 4, name: 'Buffalo' },
		    { id: 5, name: 'Boston' },
		    { id: 6, name: 'Columbus' },
		    { id: 7, name: 'Dallas' },
		    { id: 8, name: 'Vancouver' },
		    { id: 9, name: 'Seattle' },
		    { id: 10, name: 'Los Angeles' }
	    ],
      //  itemSelected: displayResult
    });

		/* $('#friendName').typeahead({    
         ajax: { url: 'list.jsp'
              }
    });*/
	
	</script>
</BODY>
</HTML>
