<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" import="java.lang.*,java.util.*,java.io.*,java.sql.*,com.college.memories.book.controller.LoginController.*"
import="com.college.memories.book.dao.LoginDao"
%>
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

<script>				//allows only numbers in mobileno field.
		function isNumberKey(evt)
		{
			var charCode = (evt.which) ? evt.which : event.keyCode
			if (charCode > 31 && (charCode < 48 || charCode > 57))
				return false;
				return true;
			}
</script>


<script>			//Should be Valid emial.
		function validateForm()
		{
			var name=document.forms["myForm"]["uname"].value;
			var password=document.forms["myForm"]["upassword"].value;
			var mobile=document.forms["myForm"]["umobileNo"].value;
			var email=document.forms["myForm"]["uemailId"].value;
			var atpos=email.indexOf("@");
			var dotpos=email.lastIndexOf(".");
			
			if (name==null ||name=="")
			{
			  alert("Please Insert your Name...!");
			  return false;
			}
			else if (password==null ||password=="")
			{
			  alert("Please Insert your Password...!");
			  return false;
			}
			else if (mobile==null || mobile=="")
			{
					alert("Mobile Number must be filled out..!");
					return false;
			 }
			else if (atpos<1 || dotpos<atpos+2 || dotpos+2>=email.length)
			{
				  alert("Not a valid e-mail address.");
				  return false;
			}
		} 
</script> 


<style type="text/css">
/* Add whatever you need to your CSS reset */
#nnavbar{position:absolute; right: 0px}

body { font-family: Helvetica, Arial, sans-serif; font-size: 12px; bg  }

        #registration {
			position: absolute; right: 750px; top:65px;
			color: #BEBEBE;
            background: #2d2d2d;
            background: -webkit-gradient(
                            linear,
                            left bottom,
                            left top,
                            color-stop(0, rgb(60,60,60)),
                            color-stop(0.74, rgb(43,43,43)),
                            color-stop(1, rgb(60,60,60))
                        );
            background: -moz-linear-gradient(
                            center bottom,
                            rgb(60,60,60) 0%,
                            rgb(43,43,43) 74%,
                            rgb(60,60,60) 100%
                        );
            -moz-border-radius: 10px;
            -webkit-border-radius: 10px;
			border-radius: 10px;
            margin: 10px;
			width: 430px;
			height: 990px;
            }

 #registration a {
      color: #8c910b;
      text-shadow: 0px -1px 0px #000;
      }
	  
#registration fieldset {
      padding: 20px;
      }
	  
input.text {
      -webkit-border-radius: 15px;
      -moz-border-radius: 15px;
      border-radius: 15px;
      border:solid 1px #444;
      font-size: 14px;
      width: 90%;
      padding: 7px 8px 7px 30px;
      -moz-box-shadow: 0px 1px 0px #777;
      -webkit-box-shadow: 0px 1px 0px #777;
	  background: #ddd url('img/inputSprite.png') no-repeat 4px 5px;
	  background: url('img/inputSprite.png') no-repeat 4px 5px, -moz-linear-gradient(
           center bottom,
           rgb(225,225,225) 0%,
           rgb(215,215,215) 54%,
           rgb(173,173,173) 100%
           );
	  background:  url('img/inputSprite.png') no-repeat 4px 5px, -webkit-gradient(
          linear,
          left bottom,
          left top,
          color-stop(0, rgb(225,225,225)),
          color-stop(0.54, rgb(215,215,215)),
          color-stop(1, rgb(173,173,173))
          );
      color:#333;
      text-shadow:0px 1px 0px #FFF;
}	  

 input#email { 
 	background-position: 4px 5px; 
	background-position: 4px 5px, 0px 0px;
	}
	
 input#password { 
 	background-position: 4px -20px; 
	background-position: 4px -20px, 0px 0px;
	}
	 input#passworderror { 
 	background-position: 4px -20px; 
	background-position: 4px -20px, 0px 0px;
	color:red;
	}
 input#name { 
 	background-position: 4px -46px; 
	background-position: 4px -46px, 0px 0px; 
	}
