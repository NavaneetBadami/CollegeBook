<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.lang.*,java.util.*,java.io.*,java.sql.*,com.college.memories.book.controller.LoginController.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<html xmlns= "http://www.w3.org/1999/xhtml">
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
<link rel="stylesheet" href="css/datepicker.css" type="text/css" />

<link rel="stylesheet" href="./js/touchTouch/assets/touchTouch/touchTouch.css" />
<script type="text/javascript" src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/datepicker.js"></script>
<script type="text/javascript" src="js/eye.js"></script>
<script type="text/javascript" src="js/utils.js"></script>
<script type="text/javascript" src="js/layout.js?ver=1.0.2"></script>

</HEAD>

<style type="text/css">

body {
	font-family: Helvetica, Arial, sans-serif; font-size: 12px;
	}

#nnavbar{
		position:absolute; right: 0px;
		}
#home-carousel
	{
		position:absolute; right: 70px; top: 180px; position: fixed;
		}

#CareerSection{
				height:360px;
				width:680px;
				position:absolute; position:fixed;
				top:160px;
				left:40px;
				border-radius:4px;
				        border-radius: 6px;
						  -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
						  -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
						   box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
						  -webkit-background-clip: padding-box;
						  -moz-background-clip: padding;
						   background-clip: padding-box;

						   background-color:#F2F2F2 ;
						   border: 1px solid #ccc;
						   border: 1px solid rgba(0, 0, 0, 0.2);
}
#CompleteSection{
				height:360px;
				width:740px;
				position:absolute; position:fixed;
				top:150px;
				left:20px;
				border-radius:4px;
				        border-radius: 6px;
						  -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
						  -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
						   box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
						  -webkit-background-clip: padding-box;
						  -moz-background-clip: padding;
						   background-clip: padding-box;

						   background-color:#F2F2F2 ;
						   border: 1px solid #ccc;
						   border: 1px solid rgba(0, 0, 0, 0.2);
	}
#basic{
				height:300px;
				width:300px;
				border: 1px solid gray ;
				position:absolute; position:fixed;
				top:160px;
				left:40px;
				border-radius:4px;
			    border: 1px solid #ccc;
			    border: 1px solid rgba(0, 0, 0, 0.2);
			    box-shadow: 0 5px 10px rgba(0.2, 0, 0, 0.2);
				background-color:#ffffff ;
				}
#address{
				height:300px;
				width:330px;
				border: 1px solid gray ;
				position:absolute; position:fixed;
				top:160px;
				left:410px;
				border-radius:4px;
			    border: 1px solid #ccc;
			    border: 1px solid rgba(0, 0, 0, 0.2);
			    box-shadow: 0 5px 10px rgba(0.2, 0, 0, 0.2);
				background-color:#ffffff ;
				}

#basicUpdateButton{			
				position:absolute; position:fixed;
				top:475px;
				left:330px;
				}
#badge{			
				position:absolute; position:fixed;
				top:480px;
				left:40px;
				}
#graduate{
				height:210px;
				width:200px;
				border: 1px solid gray ;
				position:absolute; position:fixed;
				top:180px;
				left:60px;
				border-radius:4px;
			    border: 1px solid #ccc;
			    border: 1px solid rgba(0, 0, 0, 0.2);
			    box-shadow: 0 5px 10px rgba(0.2, 0, 0, 0.2);
				background-color:#ffffff ;
				}

#working{
				height:180px;
				width:200px;
				border: 1px solid gray ;
				position:absolute; position:fixed;
				top:200px;
				left:280px;
				border-radius:4px;
				border: 1px solid #ccc;
			    border: 1px solid rgba(0, 0, 0, 0.2);
				box-shadow: 0 5px 10px rgba(0.2, 0, 0, 0.2);
				background-color:#ffffff ;
				}
#present{
				height:215px;
				width:200px;
				border: 1px solid gray ;
				position:absolute; position:fixed;
				top:180px;
				left:500px;
				border-radius:4px;
				border: 1px solid #ccc;
			    border: 1px solid rgba(0, 0, 0, 0.2);
				box-shadow: 0 5px 10px rgba(0.2, 0, 0, 0.2);
				background-color:#ffffff ;
				}
#careerUpdateButton{			
				position:absolute; position:fixed;
				top:450px;
				left:330px;
				}
#line{			
				 margin: 10px 0;
				 border: 0;
				 border-top: 1px solid #ccc;
				 border-bottom: 1px solid #ffffff;
				}
