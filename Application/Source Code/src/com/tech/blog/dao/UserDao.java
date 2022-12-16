package com.tech.blog.dao;
import java.sql.*;

import com.tech.blog.entities.User;
public class UserDao {
private Connection con;

public UserDao(Connection con) {
	super();
	this.con = con;
}
public boolean saveUser(User user) 
{
	boolean f=false;
	try
	{

		String query="insert into techblog.user(name,email,password,gender,about) "
				+ "values(?,?,?,?,?)";
		PreparedStatement pstmt = con.prepareStatement(query);
		pstmt.setString(1,user.getName() );
		pstmt.setString(2,user.getEmail());
		pstmt.setString(3, user.getPassword());
		pstmt.setString(4, user.getGender());
		pstmt.setString(5, user.getAbout());
		
		pstmt.executeUpdate();
		f=true;  
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return f;
}

public User getUserByEmailAndPassword(String email, String password)
{
	User user=null;
	
	try {
		String query="select * from techblog.user where email=? and password=?";
		PreparedStatement pstmt=con.prepareStatement(query);
		pstmt.setString(1, email);
		pstmt.setString(2, password);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			user=new User();
			
			user.setId(rs.getInt("id"));
			user.setName(rs.getString("name"));
			user.setEmail(rs.getString("email"));
			user.setPassword(rs.getString("password"));
			user.setGender(rs.getString("gender"));
			user.setAbout(rs.getString("about"));
			user.setProfile(rs.getString("profile"));
			
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	return user;
}

public boolean updateUser(User user)
{
	boolean f=false;
	try {
		String query="update techblog.user set name=? , email=? , password=? , gender=? , about=? , profile=? where id=?";
		PreparedStatement p=con.prepareStatement(query);
		p.setString(1,user.getName());
		p.setString(2,user.getEmail());
		p.setString(3,user.getPassword());
		p.setString(4,user.getGender());
		p.setString(5,user.getAbout());
		p.setString(6,user.getProfile());
		p.setInt(7,user.getId());
		
		p.executeUpdate();
		f=true;
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	return f;
}


public User getUserByUserId(int userId)
{
	User user=null;
	
	try {
		String query="select * from techblog.user where id=?";
		PreparedStatement p=con.prepareStatement(query);
		p.setInt(1, userId);
		ResultSet rs=p.executeQuery();
		if(rs.next())
		{
			user=new User();
			
			user.setId(rs.getInt(1));
			user.setName(rs.getString(2));
			user.setEmail(rs.getString(3));
			user.setPassword(rs.getString(4));
			user.setGender(rs.getString(5));
			user.setAbout(rs.getString(6));
			user.setRdate(rs.getTimestamp(7));
			user.setProfile(rs.getString(8));
			
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	
	return user;
}

}
