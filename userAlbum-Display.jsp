<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" import="java.lang.*,java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.io.*,javax.servlet.RequestDispatcher.*"
import="com.college.memories.book.dao.LoginDao"
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>

<HEAD>
<!-- Set the viewport width to device width for mobile -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<TITLE>CollegeBook</TITLE>
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
		
<style>
#nnavbar{position:absolute; right: 0px}
.dropdown{ font-family: Helvetica, Arial, sans-serif; font-size: 12px; }

#nprofile_image{
				position:absolute; left: 240px; top: 20px; 
				height:250px; width:250px;
				background:url("img/default_profileimage2.jpg");							
}

#nprofile_button{position:absolute; left: 210px; top: 290px;}

#snapbutton1{position:absolute; left: 60px; top: 195px; }
#snap1{
		position:absolute; left: 5px; top: 50px;  
		height: 130px; width: 180px; 
		border-style: rounded; 
		background: url(img/default_album.png) no-repeat;
		background-position: 1px 5px, 0px 0px; 
}

#snapbutton2{position:absolute; left: 250px; top: 195px;}
#snap2
	  {
		position:absolute; left: 195px; top: 50px; 
		height: 130px; width: 180px;
		border-style:rounded;
		background: url(img/default_album.png) no-repeat;
		background-position: 1px 5px, 0px 0px; 
}

#snapbutton3{position:absolute; right: 245px; top: 195px;}
#snap3
	 {
		position:absolute; right: 195px; top: 50px;
		height: 130px; width: 180px; 
		border-style:rounded;
		background: url(img/default_album.png) no-repeat;
		background-position: 1px 5px, 0px 0px; 
}

#snapbutton4{position:absolute; right: 60px; top: 195px;}
#snap4
	 {
		position:absolute; right: 5px; top: 50px; 
		height: 130px; width: 180px; 
		border-style:rounded;
		background: url(img/default_album.png) no-repeat;
		background-position: 1px 5px, 0px 0px; 
}

#album_heading{position:absolute; left:10px; top:-5px; background:#3399FF;  border-radius:6px;}

#coverimg>img{
				height:180px;
				width:500px;
				border: 1px solid gray ;
				position:absolute; 
				right:130px;
				top:250px;
				border: 1px solid #ccc;
			    border: 1px solid rgba(0, 0, 0, 0.2);
				box-shadow: 0 5px 10px rgba(0.2, 0, 0, 0.2);
				background: url(img/default_coverimagemin.jpg);				
}
#coverimage_button{
				position:absolute; 
				right:320px;
				top:450px; 
			}

#l_s_content_img>img{ /*rest of the code is in style.css */

					background:url("img/default_profileimage.jpg") 50% 0% fixed no-repeat; 
					background-position: 15px 75px, 20px 0px;					
}
</style>
</HEAD>

<BODY >
<%
HttpSession ses=request.getSession(false);
String user = (String)ses.getAttribute("username"); 
String name=LoginDao.name4wholeApplication.get(user); //get the Static Name from LoginDao.
String imgname=user+".jpg"; 

String Album1=user+"_AP1"+".jpg";
String Album2=user+"_AP2"+".jpg";
String Album3=user+"_AP3"+".jpg";
String Album4=user+"_AP4"+".jpg";
String coverimage=user+"_CI"+".jpg";
if(user == null)
{
	request.setAttribute("sessionTimeOut", "sessionTimeOut");
	request.getRequestDispatcher("logout.jsp").forward(request,response);
}
	
%>
<!-- Main Cointainer -->
 <div class="container"> 
		
<!-- Navigation bar on Top -->
<div class="navbar navbar-fixed-top"> 
<div class="navbar-inner">
		<ul class="nav navbar-nav navbar-right">
		<li><h1 id="logo"><a href="inbox" class="tip" title="HOME"><IMG SRC="img/logo.jpg" width=130/></a></h1></li>
		</ul>

	<div id="nnavbar"><!-- elements on right side08-Jan-14 -->
		<ul class="nav ">
						<!-- <li><a href="#cimgfooter" class="tip" title="contact details">Contact</a></li> -->
						<li><a href="messageBox-Display.jsp" title="Your MessageBox" class="tip"><i class="icon icon-envelope"></i>&nbsp;Message Box</a></li>
						<li><a href="friendProfile?friendName=<%=name%>&friendUserName=<%=user%>" title="Your Profile" class="tip">Profile</a></li>
						<li><a href="inbox" class="tip" title="HOME"><img src="../CollegeBook/img/upload/<%=imgname%>" height="20" width="25"/>&nbsp;<%=name%>&nbsp;<i class="icon icon-user"></i></a></li>

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
							</ul><!-- end Sub Menu li  -->

							<li><a href="#">Help</a></li>
						</li><!-- within li -->
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


<!-- Begining Of Section-1 -->
<section id="cimgSection-1">
			
			<!-- Left sidebar 07-Jan-14 -->
			<div id="ci_leftsidewrapper">
				<div id="l_s_content_img">
				
					 <!-- <a href="profileimage.jsp" title="<%=user%>" > -->
					 <img src="../CollegeBook/img/upload/<%=imgname%>"  class="img-rounded tip" title="Profile image"/>
					 <%
					String error_AP=(String)request.getAttribute("error_AP");
					if(error_AP!=null){%>
							<h6 class="alert alert-error"><%=error_AP%></h6>
					<%}%>
			
			</div>	
			</div><!-- End of Left sidebar 07-Jan-14 -->
			
			<img src="../CollegeBook/img/upload/<%=imgname%>"  class="img-rounded tip" title="Profile image " id="nprofile_image">
			<div id="nprofile_button">
			<FORM METHOD=POST ACTION="uploadProfileImage" enctype="multipart/form-data">
				<label class="alert alert-info">Upload New profile image</label>
				<input type="file" name="file" class="tip" title="Browse Image" />
				<input type="submit" value="upload" class="btn btn-primary tip" title="Change Photo"/>
				</FORM>
			</div>

	