#Skip{
			position:absolute; position:fixed;
			top:480px;
			left:650px;
			}
#badge2{
			position:absolute; position:fixed;
			top:490px;
			left:50px;
		}
</style>


<script>		//Name Should be field.
		function ValidateProfile()
		{
			var name=document.forms["CompleteProfile"]["name"].value;
			if (name==null ||name=="")
			{
			  alert("Please Insert your Name...!");
			  return false;
			 }
		}
</script> 

<script>
	$(document).ready(function(){
	$('.carousel').carousel({interval:2000});
	}); // end document.ready
</script>
</head>


<BODY>

<%
HttpSession ses=request.getSession(false);
String user = (String)ses.getAttribute("username");
String imgname=user+".jpg";
	if(user == null)
	{
		request.setAttribute("sessionTimeOut", "sessionTimeOut");
		request.getRequestDispatcher("logout.jsp").forward(request,response);
	}
%>

<!-- Navigation bar on Top -->
<div class="navbar navbar-fixed-top"> 
<div class="navbar-inner">
		<ul class="nav navbar-nav navbar-right">
		<li><h1 id="logo"><IMG SRC="img/logo.jpg" width=130/></h1></li>
		</ul>
	<div id="nnavbar"><!-- elements on right side 08-Jan-14 -->
		<ul class="nav navbar-nav navbar-right ">
						<li><a href="#" class="tip" title="<%=user%>"><%=user%>&nbsp;<i class="icon icon-user"></i></a></li>

						<li class="dropdown"><!-- Elements on settings -->
							<a href="#" class="dropdown-toggle tip" data-toggle="dropdown" title="Settings"><i class="icon icon-cog"></i><b class="caret"></b></a>
						<ul class="dropdown-menu pull-right">
							<li><a href="logout.jsp">Logout</a></li>
							<li class="divider"></li>
							<li><a href="#">Help</a></li>
						</li><!-- within li -->

						</ul><!-- End of Pull-right -->

		</ul>
	</div>
</div><!--End of Navbar inner -->
</div><!--End of Navigation Bar -->

<!-- Carousel Div -->
		<div class="carousel slide" id="home-carousel">
		<div class="carousel-inner">
		<div class="item active"><IMG SRC="img/gallary/i.jpg" WIDTH="500"  ALT="not diaplayed..!" class="img-rounded"></div>
		<div class="item ">	<IMG SRC="img/gallary/i2.jpg" WIDTH="500"   ALT="not diaplayed..!"  class="img-rounded"></div>
		<div class="item ">	<IMG SRC="img/gallary/i3.jpg" WIDTH="500"   ALT="not diaplayed..!"  class="img-rounded"></div>
		</div><!-- .carousel-inner -->
		</div><!-- End OF carousel -->			

