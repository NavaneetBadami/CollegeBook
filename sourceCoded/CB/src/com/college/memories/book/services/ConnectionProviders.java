package com.college.memories.book.services;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

import static com.college.memories.book.services.DBConstants.*;

public class ConnectionProviders
{
    private static Connection con=null;
    
	public static Connection getcon() //static, only one time connection.
	{
		try 
		{
			Class.forName(DRIVER);
			Properties propContent=new ConnectionProviders().getDataBaseDetails();
			con=DriverManager.getConnection(URL,propContent);
			System.out.println("connected...");
		} 
		catch (ClassNotFoundException e) 
		{
			System.out.println(e.getMessage()+" "+ "CONNECTION DRIVER NOT LOADED..!");
		} 
		catch (SQLException e)
		{
			System.out.println(e.getMessage()+" "+ "DATABASE NOT CONNECTED..!");
		}	
		return con;
	}
	
	public Properties getDataBaseDetails()
	{
		InputStream fin=getClass().getResourceAsStream("/com/college/memories/book/services/DBdetails.properties");
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
}