input#nameerror{
	background-position: 4px -46px; 
	background-position: 4px -46px, 0px 0px;
	color:Red;
}
 input#tel { 
 	background-position: 4px -76px; 
	background-position: 4px -76px, 0px 0px; 
	
	}
input#telerror { 
 	background-position: 4px -76px; 
	background-position: 4px -76px, 0px 0px; 
	color:red;
	}
	
#registration h2 {
	color: #fff;
	text-shadow: 0px -1px 0px #000;
	border-bottom: solid #181818 1px;
	-moz-box-shadow: 0px 1px 0px #3a3a3a;
	text-align: center;
	padding: 18px;
	margin: 0px;
	font-weight: normal;
	font-size: 24px;
	font-family: Lucida Grande, Helvetica, Arial, sans-serif;
	}
	
	
	#registerNew:hover { background-position: 0px -41px; }
	#registerNew:active { background-position: 0px -82px; }
	
 #registration p {
      position: relative;
      }
 #upbtn{position: absolute; top:20px;}

fieldset label.infield /* .infield label added by JS */ {
    color: #333;
    text-shadow: 0px 1px 0px #fff;
    position: absolute;
    text-align: left;
    top: 3px !important;
    left: 35px !important;
    line-height: 29px;
    }

#prof-info{
				height:280px;
				width:630px;
				position:absolute; position:fixed;
				top:80px;
				right:30px;
				border-radius:4px;
				        border-radius: 6px;
						  -webkit-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
						  -moz-box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
						   box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
						  -webkit-background-clip: padding-box;
						  -moz-background-clip: padding;
						   background-clip: padding-box;
						   box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2)
						   background-color:#ffffff ;
						   border: 1px solid #ccc;
						   border: 1px solid rgba(0, 0, 0, 0.2);
	}
#graduate{
				height:210px;
				width:200px;
				border: 1px solid gray ;
				position:absolute; position:fixed;
				top:95px;
				right:455px;
				border-radius:4px;
			    border: 1px solid #ccc;
			    border: 1px solid rgba(0, 0, 0, 0.2);
			    box-shadow: 0 5px 10px rgba(0.2, 0, 0, 0.2);
				}
#working{
				height:180px;
				width:200px;
				border: 1px solid gray ;
				position:absolute; position:fixed;
				top:95px;
				right:245px;
				border-radius:4px;
				border: 1px solid #ccc;
			    border: 1px solid rgba(0, 0, 0, 0.2);
				  box-shadow: 0 5px 10px rgba(0.2, 0, 0, 0.2);
				}
#present{
				height:210px;
				width:200px;
				border: 1px solid gray ;
				position:absolute; position:fixed;
				top:95px;
				right:35px;
				border-radius:4px;
				border: 1px solid #ccc;
			    border: 1px solid rgba(0, 0, 0, 0.2);
				 box-shadow: 0 5px 10px rgba(0.2, 0, 0, 0.2);
				}
#add{
				
				position:absolute; position:fixed;
				top:290px;
				right:300px;
				}
#line{			
				 margin: 10px 0;
				  border: 0;
				  border-top: 1px solid #ccc;
				  border-bottom: 1px solid #ffffff;
				
				}
</style>


<BODY>

<%
 HttpSession ses=request.getSession(false);
String user = (String)ses.getAttribute("username");
String name=LoginDao.name4wholeApplication.get(user);  //get the Static Name from LoginDao.
String imgname=user+".jpg";
	if(user == null)
	{
		request.setAttribute("sessionTimeOut", "sessionTimeOut");
		request.getRequestDispatcher("logout.jsp").forward(request,response);
	}
%>

<div class="container">

