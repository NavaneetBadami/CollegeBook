<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" 
import="java.lang.*,java.util.*,java.io.*,java.sql.*"
import="com.college.memories.book.services.ConnectionProvider"
import="com.college.memories.book.services.CollegebookCommons"
import="com.college.memories.book.dto.DisplayPostsBeans"
import="com.college.memories.book.dao.LoginDao"
%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
<title>CollegeBook</title>
<link rel="icon" href="img/Fevicon.ico">

<link href="css/bootstrap.css" rel="stylesheet">
<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
<link href="css/bootstrap-responsive.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<link href="css/bootstrap-theme.css" rel="stylesheet">
<link href="css/bootstrap-theme.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">  
<link rel="stylesheet" href="./css/bootstrap-extension.css" /> 
<!-- <link rel="stylesheet" href="css/carousel-custom-01.css" /> -->
<link rel="stylesheet" href="./js/touchTouch/assets/touchTouch/touchTouch.css" />
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/bootstrap-carousel.js"></script>
<script type="text/javascript" src="js/jquery.nicescroll.min.js"></script>


<script src="js/jquery-1.10.2.js" type="text/javascript"></script>
<!-- <script src="js/bootstrap.js" type="text/javascript"></script>-->
<script>
$(document).ready(function(){
$('.carousel').carousel({interval:2000});
}); // end document.ready
</script>
<script>

$('[data-spy="scroll"]').each(function () {
var $spy = $(this).scrollspy('refresh')
});
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

<style type="text/css">
#nnavbar{position:absolute; right: 0px}
.dropdown{ font-family: Helvetica, Arial, sans-serif; font-size: 12px; }
#post_header{position:absolute; right: 25px; top:00px; width:250px;}
#friendname{position:absolute; left: 00px; top:150px;}

#ncontent{

        min-height:100px;
        width:310px;
        position:absolute;
		right:5px;
		top:10px;
		padding-top:-40px;
		
      /*  background-color:red;	*/
    }
#nwrapper {
            height: 530px;
            width: 310px;
            overflow: auto;
		    position:absolute;
			right:15px;
			top:60px;
			box-shadow: 0 5px 10px rgba(0.2, 0, 0, 0.2);
	    /*	 background-color:black;*/
			
}
#messageSystem{
				height:250px;
				width:320px;
				border: 1px solid gray ;
				position:absolute; 
				right:10px;
				top:670px;
				border: 1px solid black;
			    border: 1px solid rgba(0, 0, 0, 0.2);
				box-shadow: 0 5px 10px rgba(0.2, 0, 0, 0.2);
				}

#career{
				height:270px;
				width:640px;
				position:absolute;
				top:320px;
				right:10px;
						   
}
#basic{
				height:277px;
				width:350px;
				border: 1px solid gray ;
				position:absolute;
				top:320px;
				left:10;
				border-radius:2px;
			    border: 1px solid #ccc;
			    border: 1px solid rgba(0, 0, 0, 0.2);
			    box-shadow: 0 5px 10px rgba(0.2, 0, 0, 0.2);
				}

#graduate{
				height:270px;
				width:420px;
				border: 1px solid gray ;
				position:absolute;
				top:00px;
				right:50;
				border-radius:4px;
			    border: 1px solid #ccc;
			    border: 1px solid rgba(0, 0, 0, 0.2);
			    box-shadow: 0 5px 10px rgba(0.2, 0, 0, 0.2);
				}
#working{
				height:180px;
				width:200px;
				border: 1px solid gray ;
				position:absolute; 
				
				border-radius:4px;
				border: 1px solid #ccc;
			    border: 1px solid rgba(0, 0, 0, 0.2);
				  box-shadow: 0 5px 10px rgba(0.2, 0, 0, 0.2);
				}
#present{
				height:270px;
				width:200px;
				border: 1px solid gray ;
				position:absolute; 
				
				right:00px;
				border-radius:4px;
				border: 1px solid #ccc;
			    border: 1px solid rgba(0, 0, 0, 0.2);
				 box-shadow: 0 5px 10px rgba(0.2, 0, 0, 0.2);
				}
