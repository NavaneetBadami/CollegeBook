<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@ page language="java" 
import="java.lang.*,java.util.*,java.io.*,java.sql.*,java.sql.Statement,java.io.*,javax.servlet.RequestDispatcher.*,java.util.ArrayList"
import="com.college.memories.book.services.ConnectionProvider" 
import="com.college.memories.book.services.CollegebookCommons"
import="com.college.memories.book.dto.CollegeBookCommonsBeans"
import="com.college.memories.book.dto.DisplayPostsBeans"

%>
<div class="content">
	
	<%
					String postsQuery="SELECT *FROM collegebook.postsdb where status=? ORDER BY id DESC LIMIT 30,15"; //get the posts from starting point is 30 and get 15 posts.
					ArrayList<DisplayPostsBeans> po=CollegebookCommons.displayPosts(postsQuery); 
					ListIterator<DisplayPostsBeans> ls= po.listIterator();   
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