<!-- Navigation bar on Top -->
<div class="navbar navbar-fixed-top"> 
<div class="navbar-inner">
		<ul class="nav navbar-nav navbar-right">
		<li><h1 id="logo"><a href="inbox" class="tip" title="HOME"><IMG SRC="img/logo.jpg" width=130/></a></h1></li>
		</ul>
	<div id="nnavbar"><!-- elements on right side08-Jan-14 -->
		<ul class="nav navbar-nav navbar-right ">
						<li><a href="inbox"  class="tip" title="HOME"><img src="../CollegeBook/img/upload/<%=imgname%>" height="20" width="25"/>&nbsp;<%=name%>&nbsp;<i class="icon icon-user"></i></a></li>

						<li class="dropdown"><!-- Elements on settings -->
							<a href="#" class="dropdown-toggle tip" data-toggle="dropdown" title="Settings"><i class="icon icon-cog"></i><b class="caret"></b></a>
						<ul class="dropdown-menu pull-right">
							<li><a href="logout.jsp">Logout</a></li>
							<li class="divider"></li>
							
							<li class="dropdown-submenu"><!-- Sub Menu li-->
							<a tabindex="-1" href="#">Account Settings</a>
							<ul class="dropdown-menu">
							<li><a href="#deleteprofilemodal"  class="tip" title="To delete your profile...!" data-toggle="modal">Delete Account</a></li>
							</ul><!-- end Sub Menu ul  -->

							<li><a href="#">Help</a></li>
						</li><!-- within li -->

						</ul><!-- End of Pull-right -->

		</ul>
	</div>
</div><!--End of Navbar inner -->
</div><!--End of Navigation Bar -->


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

<div id="registration">
 <h2>Update Your Profile</h2>
<form name="myForm" id="RegisterUserForm" action="updateProfile" method="post" onsubmit="return validateForm();">
<fieldset>
         <p>					<!-- Nama,Password and MobileNo Shouldn't be empty field. -->
			 <%
				String error1=(String)request.getAttribute("emptyFields");
				if(error1!=null)
				{%>
				<label for="name">Name</label>
				 <input id="nameerror" name="uname" type="text" class="text" placeholder="Please Insert Name...!"/>
				<%}
				else
				{ %>
				 <label for="name">Name</label>
				 <input id="name" name="uname" type="text" class="text" value=""/>
				<%}
			%>
         </p>
         <p>
			 <%
				String error2=(String)request.getAttribute("emptyFields");
				if(error2 !=null)
				{%>
					<label for="name">Password</label>
					<input id="passworderror" name="upassword" type="password" class="text" color="red" placeholder="Please Enter Password...!" />
				<%}
				else
				{ %>
					<label for="name">Password</label>
					<input id="password" name="upassword" type="password" class="text" />
				<%}
			%>
         </p>
         <p>
            <label for="tel">Home Address</label>
          <!--   <input id="tel" name="mo" type="tel" class="text" value="" /> -->
         </p>
		 <TEXTAREA NAME="uhomeAddress" ROWS="5" COLS="46" size=40 color="blue" Maxlength="50"/></TEXTAREA>
        
         <p>
            <label for="name">DOB</label>
               <input id="inputDate" name="udob" type="text" class="inputDate" value="21/11/1989" />
         </p>
		
		 <p>
		 <%
			String error3=(String)request.getAttribute("emptyFields");
			if(error3 !=null)
			{%>
				<label for="name">MobileNo</label>
				<input id="telerror" name="umobileNo" type="tel" class="text" placeholder="Please Enter Mobile No.!" maxlength=10 onkeypress='return isNumberKey(event)'/>
			<%}
			else
			{ %>
			 <label for="name">Mobile NO</label>
			  <input id="tel" name="umobileNo" type="tel" class="text" maxlength=10 onkeypress='return isNumberKey(event)'/>			
			<%}
		%>
         </p>
		 <p>
            <label for="name">Email</label>
            <input id="" name="uemailId" type="email" class="text" value="" />
         </p>
        
         <p>
            <label for="name">State</label>
          <input name="ustate" type="text" id="states" class="text" autocomplete="off"/><BR>
         </p>
			
         <p>
            <label for="name">Home Town</label>
            <input id="name" name="ucity" type="tel" class="text" value="" />
         </p>
		 <p>
            <label for="name">Gender</label>
			Male&nbsp;<INPUT TYPE="radio" NAME="ugender" value="MALE">&nbsp;Female&nbsp;<INPUT TYPE="radio" NAME="ugender" value="FEMALE">
         </p>
			
		<p>
            <label for="name">Material Status</label>
			 Married&nbsp;<INPUT TYPE="radio" NAME="umaritalStatus" value="MARRIED">&nbsp;Single&nbsp;<INPUT TYPE="radio" NAME="umaritalStatus" value="SINGLE">
         </p>

         <p>
            <button class="btn btn-primary btn-large btn-block"  type="submit" title="Update Profile">Update</button>
         </p>	
		 </form>
 	</fieldset>
