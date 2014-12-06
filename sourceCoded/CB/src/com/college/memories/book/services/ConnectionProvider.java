package com.college.memories.book.services;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import static com.college.memories.book.services.DBConstants.*;

public class ConnectionProvider    //singleton format.
{
	private static final ConnectionProvider only_one = new ConnectionProvider();
	private Connection con;
	static int count=0;
	
	private ConnectionProvider()
	{
		try 
		{
			Class.forName(DRIVER);
			Properties propContent=new ConnectionProviders().getDataBaseDetails();
			con= DriverManager.getConnection(URL,propContent);
			count= count+1;
			System.out.println("connection objects: " + count);
		}
		catch (ClassNotFoundException e) 
		{
			System.out.println("DRIVER NOT LOADED " + e.getMessage());
			e.printStackTrace();
		} 
		catch (SQLException e) 
		{
			System.out.println("CONNECTION NOT ESTABLISHED " + e.getMessage());
			e.printStackTrace();
		}
	}
	public static ConnectionProvider getObj()
	{
		return only_one;
	}
	public Connection getCon()
	{
		return con;
	}
	
	public Properties getDataBaseDetails()  // get properties file content.
	{
		InputStream fin=getClass().getResourceAsStream("/com/college/memories/book/services/DBdetails.properties"); //path of property file.
		Properties DbProp= new Properties();
		try 
		{
			DbProp.load(fin );
		}
		catch (IOException e) 
		{
			System.out.println(e.getMessage());
		}
		return DbProp;
	}
	public static void main(String[] args) 
	{
		getObj().getCon();
	}
}
