<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" 
import="java.lang.*,java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.io.*,javax.servlet.RequestDispatcher.*,java.util.ArrayList"
import="com.college.memories.book.services.ConnectionProvider" 
import="com.college.memories.book.services.CollegebookCommons"
import="com.college.memories.book.dto.CollegeBookCommonsBeans"
import="com.college.memories.book.dao.LoginDao"
import="com.college.memories.book.dto.DisplayPostsBeans"
%>
 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />	
	<TITLE>CollegeBook</TITLE>
	<link rel="icon" href="img/Fevicon.ico">

	<!-- Set the viewport width to device width for mobile -->
  	<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/bootstrap.css" />
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" href="css/style.css"/> 
	<link rel="stylesheet" href="./css/bootstrap-extension.css" />

<style>
	#nnavbar{
		position:absolute; right: 0px;
	}
	#lodingIndicator{
		position:absolute; bottom: 50px; left:200px;
	}
	.dropdown{ 
		font-family: Helvetica, Arial, sans-serif; font-size: 12px; 
	}
	#postbox{
			position:absolute; 
			right: 140px; top: 210px; 
			position:fixed;
			height:140px;
			width:570px;			   
	}
	#postheader{
			position:absolute; top:60px; 
			position:fixed; width:410px; 
			left:70px;
			height:30px;
	}
	.scrolltotop {

	border: none;
	left: 2%;
	top: 80%;
	
	}
</style>
</head>


<body>
<%
	HttpSession ses=request.getSession(false);
	Connection conn=ConnectionProvider.getcon(); //Make the Connection using Services.

	String user = (String)ses.getAttribute("username");
	String iName=LoginDao.name4wholeApplication.get(user); //get the Static Name from LoginDao.
	String imgname=user+".jpg";

	if(user == null){
	response.sendRedirect("logout.jsp");
}				 
%>
	<!-- This is the overlay DIV that is displayed while loading a new page -->
<div id="loader">
		 <IMG SRC="img/495.GIF" WIDTH="128" HEIGHT="128" BORDER="0" ALT="" id="lodingIndicator"> 
</div>

<div class="container">

	<!-- Navigation bar on Top -->
<div class="navbar navbar-fixed-top "> 
		<div class="navbar-inner">
			<ul class="nav navbar-nav navbar-right">
				<li><h1 id="logo"><a href="inbox" title="HOME" class="tip"><IMG SRC="img/logo.jpg" width=130/></a></h1></li>
			</ul>
	<div id="nnavbar"  role="navigation"> <!-- elements on right side 08-Jan-14 -->
		<ul class="nav navbar-nav navbar-right ">
			<li><a href="messageBox-Display.jsp" title="Your MessageBox" class="tip"><i class="icon icon-envelope"></i>&nbsp;Message Box</a></li>
			<li><a href="friendProfile?friendName=<%=iName%>&friendUserName=<%=user%>" title="Your Profile View" class="tip">Profile</a></li>
			<li><a href="userAlbum-Display.jsp" title="Album" class="tip">Album</a></li>
			<li><a href="inbox" title="HOME" class="tip"><img src="../CollegeBook/img/upload/<%=imgname%>" height="20" width="25"/>&nbsp;<%=iName%>&nbsp;</a></li>

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
			</ul><!-- End of navbar-right -->	
		</div>
	</div><!--End of Navbar inner -->
