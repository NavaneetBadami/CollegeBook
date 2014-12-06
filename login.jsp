<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" import="java.lang.*,java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.io.*,javax.servlet.RequestDispatcher.*" 
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<!-- Set the viewport width to device width for mobile -->
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

<script>				//allows only numbers in mobileno field.
		function isNumberKey(evt)
		{
			var charCode = (evt.which) ? evt.which : event.keyCode
			if (charCode > 31 && (charCode < 48 || charCode > 57))
				return false;
				return true;
			}
</script>

<script>		//Username, Email, password Should be field.
		function validateForm()
		{
			var newUserName=document.forms["myForm"]["newUserName"].value;
			var emailId=document.forms["myForm"]["emailId"].value;
			var password=document.forms["myForm"]["password"].value;
			var mobileNo=document.forms["myForm"]["mobileNo"].value;
	
			var atpos=emailId.indexOf("@");
			var dotpos=emailId.lastIndexOf(".");

			if (newUserName==null ||newUserName=="")
			{
			  alert("UserName must be filled out..!");
			  return false;
			 }

			else if (mobileNo==null || mobileNo=="")
			{
					alert("Mobile Number must be filled out..!");
					return false;
			 }

		//	 else if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length || y=="")
			 else if (atpos<1 || dotpos<atpos+2 || emailId=="")
			 {
					alert("Not a valid e-mail address..!");
					return false;
			 }

			 else if (password==null || password=="")
			 {
					alert("Please Insert Password..!");
					return false;
			 }
		}
</script> 

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
<script>		//validateConfirmation process.
		function validateConfirmation()
		{
			var verifyCode=document.forms["verification"]["verifyCode"].value;
			if (verifyCode==null || verifyCode=="")
			 {
			  alert("Please Enter Verification Code..!");
			  return false;
			 }
		}
</script>

<script>		//Forget Username password validateConfirmation process.
		function forgetValidation()
		{
			var forgetUnOrPass=document.forms["forgotForm"]["forgetUnOrPass"].value;
			if(forgetUnOrPass==null || forgetUnOrPass=="");
			{
				 alert("Please Enter your Email..!");
				 return false;
			}
		}
</script>
<style>
		#social{ position:absolute; bottom:00px; right:30px;}
		#copy{ position:absolute; bottom:10px; left:30px;}
		#nnavbar{position:absolute; right: 30px; top:10px;}
		#note{position:absolute; left: 140px; top:100px;}
		.input-medium 
		{
		height:25px !important;
		border-color: solid black;
		}
		#x{color:red; font-size:30px;}

