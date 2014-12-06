<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" import="java.lang.*,java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.util.Date,java.sql.Time" 
import="com.college.memories.book.dto.CollegeBookCommonsBeans"
import="com.college.memories.book.dto.UserMessageBoxBeans"
import="com.college.memories.book.services.ConnectionProvider"
import="com.college.memories.book.services.CollegebookCommons"
import="com.college.memories.book.dto.DisplayPostsBeans"
import="com.college.memories.book.dao.LoginDao"
%>

<HTML>
<HEAD>
<!-- Set the viewport width to device width for mobile -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

<TITLE>CollegeBook</TITLE>
<link rel="icon" href="img/Fevicon.ico">

<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-responsive.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">  

<link href="css/toastr.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script src="js/toastr.js" type="text/javascript"></script>

<script type="text/javascript"> // Ajax Call for sending message.
    $(document).ready(function() 
	{
     $('#sendButtonn').click(function(e) 
	 {
     e.preventDefault();
     var ajaxdata = $("#userName").val();
	 var ajaxdata2=	$("#textMessage").val();

		 $.ajax(
		 {
			 url: "messagee",
			// type: "post",
			 data: { receiverUserName: ajaxdata, textMessage: ajaxdata2 },
			 cache: false,
			 success: function(data)
			 {
		//		alert('Done ' + html(data) );
				 $("#userName").val('');
				 $("#textMessage").val('');
				 $("#status").html(data);
			 }
			 
		} )  //end of .ajax

}); // end of document.ready ({
}); // end of .click({
</script>

<script>
$(document).ready(function(){
$('.carousel').carousel({interval:2000});
}); // end document.ready
</script>
<script>						
		//#user inbox scroll bar custom
		jQuery(document).ready(function(){jQuery("#userinbox").niceScroll({cursorcolor:"#3366FF"});});
</script>
<script>						
		//#user inbox scroll bar custom
		jQuery(document).ready(function(){jQuery("#userhistory").niceScroll({cursorcolor:"#3366FF"});});
</script>
<script>						
		//#user inbox scroll bar custom
		jQuery(document).ready(function(){jQuery("#nwrapper").niceScroll({cursorcolor:"#3366FF"});});
</script>

<script>		//Friend Username Should be field while sending a message.
		function validateForm()
		{
			var receiverUserName=document.forms["message_form"]["receiverUserName"].value;
			if (receiverUserName==null || receiverUserName=="")
			 {
			  alert("Please, Enter Friend UserName..!");
			  return false;
			  }
		}
</script> 
<script type="text/javascript">
								toastr.options.closeButton = true;
								toastr.options.positionClass = "Ntoast-top-right";
								toastr.options.newestOnTop = false;
</script>
<style>
#nnavbar{position:absolute; right: 0px}
#searchfriend{position:absolute; left: 200px; top:10px;}
#sidecontent_options{position:absolute;top:150px;}
#Messageheader{
			position:absolute; top:100px; 
			position:fixed; width:620px; 
			left:270px;
			height:25px;
}

#messagebox{
			position:absolute; 
			right: 340px; top: 180px; 
			position:fixed;
			height:380px;
				width:850px;
				border: 1px solid gray ;
				border-radius:4px;
			    border: 1px solid #ccc;
			    border: 1px solid rgba(0, 0, 0, 0.2);
			    box-shadow: 0 5px 10px rgba(0.2, 0, 0, 0.2);
				}
#SendMessage{
			position:absolute; 
			left: 190px; top: 220px; 
			position:fixed;
			height:280px;
				width:230px;
				border-radius:6px;
			    border-right: 1px solid #ccc;
			    box-shadow: 0 0px 5px rgba(0.2, 0, 0, 0.2);
				}
#userinbox{
			position:absolute; 
			left: 470px; top: 190px; 
			position:fixed;
			height:360px;
				width:250px;
				 overflow: auto;
				border-radius:6px;
			    border-right: 1px solid #ccc;
			    box-shadow: 0 0px 5px rgba(0.2, 0, 0, 0.2);

}
#inboxcontent{

        min-height:400px;
        width:240px;
        position:absolute;
		 overflow: auto;
		right:5px;
		top:0px;
		padding-left:10px;
	/*	background-color:red;	*/
    }
#userhistory{
			position:absolute; 
			left: 760px; top: 190px; 
			position:fixed;
			height:360px;
				width:250px;
				 overflow: auto;
				border-radius:6px;
			    border-right: 1px solid #ccc;
			    box-shadow: 0 0px 5px rgba(0.2, 0, 0, 0.2);

}
#historycontent{

        min-height:400px;
        width:240px;
        position:absolute;
		overflow: auto;
		right:5px;
		top:0px;
		padding-left:10px;
	/*	background-color:red;	*/
    }