</div><!-- end of registration div -->

<div id="prof-info" >
			<form action="updateCareer" method="post">
			<div id="graduate">
				<h5 class="alert alert-success">&nbsp;Graduate From.</h5>
				<HR id="line">
				&nbsp;<i class="icon icon-book"></i>&nbsp;&nbsp;<input type="text" name="udegree" class="input-medium span" placeholder="Degree" />
				&nbsp;<i class="icon icon-random"></i>&nbsp;&nbsp;<input type="text" name="ucollegeName" class="input-medium" placeholder="College Name" Maxlength="33"/>
				&nbsp;<i class="icon icon-map-marker"></i>&nbsp;&nbsp;<input type="text" name="ulocation" class="input-medium" placeholder="Location"/>
			</div>

			<div id="working">
				<h5 class="alert alert-success">&nbsp;Working at.</h5>
				<HR id="line">
				&nbsp;<i class="icon icon-briefcase"></i>&nbsp;&nbsp;<input type="text" name="ucompany" class="input-medium span" placeholder="Company" />
				&nbsp;&nbsp;<i class="icon icon-lock"></i>&nbsp;&nbsp;&nbsp;<input type="text" name="udesgination" class="input-medium" placeholder="Desgination"/>
					
			</div>

			<div id="present">
				<h5 class="alert alert-success">&nbsp;Current Location.</h5>
				<HR id="line">
				&nbsp;<i class="icon icon-map-marker"></i>&nbsp; <TEXTAREA NAME="ucurrentAddress" ROWS="3" class="span2" placeholder="Current Address"></TEXTAREA>
				&nbsp;&nbsp;<i class="icon icon-"></i>&nbsp;&nbsp;&nbsp;<input type="text" name="ucurrentState" id="Edstates" class="input-medium" placeholder="State" autocomplete="off"/>
			</div>
		
            <button class="btn btn-large btn-info" type="submit" id="add" title="Update Careers">&nbsp;Update&nbsp;</button>
       </form>
	</div>


</div><!-- End of main container -->
<a class="scrolltotop" href="#Section-1"><span>up</span></a>

	
	<script src="./js/jquery-1.8.3.min.js" type="text/javascript"></script>
    <script src="./js/bootstrap.min.js"></script> 
	<script src="./js/touchTouch/assets/touchTouch/touchTouch.jquery.js"></script>
	<script src="./js/holder.js"></script>
	<script src="./js/script.js"></script>

	<script src="js/jquery.nicescroll.min.js" type="text/javascript"></script>
	<script src="js/jquery.localscroll-1.2.7-min.js" type="text/javascript"></script> 
	<script src="js/jquery.parallax-1.1.3.js" type="text/javascript"></script>
	 <script src="js/jquery.scrollTo-1.4.6-min.js" type="text/javascript"></script>
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

<script>	 // typeahead for states field. 
		$('#Edstates').typeahead({
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
