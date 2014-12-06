package com.college.memories.book.others;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Properties;
import java.util.Date;
import java.util.Random;
import java.util.Scanner;
import java.util.Set;

import javax.servlet.http.HttpServlet;
import javax.swing.plaf.basic.BasicScrollPaneUI.HSBChangeListener;

import com.college.memories.book.dto.DisplayPostsBeans;
import com.college.memories.book.dto.CollegeBookCommonsBeans;
import com.college.memories.book.services.CollegebookCommons;

class person
{
	String Name;
	String UserNAme;
	double Mobileno;
	public person(String Name,String UserName) 
	{
		this.Name=Name;
		this.UserNAme=UserName;
	}
	public person(String Name,String UserName,double Mobileno) 
	{
		this.Name=Name;
		this.UserNAme=UserName;
		this.Mobileno=Mobileno;
		
	}
}

public class demo extends HttpServlet 
{
//	static void test()
//	{
//		Connection con=null;
//		PreparedStatement stm=null;
//		String query="insert into collegebook.userdetails(Username,Password,Mobileno,Email,AccCreatedDate,AccCreatedTime,AccCreatedSystem_IP) values(?,?,?,?,?,?,?)";
//		try 
//		{
//			Class.forName("com.mysql.jdbc.Driver");
//			con=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
//			System.out.println("connected..");
//			stm=con.prepareStatement(query);
//			
//			String usename="hskjhskjhdkshds";
//			String password="navi";
//			double mobileno=123456789;
//			String email="NAnaa";
//			
//			 Date sysdatetime = new Date();
//			 SimpleDateFormat stf =  new SimpleDateFormat("HH:mm:ss");		//Make simple time Format according to Sql Format.
//			 SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");		//Make simple date Format according to Sql Format.
//			 String time = stf.format(sysdatetime); 		//Pass the Date& Time object in Your Format.
//			 String date= sdf.format(sysdatetime);
//			 String System_ip_address=Inet4Address.getLocalHost().getHostAddress(); //Get profile completed system IP Address.
//			
//			stm.setString(1, usename);
//			stm.setString(2, password);
//			stm.setDouble(3, mobileno);
//			stm.setString(4, email);
//			stm.setString(5, date);
//			stm.setString(6, time);
//			stm.setString(7, System_ip_address);
//			int re= stm.executeUpdate();
//			System.out.println(re);
//		} 
//		catch (ClassNotFoundException e) 
//		{
//				System.out.println(e.getMessage());
//
//		} catch (SQLException e) 
//		{
//			System.out.println(e.getMessage());
//		} catch (UnknownHostException e) 
//		{
//			System.out.println(e.getMessage());
//		}
//	}
	
//	static void test()
//	{
//		Connection con=null;
//		PreparedStatement stm=null;
//		String query="update collegebook.userdetails set Gender=?,DOB=?,Address=?,City=?,State=?,Marital=?,Name=?,ProfileCompletedDate=?,ProfileCompletedTime=?,ProfileCompletedSystem_IP=? where Username=?";
//		
//		try 
//		{
//			Class.forName("com.mysql.jdbc.Driver");
//			con=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
//			System.out.println("connected..");
//			stm=con.prepareStatement(query);
//			
//			String gender="male";  
//			 String address="sdsds";
//			 String city="sdsds";
//			 String state="sdsds";
//			 String marital="sdsds";
//			 String dob="sdsds";
//			 String name="sdsds";
//			 
//			 String sesusername="NAVANEE";//Get the session object through bean
//			 
//			 Date sysdatetime = new java.util.Date();
//			 SimpleDateFormat stf =  new SimpleDateFormat("HH:mm:ss");		//Make simple time Format according to Sql Format.
//			 SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");		//Make simple date Format according to Sql Format.
//			 String time = stf.format(sysdatetime); 		//Pass the Date& Time object in Your Format.
//			 String date= sdf.format(sysdatetime);
//			 String System_ip_address=Inet4Address.getLocalHost().getHostAddress(); //Get profile completed system IP Address.
//			
//			stm.setString(1, gender);
//			stm.setString(2, address);
//			stm.setString(3, city);
//			stm.setString(4, state);
//			stm.setString(5, marital);
//			stm.setString(6, dob);
//			stm.setString(7, name);
//			stm.setString(8, date);
//			stm.setString(9, time);
//			stm.setString(10, System_ip_address);
//			stm.setString(11, sesusername);
//
//			int re= stm.executeUpdate();
//			System.out.println(re);
//		} 
//		catch (ClassNotFoundException e) 
//		{
//				System.out.println(e.getMessage());
//
//		} catch (SQLException e) 
//		{
//			System.out.println(e.getMessage());
//		} catch (UnknownHostException e) 
//		{
//			System.out.println(e.getMessage());
//		}
//	}
//	
//	public static void main(String[] args) 
//	{
//		test();
//	}
//	
//	
	
//	static void test()
//	{
//		Connection con=null;
//		Statement stm=null;
//		String Name="navaneet";
//		Scanner sc= new Scanner(System.in);
//		String Name2= sc.next();
//	//	Name=Name.toUpperCase();
//		char fristChar=Name.charAt(0);
//	
//		Name2=Name2.substring(0,2);
//		System.out.println("Sub string "+ Name2);
//		
//		String query="select *from collegebook.userdetails where Name like '"+Name2+"%'";
//		
//		try 
//		{
//			Class.forName("com.mysql.jdbc.Driver");
//			con=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
//			System.out.println("connected..");
//			stm=con.createStatement();
//			ResultSet res= stm.executeQuery(query);
//		
//			if(res.isBeforeFirst())  // New Method working perfect.
//			{
//				while(res.next())
//				{
//					System.out.println("UserName:"+res.getString(1) +" "+ "Name:"+ res.getString("Name"));
//				}
//			}
//			else
//			{
//				System.out.println("Sorry.....Not");
//			}
//			
//		} 
//		catch (ClassNotFoundException e) 
//		{
//				System.out.println(e.getMessage());
//
//		} catch (SQLException e) 
//		{
//			System.out.println(e.getMessage());
//		} 
//	}
//	
//	public static void main(String[] args) 
//	{
//		test();
//		System.exit(0);
////		String Name="ASHWRIAYA SAKUJA";
////		Name=Name.substring(0,2);
////		System.out.println(Name);
//	}
	
//	static void test()
//	{
//		Connection con=null;
//		Statement stm=null;
//		Scanner sc= new Scanner(System.in);
//		String Name2= sc.next();
//	//	Name=Name.toUpperCase();
//	//	char fristChar=Name.charAt(0);
//	
//		Name2=Name2.substring(0,2);
//		System.out.println("Sub string "+ Name2);
//		
//	//	ArrayList<String> lst=new ArrayList<>();
//	//	HashSet<demobeans> lst= new HashSet<demobeans>();
//		HashMap<String,demobeans > ml= new HashMap<>();
//		//String query="select *from collegebook.userdetails where Name like '"+Name2+"%'";
//		String query="select *from collegebook.userdetails";
//		try 
//		{
//			Class.forName("com.mysql.jdbc.Driver");
//			con=DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
//			System.out.println("connected..");
//			stm=con.createStatement();
//			ResultSet res= stm.executeQuery(query);
//		
//			if(res.isBeforeFirst())  // New Method working perfect.
//			{
//				while(res.next())
//				{
//					String un=res.getString("Username");
//					String nm=res.getString("Name");
////					person p= new person(Name, Un);
////					person p1= new person(Name, Un,996446424);
//					//System.out.println("UserName:"+res.getString(1) +" "+ "Name:"+ res.getString("Name"));
//					demobeans be= new demobeans();
//					be.setFN(nm);
//					be.setUN(un);
//		//			lst.add(be);
//					ml.put(un, be);
//				//	lst.add(p1);
//				}
//			}
//			else
//			{
//				System.out.println("Sorry.....Not");
//			}
//			
//		} 
//		catch (ClassNotFoundException e) 
//		{
//				System.out.println(e.getMessage());
//
//		} catch (SQLException e) 
//		{
//			System.out.println(e.getMessage());
//		} 
//		
//		Collection<demobeans> allva=ml.values();
//		Random r=new Random(1);
//		int acc=r.nextInt();
//		System.out.println("Random "+ acc);
//		for (demobeans dem : allva) 
//		{
//			if(dem.getFN().equalsIgnoreCase("Navaneet"))
//			{
//				System.out.println("map found: "+dem.getFN());
//			}
//			else
//			{
//				System.out.println("Not found....");
//			}
//		//	System.out.println("map values: "+dem.getFN());
//		}	
////		System.out.println(ml.keySet());
////		System.out.println(ml.values());
//		
//		
//			
//	}
//	
	public static  void main(String[] args) 
	{
//		String date = (new java.util.Date()).toString();
//		Date d= new Date();
//		String dd=d.toString();
//		System.out.println(dd);
//		System.out.println(date);
	//	test();
//		System.exit(0);
//		String Name="ASHWRIAYA SAKUJA";
//		Name=Name.substring(0,2);
//		System.out.println(Name);
		
//		ArrayList<CollegeBookCommonsBeans> memberList=CollegebookCommons.totalMembers("select *from collegebook.userdetails");
//		Iterator<CollegeBookCommonsBeans> memList=memberList.iterator();
//		while(memList.hasNext())
//		{
//			CollegeBookCommonsBeans cl=(CollegeBookCommonsBeans)memList.next();
//		//	System.out.println(cl.getName() +" "+ cl.getUserName()+" "+cl.getAddress()+" "+ cl.getCity()+" "+ cl.getDob()+" "+cl.getEmailId()+" "+ cl.getGender()+" "+ cl.getMarital()+" "+ cl.getMobileNo()+" "+ cl.getState() );
//			System.out.println(cl.getName() +" "+ cl.getUserName());
//		}
	//	HashMap<Integer, DisplayPostsBeans> posts=CollegebookCommons.displayPosts("select *from collegebook.postsdb where Status=? order by id desc LIMIT 0,30"); //order by id desc LIMIT 0,30"
	//	HashMap<Integer, DisplayPostsBeans> posts=CollegebookCommons.displayPosts("select *from collegebook.postsdb where Status=''order by id desc LIMIT 0,30");
	//	Collection<DisplayPostsBeans> values=posts.values();
	//	Set<Integer> ke=posts.keySet();
		
//		ArrayList<DisplayPostsBeans> posts=CollegebookCommons.displayPosts("select *from collegebook.postsdb where Status=? order by id LIMIT 30,0");
//		for (Integer integer : ke) 
//		{
//			System.out.println(integer);
//		}
//		for (DisplayPostsBeans displayPostsBeans : values) 
//		{
//			if(displayPostsBeans.getPosts()!=null)
//			{
//				System.out.println(displayPostsBeans.getId() +" "+ displayPostsBeans.getName()+" POSTS: "+ displayPostsBeans.getPosts());
//			}
//		//	System.out.println(displayPostsBeans.getPosts());
//		}
		
		
//		java.util.ListIterator<DisplayPostsBeans> ls= posts.listIterator();
//		
//		while(ls.hasNext())
//		{
//			
//			DisplayPostsBeans ds=(DisplayPostsBeans)ls.next();
//			if(ds.getPosts()!=null)
//			{
//				///System.out.println(ds.getId()+" Name "+ ds.getName()+" Post: "+ ds.getPosts()+" Date: "+ds.getPostedDate() +"Time: "+ds.getPostedTime() );
//			}
//			
//		}
//		System.out.println("*********LIST PREVOIUS*********");
//		while(ls.hasPrevious())
//		{
//			DisplayPostsBeans ds=ls.previous();
//			System.out.println(ds.getId()+" Name "+ ds.getName()+" Post: "+ ds.getPosts()+" Date: "+ds.getPostedDate() +"Time: "+ds.getPostedTime() );
//		}
		
//		Random r= new Random();
//		int rr= r.nextInt(100000000);
//		System.out.println(rr);
//		
//		Integer i=rr;
//		String s=i.toString();
//		String s1=s.substring(0,3);
//		System.out.println(s1);
//		String s2=s.substring(3,s.length());
//		System.out.println(s2);
//		
//		String code=s1.concat("Navnaeet").concat(s2) ;
//		System.out.println(code);
//		
//		
//		
//		
//		String msg="Navaneet Badami";
//		System.out.println("Navaneet \nBadami");
//		String m="Hi NAvaneet, \nWelCome to CollegeBook, thanks for joining CollegeBook. \nPlease use this code for Account Verification: 736273626382dhshdhf \nThanks, \nCollegeBook Team.,";
//		System.out.println(m);
//		if(msg.equals("Navaneet Badami"))
//		{
//			System.out.println("Done");
//		}
//		else
//		{
//			System.out.println("fail.");
//		}
	//	System.out.println(msg);
		
		
		
//		for (DisplayPostsBeans displayPostsBeans : posts) 
//		{
//			System.out.println("Using for loop:"+displayPostsBeans.getName());
//		}
		
		
		
		
//			String dateString="06-10-2008";
//			
//			long dd=Long.parseLong(dateString);
//	//		Date d= Date.parse(dateString)
//			 Date sysdatetime = new Date();
//			 SimpleDateFormat stf =  new SimpleDateFormat("HH:mm:ss");		//Make simple time Format according to Sql Format.
//			 SimpleDateFormat sdf =  new SimpleDateFormat("yyyy-MM-dd");		//Make simple date Format according to Sql Format.
//			 String time = stf.format(sysdatetime); 		//Pass the Date& Time object in Your Format.
//			 String date= sdf.format(dd);
		
//		String commonQuery="select *from collegebook.userdetails"; //call the static totalMembers mtd() and get the ArrayList.
//		ArrayList<CollegeBookCommonsBeans> memberList=CollegebookCommons.totalMembers(commonQuery);  
//			Iterator<CollegeBookCommonsBeans> memList=memberList.iterator();
//				while(memList.hasNext())
//				{ 
//					CollegeBookCommonsBeans collegeBookCommonsBeans=(CollegeBookCommonsBeans)memList.next();
////					String memberUserName=collegeBookCommonsBeans.getUserName();
////					String memberName=collegeBookCommonsBeans.getName();
////					String memberImage=memberUserName+".jpg";	
////				
////					System.out.println(memberUserName +" UserName :"+ memberName);
//					if(collegeBookCommonsBeans.getUserName().equalsIgnoreCase("NAGESH"))
//					{
//						System.out.println("found :" + collegeBookCommonsBeans.getUserName());
//						break;
//					}
//						
//				}
//				
		//		HashMap<String, String> lst= new HashMap<>();
				
//				lst.put("n1", "navaneet");
//				lst.put("n2", "Navi2");
//				lst.put("n3","navi3");
//				
//				System.out.println(lst);
//				System.out.println(lst.get("n1"));
				
//				try{      
//					 String s[]=null;
//
//					Class.forName("com.mysql.jdbc.Driver"); 
//			        Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
//					Statement st=con.createStatement(); 
//					ResultSet rs = st.executeQuery("select * from collegebook.userdetails");
//					
//				    	List li = new ArrayList();
//				    
//						while(rs.next()) 
//			 			{ 			    
//			 			    li.add(rs.getString("Name"));
//			 			}  
//			
//						String[] str = new String[li.size()];			
//						Iterator it = li.iterator();
//						int i = 0;
//						while(it.hasNext())
//						{
//							String p = (String)it.next();
//					//		System.out.println(p);
//							str[i] = p;
//							i++;
//						}
//						for (String string : str) 
//						{
//	//						String json = new Gson().toJson(string);
//							System.out.println(string);
//						}
//						
//			 		rs.close(); 
//			 		st.close(); 
//					con.close();
					
//					Scanner sc= new Scanner(System.in);
//					System.out.println("Enter the DOB");
//					String DOB=sc.next();
//
//					SimpleDateFormat sdf = new SimpleDateFormat("dd/MMM/yyyy");
//				    Date ud = sdf.parse(DOB);
//				    java.sql.Date sd = new java.sql.Date(ud.getTime());
//				    System.out.println(sd);
//					
//			//		String qry="update collegebook.userdetails set DOB=? where Username=?";	
//				    String qry="select DOB from collegebook.userdetails where Username=?";
//					Class.forName("com.mysql.jdbc.Driver");
//					Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
//					PreparedStatement pstm=con.prepareStatement(qry);
//			//		pstm.setDate(1,sd);
//					pstm.setString(1,"VINAYAK");
//			//		int res=pstm.executeUpdate();
//			//		System.out.println(res +"updated");
//					ResultSet res= pstm.executeQuery();
//					while(res.next())
//					{
//						java.sql.Date sdd=res.getDate("DOB");
//						java.util.Date udd=(Date)sdd;
//						SimpleDateFormat sff= new SimpleDateFormat("dd-MM-yyyy");
//						String datest=sff.format(udd);
//						System.out.println(datest);
//					}
////
//				    } 
//					catch(Exception e){ 
//			 			e.printStackTrace(); 
//			 		}
		
	//	new demo().c();
		
		new demo().c();
	}
	
//	static ResultSet res;
//	
//	{
//		System.out.println("IIB block");
//	}
//	static
//	{
//		System.out.println("SSB");
//		Statement stmt=null;
//		Connection conn=null;
//		
//		String url="jdbc:mysql://localhost:3306";
//		String username="root";
//		String dbpassword="root";
//		String query="select * from collegebook.userdetails";
//		try 
//		{
//			Class.forName("com.mysql.jdbc.Driver");
//			conn=DriverManager.getConnection(url,username,dbpassword);
//		//	System.out.println("Executed...");
//			stmt=conn.createStatement();
//			res=stmt.executeQuery(query);
//	//		System.out.println("Connected.");
//		} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//	void disp()
//	{
//		ArrayList<demobeans> lst=new ArrayList<demobeans>();
////		HashMap<String,demobeans> lst=new HashMap<String, demobeans >();
//		demobeans b=new demobeans();
//		
//		String friname=null;
//		String friusername=null;
//		double frimobile=0;
//		long no= 111111111;
//		try {
//			ResultSetMetaData rs= res.getMetaData();
//			System.out.println(rs.getColumnCount());
//			String ip=Inet4Address.getLocalHost().getHostAddress();
//			System.out.println(ip);  // System IP address.
//			
//			while(res.next())
//			{
//				friname=res.getString("Name");
//				friusername=res.getString("Username");
//				frimobile=res.getDouble("Mobileno");
//				
//				b.setFN(friname);
//				b.setMO(frimobile);
//			//	System.out.println("Name: "+ friname);
//			
//				//lst.add(friname);
//				//lst.add(friusername);
//				
//				lst.add(b);
//			}
//			for (demobeans l :lst) 
//			{
//				System.out.println(l.getFN() +" "+ l.getMO());
//			}
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (UnknownHostException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//	public static void main(String[] args) 
//	{
//		new demo().disp();
//		String version = System.getProperty("java.version");
//		boolean flag=false;
//		long i=1234_53462_636l;  //only jdk 1.7
//		if(flag==true)
//		{
//			System.out.println("False");
//		}
//		else
//		{
//			System.out.println("True");
//		}
//		System.out.println(version);
//		
//		String ch="Navi";   // only in jdk 1.7
//		switch (ch) 
//		{
//		case "Navi": System.out.println("Navaneet");
//		break;
//		
//		case "Dj": System.out.println("Dj Navi");
//		break;
//
//		default:System.out.println("Invalid input");
//		break;
//		}
//		
//		String na="    Navi    ";
//		System.out.println(na.trim().toUpperCase());
//		
//		String nn="navaNeet";
//		String s=nn.substring(0,1);
//		s=s.toUpperCase();
//		String r=nn.substring(1);
//		String ss=s.concat(r);
//		System.out.println(ss);
//
//		
//	}
	
	
	void c()
	{
		try 
		{
			Class.forName("com.mysql.jdbc.Driver");
			InputStream fin=getClass().getResourceAsStream("/com/college/memories/book/services/DBdetails.properties");
			Properties p= new Properties();
			p.load(fin );
	
			Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306",p);
			System.out.println("connec.....");
			
			Statement stm=con.createStatement();
			ResultSet re= stm.executeQuery("select *from collegebook.userdetails");
			while(re.next())
			{
				System.out.println(re.getString("username"));
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (FileNotFoundException e) 
		{
			System.out.println("file not found..");
			System.out.println(e.getMessage());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
	}
	
}