#friendsprofilelist{position:absolute; right: 25px; top: 120px;}
#ncontent{
			min-height:100px;
			width:230px;
			position:relative;
			float:center;
			padding-top:10px;
			 }
 #nwrapper {
            height: 430px;
            width: 230px;
            overflow: auto;
			border-radius:6px;
			border-right: 1px solid #ccc;
			box-shadow: 0 0px 5px rgba(0.2, 0, 0, 0.2);
			 }
.dropdown{ font-family: Helvetica, Arial, sans-serif; font-size: 12px; }

#inbox_profile_img>a>img{ /*rest of the code is in style.css */
           
			background:url("img/default_profileimage.jpg") 50% 0% fixed no-repeat;
			background-position: 15px 75px, 20px 0px;
			}
#status
{
	font-size: 12px;
	font-weight: bold;
	line-height: 20px;
	font-family:"verdana";
	color:#FF3300;
}
</style>
</HEAD>

<body >
<%
HttpSession ses=request.getSession(false);
Connection conn=ConnectionProvider.getcon(); //Make the DB Connection using Services.

String user = (String)ses.getAttribute("username");
String name=LoginDao.name4wholeApplication.get(user);  //get the Static Name from LoginDao.
String imgname=user+".jpg";
	if(user == null)
	{
		request.setAttribute("sessionTimeOut", "sessionTimeOut");
		request.getRequestDispatcher("logout.jsp").forward(request,response);
	}
%>

<!-- Main Container -->
<div class="container"> 


<div id="statusAlert"  data-dismiss="statusAlert"> 
	<p id="status"></p>
</div>


<!-- Navigation bar on Top -->
<div class="navbar navbar-fixed-top"> 
	<div class="navbar-inner">
		<ul class="nav navbar-nav navbar-right">
		<li><h1 id="logo"><a href="inbox" title="HOME" class="tip"><IMG SRC="img/logo.jpg" width=130/></a></h1></li>
		</ul>

<!-- <div id="searchfriend">
	<ul class="nav">
		<form class="navbar-form form-search pull-right" action="searchMember" method="post">
		<li><i class="icon icon-search"></i><input type="text" class="input-medium search-query" name="friendName" placeholder="Enter Friend Name" />
		<button type="submit" class="btn btn-primary" title="Search">Search</button>&nbsp;</li>

		    <% String notfound=(String)request.getAttribute("notfound"); //being taken from SearchMambercontroller to InobxController to inboxdisp.jsp to indicate                                                                  record NOT found. then label will be displayed i.e sorry...! Record Not Found..!30-Jan-14
			if(notfound!=null){%>
		    <label class="alert alert-error">Sorry..! Record Not Found.</label> 
		    <%}%>
		</form>
	</ul>
</div> -->

	<div id="nnavbar"  role="navigation"> <!-- elements on right side08-Jan-14 -->
		<ul class="nav navbar-nav navbar-right ">
						
						<li><a href="postBox-Display.jsp" title="Post Box" class="tip"><i class="icon icon-envelope"></i>&nbsp;Posts Box</a></li>
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
			if(onepost!=null){%>
				 <script type="text/javaScript">
							alert('Sorry..! Unable to delete your profile.');		
				</script> 
<%}%>


<!-- Delete Modal -->
	<div id="deleteprofilemodal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

		<div class="modal-header alert-error">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><b id="x">×</b></button>
			<h4 id="myModalLabel">Do you want to delete your profile..?</h4>
		</div>

					<div class="modal-body alert-error">
							<h5><p>Ones you press the delete button your profile, profile picture, album photos and other personal data belongs to you would be deleted 
							from the CollegeBook.</p> </h5>
					</div>

			<div class="modal-footer">
				<a href="deleteProfile" class="btn btn-medium btn-primary">Delete</a>
				<button type="reset" class="btn btn-medium btn-default" data-dismiss="modal">Cancel</button>
				</form>
			</div>

