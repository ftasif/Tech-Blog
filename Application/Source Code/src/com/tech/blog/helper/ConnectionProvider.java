package com.tech.blog.helper;
import java.sql.*;
public class ConnectionProvider {

	private static Connection con;
	public static Connection getConnection()
	{
		if(con==null)
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=admin");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return con;
	}
	
	public static Connection makeConn()
	{
		if(con==null)
		{
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306?user=root&password=admin");
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		return con;
	}
}