<%
	String profileStatus=(String)request.getAttribute("profileStatus");
	if(profileStatus !=null && profileStatus.equalsIgnoreCase("basiNotCompleted"))
	{%>
				<!-- If its Incomplete Profile...! 03-May-14 rebuild-->
	
	<div id="CompleteSection">  
		<form name="CompleteProfile" action="profileComplete" method="post" onsubmit="return ValidateProfile();">

			<div id="basic">
				<h5 class="alert alert-success">&nbsp;Basic Details</h5>
				<HR id="line">

				&nbsp;&nbsp;<i class="icon icon-user"></i>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" class="input" placeholder="<%=user%>"disabled><BR>
				&nbsp;<strong>Name</strong>&nbsp;&nbsp;<input type="text" name="name" class="input" placeholder="Enter your Name" maxlength=20><BR>
				&nbsp;<strong>DOB</strong>&nbsp;&nbsp;&nbsp;&nbsp;<input id="inputDate" name="dob" type="text" class="inputDate" value="21-11-1989"/><BR>

				&nbsp;<strong>Male</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<INPUT TYPE="radio" NAME="gender" value="MALE">&nbsp;&nbsp;<strong>Female</strong>&nbsp;&nbsp;<INPUT TYPE="radio" NAME="gender" value="FEMALE"><BR>

				&nbsp;&nbsp;<BR>

				&nbsp;<strong>Married</strong>&nbsp;&nbsp;
				<INPUT TYPE="radio" NAME="maritalStatus" value="MARRIED">&nbsp;&nbsp;<strong>Single</strong>&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="radio" NAME="maritalStatus" value="SINGLE">
			</div>

			<div id="address">
				<h5 class="alert alert-success">&nbsp;Home Address</h5>
				<HR id="line">

				&nbsp;<i class="icon icon-map-marker"></i>&nbsp;&nbsp;<TEXTAREA NAME="homeAddress" class="span3" rows="4" color="blue" Maxlength=100 placeholder="Enter your Address"/></TEXTAREA><BR>
				&nbsp;<i class="icon icon-globe"></i>&nbsp;&nbsp;<input name="city" type="text" class="input" placeholder="Enter your Hometown"/><BR>
				&nbsp;<i class="icon icon-road"></i>&nbsp;&nbsp;
				<input name="state" type="text" id="states" class="input" placeholder="Enter your State" autocomplete="off"/><BR>
			</div>

		   <button class="btn btn-medium btn-success" type="submit" id="basicUpdateButton">Complete</button>
		   <p id="badge"> <span class="badge badge-info">1</span>
		   <span class="badge" class="tip" title="Next Section">2</span></p>
       </form>
	</div><!-- End OF complete Section -->
								
								<!-- If profile process has been completed..! -->
	<%}


	if(profileStatus !=null && profileStatus.equalsIgnoreCase("carrerNotCmpleted"))
	{%>
	<div id="CareerSection">    <!-- Carrer section03-May-14 rebuild -->
			<form action="careerComplete" method="post">

			<div id="graduate">
				<h5 class="alert alert-success">&nbsp;Graduate From.</h5>
				<HR id="line">
				&nbsp;<i class="icon icon-book"></i>&nbsp;&nbsp;<input type="text" name="degree" class="input-medium span" placeholder="Degree" maxlength=30>
				&nbsp;<i class="icon icon-random"></i>&nbsp;&nbsp;<input type="text" name="collegeName" class="input-medium" placeholder="College Name" maxlength=30>
				&nbsp;<i class="icon icon-map-marker"></i>&nbsp;&nbsp;<input type="text" name="location" class="input-medium" placeholder="Location" maxlength=30>
			</div>

			<div id="working">
				<h5 class="alert alert-success">&nbsp;Working at.</h5>
				<HR id="line">
				&nbsp;<i class="icon icon-briefcase"></i>&nbsp;&nbsp;<input type="text" name="company" class="input-medium span" placeholder="Company" maxlength=30>
				&nbsp;&nbsp;<i class="icon icon-lock"></i>&nbsp;&nbsp;&nbsp;<input type="text" name="desgination" class="input-medium" placeholder="Desgination" maxlength=30>	
			</div>

			<div id="present">
				<h5 class="alert alert-success">&nbsp;Current Location.</h5>
				<HR id="line">
				&nbsp;<i class="icon icon-map-marker"></i>&nbsp; <TEXTAREA NAME="currentAddress" ROWS="3" class="span2" placeholder="Current Address" maxlength=80></TEXTAREA>
				&nbsp;<i class="icon icon-"></i>&nbsp;&nbsp;&nbsp;<input type="text" name="currentState" id="states" class="input-medium" placeholder="State" maxlength=30 autocomplete="off"/>
			</div>

            <button class="btn btn-large btn-success " type="submit" id="careerUpdateButton">&nbsp;Update&nbsp;</button>
			<button class="btn btn-link " type="submit" id="Skip">Skip</button>
		<!-- 	<a href="inbox" class="btn btn-link tip" id="Skip" title="you can skip this Section.">Skip</a> -->
			<p id="badge2"> 
				<A HREF="register.jsp" class="tip" title="Previous Section"><span class="badge badge-success">1</span></A>
				<span class="badge badge-info">2</span>
				<span class="badge ">End</span>
			</p>
       </form>
	
	</div>    <!-- End Of Career section -->
   
		
<%}%>