#usergallary{
				height:250px;
				width:800px;
				border: 1px solid gray ;
				position:absolute; 
				left:100px;
				top:610px;
				border: 1px solid #ccc;
			    border: 1px solid rgba(0, 0, 0, 0.2);
				 box-shadow: 0 5px 10px rgba(0.2, 0, 0, 0.2);
				}
#album{

		position:absolute; 
				left:-20px;
				top:60px;

}
#l_s_content_img>img{/*rest of the code is in style.css */

					background:url("img/default_profileimage.jpg") 50% 0% fixed no-repeat;
					background-position: 15px 75px, 20px 0px;
}
#coverphoto>img{ /*rest of the code is in style.css */

					background:url("img/default_coverimage.jpg") no-repeat;					
}


</style>
<script>						
				//#nwrapper scroll bar custom for wrapper.
					jQuery(document).ready(function(){jQuery("#nwrapper").niceScroll({cursorcolor:"#3366FF"});});
</script>
</head>

<body data-spy="scroll" data-target="navbar">
<%
HttpSession ses=request.getSession(false);
Connection conn=ConnectionProvider.getcon(); //Make the DB Connection using Services.

String user = (String)ses.getAttribute("username");
String iName = LoginDao.name4wholeApplication.get(user);   //get the Static Name from LoginDao.
String profileimage=user+".jpg";

if(user == null)
{
	request.setAttribute("sessionTimeOut", "sessionTimeOut");
	request.getRequestDispatcher("logout.jsp").forward(request,response);
}


			String friendUserName=(String)request.getAttribute("friendUserName");
		    String gender=(String)request.getAttribute("gender");
			String dob=(String)request.getAttribute("dob");
			String homeAddress=(String)request.getAttribute("homeAddress");
			String city=(String)request.getAttribute("city");
			String state=(String)request.getAttribute("state");
			Long mobileNo=(Long)request.getAttribute("mobileNo");
			String maritalStatus=(String)request.getAttribute("maritalStatus");
			String emailId=(String)request.getAttribute("emailId");
			String friendName=(String)request.getAttribute("friendName");

		
			String degree=(String)request.getAttribute("degree");
		    String collegeName=(String)request.getAttribute("collegeName");
			String location=(String)request.getAttribute("location");
			String company=(String)request.getAttribute("company");
			String desgination=(String)request.getAttribute("desgination");
			String currentAddress=(String)request.getAttribute("currentAddress");
			String currentState=(String)request.getAttribute("currentState");

			String coverimage=friendUserName+"_CI"+".jpg";
			String friendimage=friendUserName+".jpg";
%>

<!-- Main Cointainer -->
 <div class="container"> 

		<!-- Navigation bar on Top -->
	    <div class="navbar navbar-fixed-top"> 
		<div class="navbar-inner">
		<ul class="nav navbar-nav navbar-right">
		<li><h1 id="logo"><a href="inbox" title="HOME" class="tip"><IMG SRC="img/logo.jpg" width=130/></a></h1></li>
		</ul>
	<div id="nnavbar">
		<ul class="nav ">
		<li><a href="postBox-Display.jsp" title="Post Box" class="tip"><i class="icon icon-envelope"></i>&nbsp;Posts Box</a></li>
		<li><a href="messageBox-Display.jsp" title="Your MessageBox" class="tip"><i class="icon icon-envelope"></i>&nbsp;Message Box</a></li>
		<li><a href="inbox" title="HOME" class="tip"><img src="../CollegeBook/img/upload/<%=profileimage%>" height="20" width="25"/>&nbsp;<%=iName%>&nbsp;<i class="icon icon-user"></i></a></li>

						<li class="dropdown"><!-- Elements on settings -->
							<a href="" class="dropdown-toggle tip" data-toggle="dropdown" title="Settings"><i class="icon icon-cog"></i><b class="caret"></b></a>
						<ul class="dropdown-menu pull-right">
							<li><a href="logout.jsp">Logout</a></li>
							<li class="divider"></li>
							
							<li class="dropdown-submenu"><!-- Sub Menu li-->
							<a tabindex="-1" href="#">Account Settings</a>
							<ul class="dropdown-menu">
							<li><a href="updateForm-Display.jsp">Update Profile</a></li>	<!-- 25-Jan-14 -->
							<li class="divider"></li>
							<li><a href="#deleteprofilemodal" class="tip" title="To delete your profile...!" data-toggle="modal">Delete Account</a></li>
							</ul><!-- end Sub Menu li  -->

							<li><a href="#">Help</a></li>
						</li><!-- within li -->
						</ul><!-- End of Pull-right -->

		</ul>
	</div><!-- En of nnavbar -->
	</div>
	</div>
		<!--End of Navigation Bar -->
												<!-- If Record Not deleted -->