</section>

<section id="cimgSection-2" name="cimgSection-2">
<h5 class="infoalert" id="album_heading"> Personal Album...</h5>


<img src="../CollegeBook/img/upload/Album/<%=Album1%>"  width="100"  BORDER="4" class="img-rounded" id="snap1"/>
<div id="snapbutton1">		
<a href="#albumphoto1" role="button" class="btn btn-min btn-primary tip" data-toggle="modal" title="Uplaod Photo1 ">Sanp1</a>
<!-- Modal -->
	<div id="albumphoto1" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><b id="x">×</b></button>
		<h4 id="myModalLabel">Upload Your Sanp..</h4>
		</div>

				<div class="modal-body">
				<FORM METHOD=POST ACTION="albumImage1" enctype="multipart/form-data">
				<input   type="file" value="" name="file" title="Browse Image" />
				<input type="submit" value="upload" class="btn btn-primary"/>
				</FORM>
				</div>

		<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
		</div>
	</div><!-- End Of postmadal -->
</div> <!-- End of POst div -->


<img src="../CollegeBook/img/upload/Album/<%=Album2%>"  width="150"  BORDER="4" class="img-rounded"  id="snap2"/>
<div id="snapbutton2">		
<a href="#albumphoto2" role="button" class=" btn btn-min btn-danger tip" data-toggle="modal" title="Uplaod Photo2">Sanp2</a>
<!-- Modal -->
	<div id="albumphoto2" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><b id="x">×</b></button>
		<h4 id="myModalLabel">Upload Your Sanp..</h4>
		</div>

				<div class="modal-body">
				<FORM METHOD=POST ACTION="albumImage2" enctype="multipart/form-data">
				<input   type="file" value="" name="file" title="Browse Image" />
				<input type="submit" value="upload" class="btn btn-primary"/>
				</FORM>
				</div>

		<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
		</div>
	</div><!-- End Of postmadal -->
</div> <!-- End of POst div -->


<img src="../CollegeBook/img/upload/Album/<%=Album3%>"  width="150"  BORDER="4" class="img-rounded"  id="snap3"/>
<div id="snapbutton3">		
<a href="#albumphoto3" role="button" class="btn btn-min btn-success tip" data-toggle="modal" title="Uplaod Photo3 ">Sanp3</a>
<!-- Modal -->
	<div id="albumphoto3" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><b id="x">×</b></button>
		<h4 id="myModalLabel">Upload Your Sanp..</h4>
		</div>

				<div class="modal-body">
				<FORM METHOD=POST ACTION="albumImage3" enctype="multipart/form-data">
				<input   type="file" value="" name="file" title="Browse Image" />
				<input type="submit" value="upload" class="btn btn-primary"/>
				</FORM>
				</div>

		<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
		</div>
	</div><!-- End Of postmadal -->
</div> <!-- End of POst div -->


<img src="../CollegeBook/img/upload/Album/<%=Album4%>"  width="150"  BORDER="4" class="img-rounded" id="snap4"/>
<div id="snapbutton4">		
<a href="#albumphoto4" role="button" class="btn btn-min btn-primary tip" data-toggle="modal" title="Uplaod Photo4">Sanp4</a>
<!-- Modal -->
	<div id="albumphoto4" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><b id="x">×</b></button>
		<h4 id="myModalLabel">Upload Your Sanp..</h4>
		</div>

				<div class="modal-body">
				<FORM METHOD=POST ACTION="albumImage4" enctype="multipart/form-data">
				<input   type="file" value="" name="file" title="Browse Image" />
				<input type="submit" value="upload" class="btn btn-primary"/>
				</FORM>
				</div>

		<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
		</div>
	</div><!-- End Of postmadal -->
</div> <!-- End of POst div -->



<div id="coverimg" ><!-- Cover image -->
	<IMG SRC="../CollegeBook/img/upload/Album/<%=coverimage%>" /> 
	<a href="#coverimage" role="button" class="btn tip" data-toggle="modal" id="coverimage_button" title="Change cover image">Cover Image</a>

	<!-- Modal -->
	<div id="coverimage" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><b id="x">×</b></button>
			<h4 id="myModalLabel">Change Your Cover Image.</h4>
		</div>

				<div class="modal-body">
					<FORM METHOD=POST ACTION="coverImage" enctype="multipart/form-data">
					<input   type="file" value="" name="file" title="Browse Image" />
					<input type="submit" value="upload" class="btn btn-primary"/>
					</FORM>
				</div>

		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
		</div>
	</div>	
</div>
				
					
</section>
</div><!-- End of Main div cointainer -->


 <footer id="cimgfooter" class="vspace20"> 
			<div class="container">
				
				<p align="right">&copy; Copyright CollegeBook 2014.</p>
				
			</div> 
					
	</div>
</footer><!-- End Of Footer --> 

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
			//scroll bar custom
				jQuery(document).ready(
			  function() {  
				jQuery("html").niceScroll({cursorcolor:"#3366FF"});
			  }
			);
		</script>
		<script>			
			jQuery(document).ready(function(){
				jQuery('#nnavbar').localScroll(3000);//#nnavbar is for scrolling..
				jQuery('#cimgfooter').parallax("20%", 0.3,true);
			});
		</script>
		<script>						
			$("#albumphoto").modal('show')
			//$("#success").modal()
		</script>

</BODY>
</HTML>