<%
String basicCompleted=(String)request.getAttribute("basicCompleted");
if(basicCompleted !=null && basicCompleted.equalsIgnoreCase("basicCompleted"))
	{%>
	<div id="CareerSection">    <!-- Carrer section03-May-14 rebuild -->
			<form action="careerComplete" method="post">

			<div id="graduate">
				<h5 class="alert alert-success">&nbsp;Graduate From.</h5>
				<HR id="line">
				&nbsp;<i class="icon icon-book"></i>&nbsp;&nbsp;<input type="text" name="degree" class="input-medium span" placeholder="Degree" maxlength=30>
				&nbsp;<i class="icon icon-random"></i>&nbsp;&nbsp;<input type="text" name="collegeName" class="input-medium" placeholder="College Name" maxlength=30>
				&nbsp;<i class="icon icon-map-marker"></i>&nbsp;&nbsp;<input type="text" name="location" class="input-medium" placeholder="Location" maxlength=30>
			</div>

			<div id="working">
				<h5 class="alert alert-success">&nbsp;Working at.</h5>
				<HR id="line">
				&nbsp;<i class="icon icon-briefcase"></i>&nbsp;&nbsp;<input type="text" name="company" class="input-medium span" placeholder="Company" maxlength=30>
				&nbsp;&nbsp;<i class="icon icon-lock"></i>&nbsp;&nbsp;&nbsp;<input type="text" name="desgination" class="input-medium" placeholder="Desgination" maxlength=30>	
			</div>

			<div id="present">
				<h5 class="alert alert-success">&nbsp;Current Location.</h5>
				<HR id="line">
				&nbsp;<i class="icon icon-map-marker"></i>&nbsp; <TEXTAREA NAME="currentAddress" ROWS="3" class="span2" placeholder="Current Address" maxlength=80></TEXTAREA>
				&nbsp;<i class="icon icon-"></i>&nbsp;&nbsp;&nbsp;<input type="text" name="currentState" id="states" class="input-medium" placeholder="State" maxlength=30 autocomplete="off"/>
			</div>

            <button class="btn btn-large btn-success " type="submit" id="careerUpdateButton">&nbsp;Update&nbsp;</button>
			<button class="btn btn-link " type="submit" id="Skip">Skip</button>
		<!-- 	<a href="inbox" class="btn btn-link tip" id="Skip" title="you can skip this Section.">Skip</a> -->
			<p id="badge2"> 
				<A HREF="register.jsp" class="tip" title="Previous Section"><span class="badge badge-success">1</span></A>
				<span class="badge badge-info">2</span>
				<span class="badge ">End</span>
			</p>
       </form>
	
	</div>    <!-- End Of Career section -->
<%}
%>


	<script src="./js/jquery-1.8.3.min.js" type="text/javascript"></script>
	<script src="./js/script.js"></script>
	<script src="js/jquery.nicescroll.min.js" type="text/javascript"></script>
	<script src="./js/bootstrap.min.js"></script> 
    <script src="js/bootstrap-typeahead.js" type="text/javascript"></script>
	<script src="js/demo.js" type="text/javascript"></script> 

	<script>						
			//scroll bar custom.
			jQuery(document).ready(
			  function() {  
				jQuery("html").niceScroll({cursorcolor:"#3366FF"});
			  }
			);
		</script>
<script>	 // typeahead for states field. 
		$('#states').typeahead({
        source: [
		    { id: 1, name: 'KARNATAKA' },
		    { id: 2, name: 'ASSAM' },
		    { id: 3, name: 'ANDHARAPRADESH' },
		    { id: 4, name: 'ARUNACHALPRADESH' },
		    { id: 5, name: 'ASSAM' },
		    { id: 6, name: 'BIHAR' },
		    { id: 7, name: 'CHHATTISGARH' },
		    { id: 8, name: 'DELHI' },
		    { id: 9, name: 'GOA' },
		    { id: 10, name: 'GUJRAT'},
			{ id: 11, name: 'HARAYANA' },
		    { id: 12, name: 'JAMMU-KASHMIR' },
		    { id: 13, name: 'JARKHAND' },
		    { id: 14, name: 'KERLA' },
		    { id: 15, name: 'MADHYAPRADESH' },
		    { id: 16, name: 'MAHARASHTRA' },
		    { id: 17, name: 'MIZORAM' },
		    { id: 18, name: 'MEGALAYA' },
		    { id: 19, name: 'MANIPUR' },
		    { id: 20, name: 'NAGALAND' },
			{ id: 21, name: 'ORRISA' },
		    { id: 22, name: 'PANJAB' },
		    { id: 23, name: 'RAJASHTAN' },
		    { id: 24, name: 'SAKKIM' },
		    { id: 25, name: 'TRIPURA' },
		    { id: 26, name: 'UTTARPRADESH' },
		    { id: 27, name: 'UTTARKHAND' },
		    { id: 28, name: 'WESTBENGAL' },
	    ],
    //    itemSelected: displayResult
    });
</script>	
	
</BODY>
</HTML>