<% String onepost=(String)request.getAttribute("onepost");
			if(onepost!=null){%>
				<script type="text/javaScript">
							alert('Sorry..! Unable to Delete Your profile.');		
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




<!-- Begining Of Section-1 -->
<section id="smSection-1">

		<!-- Left sidebar 07-Jan-14 -->
			<div id="md_leftsidewrapper">

				<div id="l_s_content_img">
					 <img src="../CollegeBook/img/upload/<%=friendimage%>"   class="img-rounded tip"  title="<%=friendName%>"/>
			    </div>
				<h5 id="friendname"><i class="icon icon-user"></i>&nbsp;&nbsp;<%=friendName%></h5>
				
			</div><!-- End of Left sidebar 07-Jan-14 -->		
		
		<div id="coverphoto">
			<IMG SRC="../CollegeBook/img/upload/Album/<%=coverimage%>" class="img-rounded tip" title="Cover image"/>
		</div>

		<!-- User Profile -->
		<div id="basic">
			<table class="table table-hover"><!-- Bootstrap.css-2009 padding changed 8px to 5px; -->
				<TR class="success">
				<Th><i class="icon icon-user"></i>UserName</Th>
				<TD><%=friendUserName%></TD>
				</TR>
				<TR class="success">
				<Th>Home Address</Th>
				<TD><%=homeAddress%></TD>
				</TR>
				<TR class="success">
				<Th>DOB</Th>
				<TD><%=dob%></TD>
				</TR>
				<TR class="success">
				<Th>State</Th>
				<TD><%=state%></TD>
				</TR>
				<TR class="success">
				<Th>Home Town</Th>
				<TD ><%=city%></TD>
				</TR>
				<TR class="success">
				<Th>Gender</Th>
				<TD><%=gender%></TD>
				</TR>
				<TR class="success">
				<Th>Marital Status</Th>
				<TD><%=maritalStatus%></TD>
				</TR>
			</Table>
	 </div> <!-- End Of basic div -->

<div id="career"><!-- Career Div 2-Feb-14 -->
				<div id="graduate">
				 <h5 class="infoalert alert-success">&nbsp;Graduate From.</h5>
					<table class="table table-hover">	
					<tr><th><i class="icon icon-book"></i>&nbsp;<strong>Degree&nbsp;&nbsp;:</strong></th><td><%=degree%></td></tr>
					<tr><th><i class="icon icon-random"></i>&nbsp;<strong>College&nbsp;:</strong></th><td><%=collegeName%></td></tr>
					<tr><th><i class="icon icon-map-marker"></i>&nbsp;<strong>Location:</strong></th><td><%=location%></td></tr>
					</table>

					<tr><th><label class="infoalert alert-success">&nbsp;Working at.</label></th></tr>

					<table class="table table-hover" >
					<tr><th><i class="icon icon-briefcase"></i>&nbsp;<strong>Comapany&nbsp;&nbsp;&nbsp;:</strong></th><td><%=company%></td></tr>
					<tr><th><i class="icon icon-lock"></i>&nbsp;<strong>Desgination:</strong></th><td><%=desgination%></td></tr>
					</table>
			</div><!-- < End of graduate div> 05-Feb-14 -->

			<div id="present">
				<h5 class="infoalert alert-success">&nbsp;Current Location.</h5>
				<address>
				<strong><%=friendName%></strong><br>
				<p><i class="icon icon-map-marker"></i>&nbsp;<%=currentAddress%><BR>
				<%=currentState%>
				</p><br>

				<h5>Mobile:</abbr> <a href="tel:<%=mobileNo%>"><%=mobileNo%></a>
				<h5>Email:&nbsp;<%=emailId%></h5>
				</address>
			</div>

</div><!-- End OF career Div -->

<div id="usergallary"><!-- 1-Feb-14 -->
	<%
		String photo1=friendUserName+"_AP1"+".jpg";
		String photo2=friendUserName+"_AP2"+".jpg";
		String photo3=friendUserName+"_AP3"+".jpg";
		String photo4=friendUserName+"_AP4"+".jpg";
	%>
	<h4 class="alert alert-success"> <%=friendName%>'s Photos.</h4>
	<div id="album"> 
		<div class="span8">
				<ul class="thumbnails">
						<li class="span2 zoom">
						<a href="img/upload/Album/<%=photo1%>" class="thumbnail tip" title="Click..!">
							<img src="img/upload/Album/<%=photo1%>">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="img/upload/Album/<%=photo2%>" class="thumbnail tip" title="Click..!">
							<img src="img/upload/Album/<%=photo2%>">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="img/upload/Album/<%=photo3%>" class="thumbnail tip" title="Click..!">
							<img src="img/upload/Album/<%=photo3%>">
						</a>
					</li>
					<li class="span2 zoom">
						<a href="img/upload/Album/<%=photo4%>" class="thumbnail tip" title="Click..!">
							<img src="img/upload/Album/<%=photo4%>" >
						</a>
					</li>
				</ul>
		</div>
	</div>
</div><!-- End Of user Gallary -->
</section><!-- End OF Section 1 -->



<section id="smSection-2"><!-- Style.css 27-Jan-14 -->

<!-- User Post Div -->
<h5 class="alert alert-success" id="post_header">&nbsp;&nbsp;&nbsp;<%=friendName%>'s &nbsp;Recent Posts</h5>
	<div id="nwrapper"> 
	<div id="ncontent">  
	<%
		String userPostQuery="select *from collegebook.postsdb where Username='"+friendUserName+"' AND Status='Success' order by id desc LIMIT 0,20";
			ArrayList<DisplayPostsBeans> po=CollegebookCommons.displayParticularUserPosts(userPostQuery); //Call static mtd(),get list.
			ListIterator<DisplayPostsBeans> ls= po.listIterator();    //iterator the list.
			while(ls.hasNext())
			{
				DisplayPostsBeans displayPostsBeans=(DisplayPostsBeans)ls.next(); // downcasting list to beans .
						
				String posts=displayPostsBeans.getPosts();   //get the values.
				if(posts!=null)
				{
					String name=displayPostsBeans.getName();
					String userName=displayPostsBeans.getUsername();
					String sharedFromfusername=displayPostsBeans.getSharedFromfusername();
					String sharedFromfname=displayPostsBeans.getSharedFromfname();
					String postedDate=displayPostsBeans.getPostedDate();
					String postedTime=displayPostsBeans.getPostedTime();
					String likeduser=displayPostsBeans.getLikedUser();
					int id=displayPostsBeans.getId();
					int likeCount=displayPostsBeans.getLikeCount();

					String userImage=userName+".jpg";
					String sharedFromfimage=sharedFromfusername+".jpg";   
			%>
				<div id="nmdmedia"> 
				<div class="media"><!-- Media Div  -->
					<a class="pull-left" href="friendProfile?friendName=<%=name%>&friendUserName=<%=userName%>"><img class="media-object" alt="No photo"
					 src="../CollegeBook/img/upload/<%=userImage%>" width="35"/></a>

						<div class="media-body"><!-- This is a normal post without shared -->
							<%
							if(sharedFromfname==null)
							{%>
								<h5 class="media-heading"><a href="friendProfile?friendName=<%=name%>&friendUserName=<%=userName%>"><%=name%></a></h5>	
								<p><%=posts%></p>
							<%}
							else			
							{%>			<!-- This is a shared post  -->
							<h5 class="media-heading"><a href="friendProfile?friendName=<%=name%>&friendUserName=<%=userName%>"><%=name%></a>&nbsp;<ntxt>Shared&nbsp;<%=sharedFromfname%>'s post</ntxt></h5>

							<div id="shared_media"><!-- Nested Media 14-Feb-14 -->
								<div class="media">
									<a class="pull-left" href="#">
										<img class="media-object"  SRC="../CollegeBook/img/upload/<%=sharedFromfimage%>" WIDTH="35">
									</a>
								<div class="media-body">
									<h6 class="media-heading">
										<a href="friendProfile?friendName=<%=sharedFromfname%>&friendUserName=<%=sharedFromfusername%>"><%=sharedFromfname%>
										</a>
									</h6>
									<p><%=posts%></p>
								</div>
							</div>
						</div><!-- End Nested Media -->	
						<%}%>	
						<h6><i class="icon icon-thumbs-up"></i><%=likeCount%>&nbsp;&nbsp;
							</a>&nbsp;&nbsp;<ntxt><%=postedDate%>&nbsp;.&nbsp;<%=postedTime%>&nbsp;
							<i class="icon icon-globe"></i></ntxt>		
						</h6>

				 </div><!-- End of media body -->
				 </div> <!-- End of Media Div  -->
			</div> <!-- End of nMedia Div 6-Feb-14 -->				
			<%	
			} // End Of IF.
			}  //End Of while.
			%>
		</div> <!-- End Of content --> 
	</div> <!-- End Of nWrapeerdiv -->

	<!-- End of npost Porfile -->
</section><!-- End OF Section 2 -->

<div id="messageSystem">   <!-- 24-06-2014 -->
	
						<h5 class="alert infoalert2" align="center" ><strong>Send Message to <%=friendName%> </strong></h5>
						<FORM METHOD=POST ACTION="message" name="message_form" onsubmit="return validateForm();">
							<INPUT TYPE="text" class="span3" NAME="receiverUserName" value="<%=friendUserName%>"></br>
							<TEXTAREA NAME="textMessage" ROWS="4" class="span3" placeholder="Enter Your Message."></TEXTAREA></br>
							<p align="center"><INPUT TYPE="submit" value="send" class="btn btn-success" title="Send Message to your Friend"/></p>
						</FORM>

						<%
							String memberNotFound=(String)request.getAttribute("memberNotFound");
							if(memberNotFound!=null)
							{
							%>
								<script> alert('Sorry...! Invalid Friend Username, please check UserName in Friend Profile.')</script>
							<%
							}
						%>
						<%
							String messageSent=(String)request.getAttribute("messageSent");
//							System.out.println(messagesent);
							if(messageSent!=null)
							{
							%>
								<script> alert('Your Message has been Sent.')</script>
							<%
							}
						%>

		</div><!-- End of MessageSystem -->
</div><!-- END of Container -->


  <footer id="smfooter" class="vspace20"> 
			<div class="container">
				<p align="right">&copy; Copyright CollegeBook 2014.</p>
			</div>
					
	</div> 
</footer><!-- End Of Footer -->



<a class="scrolltotop" href="#Section-1"><span>up</span></a>

	<a class="scrolltotop" href="#Section-1"><span>up</span></a>
	<script src="./js/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script src="./js/bootstrap.min.js"></script>
 	<script src="./js/jquery-validate/assets/js/jquery.validate.min.js"></script>
	<script src="./js/jquery-validate/assets/js/messages_it.js"></script>
	<script src="./js/jquery.isotope.min.js"></script>
	<script src="./js/bootstrap-typehead.js"></script>
	<script src="./js/touchTouch/assets/touchTouch/touchTouch.jquery.js"></script>
	<script src="./js/holder.js"></script>
	<script src="./js/script.js"></script>

		<script src="js/jquery.nicescroll.min.js" type="text/javascript"></script>
		 <script src="js/jquery.localscroll-1.2.7-min.js" type="text/javascript"></script> 
		<script src="js/jquery.parallax-1.1.3.js" type="text/javascript"></script>
		 <script src="js/jquery.scrollTo-1.4.6-min.js"type="text/javascript"></script>
		
<script>	

</script>
	<script>						
			//scroll bar custom for whole page
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
			//	jQuery('#Section-1').parallax("50%", 0.4,true);
			//	jQuery('#Section-2').parallax("70%", 0.9,true);
			//	jQuery('#footer').parallax("20%", 0.3,true);
			});
		</script>
		</body>
</html>
