package com.tech.blog.dao;

import java.sql.*;

public class LikeDao {

	Connection con;
	
	public LikeDao(Connection con) {
		super();
		this.con = con;
	}

	
	public boolean insertLike(int pid , int uid)
	{
		boolean f=false;
		try
		{
			String query="insert into techblog.liked (pid,uid) values(?,?)";
			
			PreparedStatement p=this.con.prepareStatement(query);
			p.setInt(1, pid);
			p.setInt(2, uid);
			
			p.executeUpdate();
			f=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	public  int countLikeOnPost(int pid)
	{
		int count=0;
		try {
		String query="select count(*) from techblog.liked where pid=?";
		PreparedStatement p=this.con.prepareStatement(query);
		p.setInt(1,pid);
		
		ResultSet rs=p.executeQuery();
		
		if(rs.next())
		{
			count=rs.getInt("count(*)");
		}
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	return count;	
	}
	
	
	public boolean isLikedByUser(int pid , int uid)
	{
		boolean f=false;
		try
		{
			String query="select * from techblog.liked where pid=? and uid=?";
			PreparedStatement p=this.con.prepareStatement(query);
			p.setInt(1,pid);
			p.setInt(1,uid);
			ResultSet rs=p.executeQuery();
			
			if(rs.next())
			{
				f=true;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
		
		return f;
	}
	
	
	public boolean deleteLike(int pid , int uid)
	{
		boolean f=false;
		try
		{
			String query="delete from techblog.liked where pid=? and uid=?";
			
			PreparedStatement p=this.con.prepareStatement(query);
			p.setInt(1, pid);
			p.setInt(2, uid);
			
			p.executeUpdate();
			f=true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return f;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