</style>
</head>
<body>
													<!-- Verification process 13-07-2014. -->
	<%
		String isNewUser=(String)request.getAttribute("isNewUser");  // Verification process 13-07-2014. 
		if(isNewUser!=null && isNewUser.equalsIgnoreCase("YES"))
		{ %>
			
			<div class="collegeBookModal">   <!-- loginstyle.css -->
					<div class="modal-header">
						<h4 id="myModalLabel">Please Verify your account.</h4>
					</div>
						<div class="modal-body">
							<h5>Enter code which has been sent by mail.</h5>
							<FORM METHOD=POST ACTION="verifyAccount" name="verification" onsubmit="return validateConfirmation();">
								<INPUT TYPE="text" class="input-medium span3" NAME="verifyCode" placeholder="Enter the Code.">
								<button type="submit" class="btn btn-info btn-small" title="verify">verify</button>
							</FORM>
						</div>
						<div class="modal-footer">
							<a href="logout.jsp" class="btn btn-danger btn-small" title="Close">Close</a>
						</div>
			</div><!-- Endo of collegeBookModal -->
		<%}

		String wrongCode=(String)request.getAttribute("wrongCode"); // Wrong Verification Code 13-07-2014.
		if(wrongCode!=null && wrongCode.equalsIgnoreCase("wrongCode"))
		{ %>
			
			<div class="collegeBookModal">
					<div class="modal-header">
						<h4 id="myModalLabel">Please Verify your account.</h4>
					</div>
						<div class="modal-body">
							<h5 class="alert alert-error">Please Enter Correct code...</h5>
							<FORM METHOD=POST ACTION="verifyAccount" name="verification" onsubmit="return validateConfirmation();">
								<INPUT TYPE="text" class="input-medium span3" NAME="verifyCode" placeholder="Enter the Code.">
								<button type="submit" class="btn btn-info btn-small" title="verify">verify</button>
							</FORM>
						</div>
						<div class="modal-footer">
							<a href="logout.jsp" class="btn btn-danger btn-small" title="Close">Close</a>
						</div>
			</div><!-- Endo of collegeBookModal -->
		<%}
	%>
							<!-- End Of Verification process 13-07-2014. -->


						<!-- Resending Verification code to user by mail. -->
	<%
		String EmailReSendStatus=(String)request.getAttribute("status");  // Email sending fail 13-07-2014.
		if(EmailReSendStatus!=null && EmailReSendStatus.equalsIgnoreCase("emailNotReSent"))
		{ %>
			
			<div class="collegeBookModal">
			<a href="login.jsp" class="close" data-dismiss="alert"><b id="x">&times;</b></a>
					<div class="modal-header alert alert-error">
						<h5 id="myModalLabel">Sorry..! verification code has not been sent to your Email account.</h5>
					</div>
						<div class="modal-body">
							<h5>Please Enter your UserName ones again.</h5>
							<FORM METHOD=POST ACTION="reSendVerifyCode">
								<INPUT TYPE="text" class="input-medium span3" NAME="resendEmailTo" placeholder="UserName">
								<button type="submit" class="btn btn-info btn-small" title="ReTry">ReSend..</button>
							</FORM>
						</div>
			</div><!-- Endo of collegeBookModal -->
		<%}
		else if(EmailReSendStatus!=null && EmailReSendStatus.equalsIgnoreCase("worngUserName"))
		{%>
			<div class="collegeBookModal">
			<a href="login.jsp" class="close" data-dismiss="alert"><b id="x">&times;</b></a>
					<div class="modal-header alert alert-error ">
						<h5 id="myModalLabel">Sorry..! verification code has not been sent to your Email account.</h5>
					</div>
						<div class="modal-body">
							<h5><font color="red">Wrong UserName..!</font></h5>
							<FORM METHOD=POST ACTION="reSendVerifyCode">
								<INPUT TYPE="text" class="input-medium span3" NAME="resendEmailTo" placeholder="UserName">
								<button type="submit" class="btn btn-info btn-small" title="ReTry">Try again..</button>
							</FORM>
						</div>
			</div><!-- Endo of collegeBookModal -->
		<%}
		else if(EmailReSendStatus!=null && EmailReSendStatus.equalsIgnoreCase("reSentEmail"))
		{ %>
			<div class="collegeBookModal">
				<a href="login.jsp" class="close" data-dismiss="alert"><b id="x">&times;</b></a>
					<div class="modal-header alert alert-success">
						<h4 id="myModalLabel ">Verification Code has been sent to your Email account.</h4>
						<i>Please note down the verification code for first time login process.</i> 
					</div>
			</div><!--end collegeBookModal -->
		<%}
	%>


									<!--This Section for Forgot password or UserName sending Email.  -->
	<%
		String forgotUnPsEmailFailed=(String)request.getAttribute("forgotUnPsEmailFailed");  // sending fail forgetPassword or Un 13-07-2014.
		if(forgotUnPsEmailFailed!=null && forgotUnPsEmailFailed.equalsIgnoreCase("forgotUnPsEmailFailed"))
		{ %>
			
			<div class="collegeBookModal">
			<a href="login.jsp" class="close" data-dismiss="alert"><b id="x">&times;</b></a>
					<div class="modal-header alert alert-error">
						<h5 id="myModalLabel">Sorry..! Unable to send Password or username to your Email account.</h5>
					</div>
						<div class="modal-body">
							<h5>Please Enter your Email ones again.</h5>
							<FORM METHOD=POST ACTION="forgetPasswordOrUsername">
								<INPUT TYPE="text" class="input-medium span3" NAME="forgetUnOrPass" placeholder="UserName">
								<button type="submit" class="btn btn-info btn-small" title="ReTry">Try Agin.</button>
							</FORM>
						</div>
			</div><!-- Endo of collegeBookModal -->
		<%}


		String forgotUnPsEmailSuccess=(String)request.getAttribute("forgotUnPsEmailSuccess");  // sending Success forgetPass or Un 13-07-2014.
		if(forgotUnPsEmailSuccess!=null && forgotUnPsEmailSuccess.equalsIgnoreCase("forgotUnPsEmailSuccess"))
		{ %>
			
			<div class="collegeBookModal">
			<a href="login.jsp" class="close" data-dismiss="alert"><b id="x">&times;</b></a>
					<div class="modal-header alert alert-success">
						<h5 id="myModalLabel">Password and username has been sent to your Email Account.</h5>
					</div>
			</div><!-- Endo of collegeBookModal -->
		<%}


		String forgotUnPsNotValidEmail=(String)request.getAttribute("forgotUnPsNotValidEmail");// notValid email forgetPass or Un 13-07-2014.
		if(forgotUnPsNotValidEmail!=null && forgotUnPsNotValidEmail.equalsIgnoreCase("forgotUnPsNotValidEmail"))
		{ %>
			
			<div class="collegeBookModal">
			<a href="login.jsp" class="close" data-dismiss="alert"><b id="x">&times;</b></a>
					<div class="modal-header">
						<h5 id="myModalLabel">Sorry..! Email id doesn't exists in CollegeBook.</h5>
					</div>
						<div class="modal-body alert-error">
							<h5><i><font color="red">Please Enter Correct Email ones again.</font></i></h5>
							<FORM METHOD=POST ACTION="forgetPasswordOrUsername">
								<INPUT TYPE="text" class="input-medium span3" NAME="forgetUnOrPass" placeholder="UserName">
								<button type="submit" class="btn btn-info btn-small" title="ReTry">Try Agin.</button>
							</FORM>
						</div>
			</div><!-- Endo of collegeBookModal -->
		<%}
	%>