</div><!-- End Of Delete modal -->


	<section id="postbox_post">
				
		<!-- Left sidebar 07-Jan-14 -->
		<div id="leftsidewrapper">
				<div id="inbox_profile_img"> <!-- Profile Image -->
					<a href="userAlbum-Display.jsp"><img src="../CollegeBook/img/upload/<%=imgname%>"  width="125"  class="tip" title="Change image" class="tip"/></a>
				</div>

				<div id="sidecontent_options">
					<h5><i class="icon icon-user"></i>&nbsp;&nbsp;<%=name%></h5>
					
				</div>
		</div><!-- End of Left sidebar 07-Jan-14 -->


				<h4 class="alert alert-info" id="Messageheader" align="center"><strong>Message Box</strong></h4>
				<div id="messagebox">  <!-- Message Box. -->
				
					<div id="SendMessage">
						<h5 class="alert infoalert2" align="center" ><strong>Send Message</strong></h5>
						<FORM  ACTION="message" name="message_form" onsubmit="return validateForm();">
							<INPUT TYPE="text" id="userName" NAME="receiverUserName" placeholder="Enter Friend 'UserName'"></br>
							<TEXTAREA  id="textMessage" NAME="textMessage" ROWS="6" placeholder="Enter Your Message."></TEXTAREA></br>
							<p align="center"><INPUT TYPE="submit" value="send" id="sendButton" class="btn btn-primary" title="Send Message to your Friend"/></p>
						</FORM>
						

						<%
							String memberNotFound=(String)request.getAttribute("memberNotFound");
							if(memberNotFound!=null)
							{
							%>
								<script type="text/javascript"> //30-06-2014
								toastr.error('Invalid UserName.','Sorry...!');
								 
								</script>
								<!-- <script>alert('Sorry...!Invalid UserName')</script> -->

							<%
								//response.sendRedirect("messageBox-Display.jsp");
							}
						%>
						<%
							String messageSent=(String)request.getAttribute("messageSent");
							if(messageSent!=null)
							{
								
							%>
								<script type="text/javascript">
								toastr.success('Message has been sent.','Success');
							//	response.sendRedirect("messageBox-Display.jsp"); 
								</script>
								<!-- <script>alert('Your Message has been sent.')</script> -->
							<%
									//response.sendRedirect("messageBox-Display.jsp"); 
							}
						%>
					</div>

			 <div id="userinbox">		<!-- User inbox 03-Apr-14 -->
			 <div id="inboxcontent">
			 <h5 class="alert infoalert2" align="center"><strong>Messages</strong></h5>

				<%
				String inboxQuery="select *from collegebook.messagedb where receiverUsername='"+user+"' order by id desc";
				ArrayList<UserMessageBoxBeans> inboxMessages=CollegebookCommons.userMessageInbox(inboxQuery);  // Call static method(),get list.
					Iterator<UserMessageBoxBeans> inboxMgs=inboxMessages.iterator();
						while(inboxMgs.hasNext())
						{ 
							UserMessageBoxBeans userMessageBoxBeans=(UserMessageBoxBeans)inboxMgs.next(); //Downcasting.
							String senderUsername=userMessageBoxBeans.getSenderUsername();
							String senderName=userMessageBoxBeans.getSenderName();
							String senderMessage=userMessageBoxBeans.getSenderMessage();
							String receivedDate=userMessageBoxBeans.getSentDate();
							String receivedTime=userMessageBoxBeans.getSendTime();
							int	id= userMessageBoxBeans.getId();

							String senderImage=senderUsername+".jpg";	
						%>
							 
							<div class="media"><!-- Media Div  -->
								<a class="pull-left" href="friendProfile?friendName=<%=senderName%>&friendUserName=<%=senderUsername%>"><img class="media-object tip" alt="No Photo" src="../CollegeBook/img/upload/<%=senderImage%>"  title="<%=senderName%>" width="35"/>
								</a>
		 
								<div class="media-body">
									<div class="accordion" id="accordion">  <!-- Collaps Trigger option. -->
										<div class="accordion-group">

											<div class="accordion-heading">
												<button type="button" class="btn btn-mini btn-info" data-toggle="collapse" data-target="#<%=id%>"> <!-- Imp id trigger -->
												<h5 class="media-heading"><%=senderName%></h5></button>
												<ntxt2>(&nbsp;<%=senderUsername%>&nbsp;)</ntxt2>
											</div>

											<div id=<%=id%> class="accordion-body collapse">
												<div class="accordion-inner">
													<ntxt3><%=senderMessage%></ntxt3>
												</div>
												<ntxt>------------------------------------------------</ntxt><BR>
												<ntxt2>Received at: &nbsp;<%=receivedTime%>&nbsp;.&nbsp;<%=receivedDate%>&nbsp;</ntxt2>
											</div>
											
										</div>
									</div>		<!-- End Of Whole Collaps Trigger option. -->
									
								</div> <!-- End Of Media Body -->
							</div><!-- End Of Media Div -->
						<%
						} //End of While.
						%>
				</div>
				</div>	<!-- End Of UserInbox -->


			 <div id="userhistory">		<!-- User history 04-Apr-14 -->
			 <div id="historycontent">
			 <h5 class="alert infoalert2" align="center"><strong>Sent Messages</strong></h5>

			<%
				String sentQuery="select *from collegebook.messagedb where SenderUsername='"+user+"' order by id desc";
				ArrayList<UserMessageBoxBeans> sentMessages=CollegebookCommons.userSentMessages(sentQuery);  // Call static method(),get list.
					Iterator<UserMessageBoxBeans> sentMgs=sentMessages.iterator();
						while(sentMgs.hasNext())
						{ 
							UserMessageBoxBeans userMessageBoxBeans=(UserMessageBoxBeans)sentMgs.next(); //Downcasting.
							String receiverUserName=userMessageBoxBeans.getReceiverUserName();
							String receiverName=userMessageBoxBeans.getReceiverName();
							String senderMessage=userMessageBoxBeans.getSenderMessage();
							String sentDate=userMessageBoxBeans.getSentDate();
							String sentTime=userMessageBoxBeans.getSendTime();
							int	id= userMessageBoxBeans.getId();

							String receiverImage=receiverUserName+".jpg";	
						%>
							<div class="media"><!-- Media Div  -->
								<a class="pull-left" href="friendProfile?friendName=<%=receiverName%>&friendUserName=<%=receiverUserName%>"><img class="media-object tip" alt="No Photo" src="../CollegeBook/img/upload/<%=receiverImage%>"  title="<%=receiverName%>" width="35"/>
								</a>
		 
								<div class="media-body">
									<div class="accordion" id="accordion">  <!-- Collaps Trigger option. -->
										<div class="accordion-group">

											<div class="accordion-heading">
												<button type="button" class="btn btn-mini btn-success" data-toggle="collapse" data-target="#<%=id%>"> <!-- Imp id trigger -->
												<h5 class="media-heading"><%=receiverName%></h5></button><BR>
												<ntxt2>Sent at: &nbsp;<%=sentTime%>&nbsp;.&nbsp;<%=sentDate%></ntxt2>
											</div>

											<div id=<%=id%> class="accordion-body collapse">
												<div class="accordion-inner">
													<ntxt3><%=senderMessage%></ntxt3>
												</div>
											</div>								
										</div>
									</div>		<!-- End Of Whole Collaps Trigger option. -->
									
								</div> <!-- End Of Media Body -->
								</div><!-- End Of Media Div -->
						<%
						}  //End of While.
				%>
				</div>
				</div>	<!-- End Of UserHistory -->
				</div>	 <!-- End Of Message Box -->


				<!-- Fri Profile -->
				<div id="friendsprofilelist">
				
				<h4>&nbsp;&nbsp;<i class="icon icon-user"></i>&nbsp;Friends UserName</h4>
				
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
							String friendUserName=collegeBookCommonsBeans.getUserName();
							String friendName=collegeBookCommonsBeans.getName();
							String friendImage=friendUserName+".jpg";	
						%>
						<tr><th><img src="../CollegeBook/img/upload/<%=friendImage%>" width=25 alt=":-)"/>&nbsp;
						<ntxt2><A HREF="friendProfile?friendName=<%=friendName%>&friendUserName=<%=friendUserName%>" title="Friend Name"class="tip">
						<%=friendName%></ntxt2></a>&nbsp;<ntxt2 title="Friend UseName"class="tip">(&nbsp;<%=friendUserName%>&nbsp;)</ntxt2></th></tr>  
						<%}
						
					%>
					</table>
				
				</div> 
				</div> <!-- End Of nWrapeerdiv -->
				</div><!-- End of nFripro Porfile -->
	</section>
</div><!-- main container -->

	<script src="./js/bootstrap.min.js"></script> 
	<script src="./js/holder.js"></script>
	<script src="./js/script.js"></script>

	<script src="js/jquery.nicescroll.min.js" type="text/javascript"></script>
	<script src="js/jquery.localscroll-1.2.7-min.js" type="text/javascript"></script> 
	<script src="js/jquery.parallax-1.1.3.js" type="text/javascript"></script>
    <script src="js/jquery.scrollTo-1.4.6-min.js" type="text/javascript"></script>
	<script>						
			//scroll bar custom.
				jQuery(document).ready(
			  function() {  
				jQuery("html").niceScroll({cursorcolor:"#3366FF"});
			  }
			);
		</script>
</body>
</html>