</div><!--End of fixed top Navigation Bar -->
		
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

		<h3 class="alert alert-info" id="postheader" align="center">Recent Posts</h3>
			<!-- Post Div --><!-- 24-Jan-14 -->
				<div id="postbox">
					<h4 class=" alert alert-info" align="center">Share your Thoughts</h4>
					<FORM METHOD=POST ACTION="posts">
						<textarea rows="5" name="userPost" class="span6" placeholder="Please Share, what are you thinking right now..!" ></textarea>
						<button type="submit" class="btn btn-block btn-primary tip" title="Post your thoughts.">Share</button>
					</form>
				</div><!-- End of POst div -->
						
				

		
		<!-- This is the main container (#scroll-container) -->
		<div id="scroll-container" class="row">
			<div class="content">
				<%
			//		String postsQuery="select * FROM collegebook.postsdb where date between CURDATE() - interval 60 day AND CURDATE() AND Status=?";
					String postsQuery="SELECT *FROM collegebook.postsdb where status=? ORDER BY id DESC LIMIT 0,15";//get the posts from starting point is 0 and get 15 posts.
					ArrayList<DisplayPostsBeans> po=CollegebookCommons.displayPosts(postsQuery); // Call the diplaypost(), get the arraylist.
					ListIterator<DisplayPostsBeans> ls= po.listIterator();    //iterator the list.
					while(ls.hasNext())                                         
					{	
			//			ls.next();     //Forward Direction.
			//		}
			//		while(ls.hasPrevious())    // Backward Direction possible only when we perform hasNext()first.
			//		{
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
				
				 <div id="nmedia">
					<div class="media"><!-- Media Div  14-Feb-14-->
						<a class="pull-left" href="friendProfile?friendName=<%=name%>&friendUserName=<%=userName%>"><img class="media-object tip" alt="No Photo" src="../CollegeBook/img/upload/<%=userImage%>"  title="<%=name%>" width="35"/>
						</a>
 
						<div class="media-body">
													<!-- This is a normal post without shared -->
							<%
							if(sharedFromfname==null)
							{%>
								<h5 class="media-heading">
								<a href="friendProfile?friendName=<%=name%>&friendUserName=<%=userName%>"><%=name%></a>
								<ntxt2 title="User Name">&nbsp;&nbsp;(&nbsp;<%=userName%>&nbsp;)</ntxt2></h5>	
								<p><%=posts%></p>
							<%}
							else			
							{%>
											<!-- This is a shared post  -->
							<h5 class="media-heading"><a href="friendProfile?friendName=<%=name%>&friendUserName=<%=userName%>"><%=name%></a>&nbsp;<ntxt>Shared&nbsp;
							<%=sharedFromfname%>'s post</ntxt></h5>

								<div id="shared_media"><!-- Nested Media 14-Feb-14 -->
									<div class="media">
										<a class="pull-left" href="#">
											<img class="media-object tip" title="<%=sharedFromfname%>" SRC="../CollegeBook/img/upload/<%=sharedFromfimage%>" WIDTH="35" alt="No Photo">
										</a>
										<div class="media-body">
											<h6 class="media-heading">
											<a href="friendProfile?friendName=<%=sharedFromfname%>&friendUserName=<%=sharedFromfusername%>">
											<%=sharedFromfname%></a>
											<ntxt2 title="User Name">&nbsp;&nbsp;(&nbsp;<%=sharedFromfusername%>&nbsp;)</ntxt2></h5></h6>
											<p><%=posts%></p>
										</div>
									</div>
								</div><!-- End of Nested Media -->
								
								<%}%>
							
							<h6>
								<i class="icon icon-thumbs-up"></i><%=likeCount%>&nbsp;&nbsp;
								<a href="likeCount?id=<%=id%>&likedCounts=<%=likeCount%>&likedUser=<%=name%>"class="tip" title="Like this Post">Like</a>&nbsp.&nbsp;
								<a href="#<%=id%>" data-toggle="collapse"class="tip" title="Click To Comment" >Comment</a>&nbsp;.&nbsp;
								<a href="sharePost?id=<%=id%>"class="tip" title="Share this Post">Share&nbsp;</a>&nbsp;&nbsp;<ntxt><%=postedDate%>&nbsp;.&nbsp;<%=postedTime%>&nbsp;
								<i class="icon icon-globe"></i></ntxt>
							</h6>
								
							<div id="<%=id%>" class="accordion-body collapse">
								<div class="accordion-inner">
									<TEXTAREA NAME="" ROWS="" COLS=""></TEXTAREA>
								</div>
							</div>
						 </div><!-- End of media body -->
					</div><!-- End of Media Div  -->
				 </div><!-- End of nMedia Div 24-Jan-14 -->
					<%}   // End Of while.
					}  // End of Main If.
				%>
			</div>
		</div>
	</div>

	<!-- These are all the links that can be loaded. -->
	<div id="pages">
		<a href="postBox-Display.jsp"></a>
		<a href="postsPage1.jsp"></a>
		<a href="postsPage2.jsp"></a>
		<a href="postsPage3.jsp"></a>
		<a href="postsPage4.jsp"></a>
		<a href="postsPage5.jsp"></a>
		<a href="postsPage6.jsp"></a>
	</div>

	<a class="scrolltotop" href="#"><IMG SRC="img/176.GIF" WIDTH="32" HEIGHT="32" ALT="up"><span>UP</span></a>

	<script src="./js/jquery-1.10.2.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
	<script src="./js/infinite.js"></script>
	<script src="js/jquery.nicescroll.min.js" type="text/javascript"></script>
	<script src="js/script.js"></script>
	<script src="js/jquery.scrollTo-1.4.6-min.js" type="text/javascript"></script>
	<script>						
			//scroll bar custome.
				jQuery(document).ready(
			  function() {  
				jQuery("html").niceScroll({cursorcolor:"#3366FF"});
			  }
			);
		</script>
</body>
</html>