<!-- forgetUsernamePassword modal -->
	<div id="forgetUsernamePassword" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">

		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true"><b id="x">×</b></button>
			<h4 id="myModalLabel">Please Enter your Email Id</h4>
			<i>Please Enter your Email Id to get your userName or Password.</i>
		</div>

				<div class="modal-body alert-error">
					<h5></h5>
					<FORM METHOD=POST ACTION="forgetPasswordOrUsername">
						<INPUT TYPE="text" class="input-medium span3" NAME="forgetUnOrPass" placeholder="Email id">
						<button type="submit" class="btn btn-info btn-small" title="ReTry">Send</button>
					</FORM>
				</div>
</div><!-- End Of forgetUsernamePassword -->

								<!--End of Section for Forgot password or UserName sending Email.  -->


<!-- Navigation bar on Top -->
 <div class="navbar navbar-fixed-top"> 
		<div class="navbar-inner">
			<ul class="nav navbar-nav navbar-right">
			<li><a href="login.jsp" title="CollegeBook"><IMG SRC="img/login_logo.jpg" width=220/></a></li>
			</ul>
		</div>

	<div id="nnavbar">
		<ul class="nav">
			<form class="navbar-form form-search pull-right" action="login" method="post" name="login" onsubmit="return validateLogin();">			
			<div><!-- After Successfully profile created -->
				<input type="text" name="userName" class="input-medium" placeholder="UserName" title="Enter UserName">
				<input type="password" name="password" class="input-medium" placeholder="Password" title="Enter Password">
				<button type="submit" class="btn btn-info btn-small" title="Login">Login</button><BR>
				<A HREF="#forgetUsernamePassword" data-toggle="modal"><font size=2>Forgetten Username or Password..!</font></A>
				<%
				String notValid=(String)request.getAttribute("notValidUser");
				if(notValid !=null){%>
				<div class="alert alert-error">                                   <!-- IF Username or Password is not correct -->
					<a href="login.jsp" class="close" data-dismiss="alert">&times;</a>
					<strong>Sorry!</strong> Worng User Name or Password.
				</div> 
				<%}%>	
			</div>
			</form>
		</ul>
	</div><!-- End Login form -->
</div><!-- End Of fixed Top -->


		<div>								<!-- Create New Account process. -->
		<div id="note">
			<h3 class="alert alert-info">&nbsp;Create New Account&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h3>
		</div>
			<form  name="myForm" id="slick-login" Method="post" Action="createAccount" onsubmit="return validateForm();">
		    <input name="newUserName" type="text" class="placeholder" placeholder="Enter UserName" maxlength=30 />
		<%
			String accountStatus=(String)request.getAttribute("accountStatus");
			if(accountStatus !=null && accountStatus.equalsIgnoreCase("duplicateUserName"))  // If user name is exites
			{%>
				<div class="alert alert-error">
					<a href="login.jsp" class="close" data-dismiss="alert">&times;</a>
					<strong>Sorry..!</strong> UserName or Email already existing.
				</div> 
			<%}%>
            <input  name="mobileNo" type="text"  placeholder="Enter MobileNo" maxlength=10 onkeypress='return isNumberKey(event)'/>
            <input  name="emailId" type="text"   placeholder="Enter Email id" maxlength=30/>
            <input  name="password" type="password" placeholder=" Enter Password" maxlength=20/>
            <input type="submit" value="Create Account" />
			</form>
			</div>  

			<%
			 if(accountStatus !=null && accountStatus.equalsIgnoreCase("profileCreated")) //if profile Created successfully.
			{%>
					<div class="collegeBookModal">
					<a href="login.jsp" class="close" data-dismiss="alert"><b id="x">&times;</b></a>
						<div class="modal-header alert alert-success">
							<h4 id="myModalLabel ">Verification Code has been sent to your Email account.</h4>
							<i>Please note down the verification code for first time login process.</i> 
						</div>
				</div><!--end collegeBookModal -->
			<%}

			 if(accountStatus !=null && accountStatus.equalsIgnoreCase("emailNotReSent"))  //if email not sent after acc created..
			{%>
				<div class="collegeBookModal">
				<a href="login.jsp" class="close" data-dismiss="alert"><b id="x">&times;</b></a>
					<div class="modal-header alert alert-error">
						<h5 id="myModalLabel">Sorry..! verification code has not been sent to your Email account.</h5>
					</div>
						<div class="modal-body">
							<h5>Please Enter your UserName ones again.</h5>
							<FORM METHOD=POST ACTION="reSendVerifyCode">
								<INPUT TYPE="text" class="input-medium span3" NAME="resendEmailTo" placeholder="UserName">
								<button type="submit" class="btn btn-info btn-small" title="ReTry">ReSend..</button>
							</FORM>
						</div>
			</div><!-- Endo of collegeBookModal -->
			<%}
		%>
							
									<!-- End OF Create New Account -->

  <div id="image"> 
		<IMG SRC="img/log_cov.jpg" WIDTH="555"><BR>
		<IMG SRC="img/shadow.png" WIDTH="555" >	
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

<script src="./js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="./js/script.js"></script>

</body>
</html>



