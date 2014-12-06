<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" import="java.lang.*,java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.io.*,javax.servlet.RequestDispatcher.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>CollegeBook</title>
<link rel="icon" href="img/Fevicon.ico">


<link href="css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/loginstyle.css" />

<link href="css/nbootstrap.css" rel="stylesheet"/>
<link href="css/toastr.css" rel="stylesheet"/>

<script src="js/jquery-1.10.2.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript" src="placeholder.js"></script>


<!--Not Allow To come again to this page  -->
 <SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT> 

</head>
<style>
#social{ position:absolute; bottom:00px; right:30px;}
#copy{ position:absolute; bottom:10px; left:30px;}
#nnavbar{position:absolute; right: 30px; top:10px;}
#coverimage{
		position:absolute; 
		top:230px;
		right:270px;

		animation: login 1.5s ease-in-out;
		-webkit-animation: login 1.5s ease-in-out;
		-moz-animation: login 1.5s ease-in-out;
		-ms-animation: login 1.5s ease-in-out;
		-o-animation: login 1.5s ease-in-out;
		
		margin-left: -110px;
		margin-top: -75px;
		}

#coverimage:hover{
		position:absolute; 
		top:230px;
		right:270px;

		animation: login 1.5s ease-in-out;
		-webkit-animation: login 1.5s ease-in-out;
		-moz-animation: login 1.5s ease-in-out;
		-ms-animation: login 1.5s ease-in-out;
		-o-animation: login 1.5s ease-in-out;
		box-shadow: 0px 1px 1px rgba(0, 0, 0, 0.075) inset, 0px 0px 8px rgba(82, 168, 236, 0.6);
		-webkit-box-shadow: inset 0px 2px 0px #a7a7a7;
	
		}

.input-medium {
			height: 25px !important;
			}
	#x{color:red; font-size:30px;}
</style>

<script>		//Login Username and password must be entered.
		function validateLogin()
		{
			var userName=document.forms["login"]["userName"].value;
			var password=document.forms["login"]["password"].value;
			if (userName==null || userName=="")
			 {
			  alert("Please insert Username..!");
			  return false;
			  }
				 else if(password==null || password=="")
				{
					 alert("Please Insert Password..!");
					 return false;
				}
		}
</script>

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">

<%
 HttpSession ses=request.getSession(false);
 ses.removeAttribute("username");
 ses.invalidate();
%>
<%
String sessionTimeOut=(String)request.getAttribute("sessionTimeOut"); // Session expire Code 13-07-2014.
		if(sessionTimeOut!=null && sessionTimeOut.equalsIgnoreCase("sessionTimeOut"))
		{ %>
			
			<div class="collegeBookModal">
			<a href="login.jsp" class="close" data-dismiss="alert"><b id="x">&times;</b></a>
					<div class="modal-header">
						<h4 id="myModalLabel">Session Time Out.</h4>
					</div>
						<div class="modal-body">
							<h5 class="alert alert-error">Please Login Again.</h5>
							<form class="navbar-form form-search pull-left" action="login" method="post" name="login" onsubmit="return validateLogin();">
								<input type="text" name="userName" class="input-medium" placeholder="User Name" title="Enter UserName">
								<input type="password" name="password" class="input-medium" placeholder="Password" title="Enter Password">
								<button type="submit" class="btn btn-info btn-small" title="Login">Login</button><BR>
							</form>
						</div>
						<div class="modal-footer">
							<a href="login.jsp" class="btn btn-danger btn-small" title="Close">Close</a>
						</div>
			</div><!-- Endo of collegeBookModal -->
		<%}
	%>

<!-- Navigation bar on Top -->
 <div class="navbar navbar-fixed-top"> 

		<div class="navbar-inner">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="login.jsp" title="CollegeBook"><IMG SRC="img/login_logo.jpg" width=220/></a></li>
			</ul>
		</div>

	<div id="nnavbar"><!-- Search member field 08-Jan-14 -->
	<ul class="nav">
		<form class="navbar-form form-search pull-right" action="login" method="post" name="login" onsubmit="return validateLogin();">
			<input type="text" name="userName" class="input-medium" placeholder="User Name" title="Enter UserName">
			<input type="password" name="password" class="input-medium" placeholder="Password" title="Enter Password">
			<button type="submit" class="btn btn-info btn-small" title="Login">Login</button><BR>
			<A HREF="login.jsp"><font size=2>Home Page..!</font></A>
		</form>
	</ul>
	</div><!-- End Login form -->
</div><!-- End Of fixed Top -->

  
  <div id="coverimage">
	  <a href="login.jsp" class="tip" title="CollegeBook">
		<IMG SRC="img/logout_cover.jpg" WIDTH="805" HEIGHT="300" ></a><BR>
  </div>

<footer id="loginfooter" class=""> 
		 <div id="social">
					<a href="http://www.facebook.com/Navaneet.Badami/"><img src="img/socials/facebook.png" alt="" /></a>
					<a href="http://www.twitter.com/Navaneet.Badami/"><img src="img/socials/twitter.png" alt="" /></a>
					<a href="http://www.youtube.com/Navaneet.Badami/"><img src="img/socials/youtube.png" alt="" /></a>
		   </div>
			<div id="copy">
					<p align="bottom">&copy; Copyright CollegeBook 2014.</p>
			</div>		
</footer><!-- End Of Footer -->

<script src="./js/bootstrap/js/bootstrap.min.js"></script>
<script src="./js/script.js"></script>
<script src="./js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="./js/script.js"></script>

</body>
</html>