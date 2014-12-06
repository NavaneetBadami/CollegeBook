package com.college.memories.book.dto;

public class DisplayPostsBeans 
{
	private int id;
	private String name;
	private String username;
	private String posts;
	private String sharedFromfusername;
	private String sharedFromfname;
	private String likedUser;
	private int likeCount;
	private String postedDate;
	private String postedTime;
	
	public String getPostedDate() {
		return postedDate;
	}
	public void setPostedDate(String postedDate) {
		this.postedDate = postedDate;
	}
	public String getPostedTime() {
		return postedTime;
	}
	public void setPostedTime(String postedTime) {
		this.postedTime = postedTime;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPosts() {
		return posts;
	}
	public void setPosts(String posts) {
		this.posts = posts;
	}
	public String getSharedFromfusername() {
		return sharedFromfusername;
	}
	public void setSharedFromfusername(String sharedFromfusername) {
		this.sharedFromfusername = sharedFromfusername;
	}
	public String getSharedFromfname() {
		return sharedFromfname;
	}
	public void setSharedFromfname(String sharedFromfname) {
		this.sharedFromfname = sharedFromfname;
	}
	public String getLikedUser() {
		return likedUser;
	}
	public void setLikedUser(String likedUser) {
		this.likedUser = likedUser;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	
}
