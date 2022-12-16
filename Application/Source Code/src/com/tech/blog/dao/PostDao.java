package com.tech.blog.dao;
import com.tech.blog.helper.*;

import java.util.ArrayList;
import java.util.*;
import java.sql.*;
import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}

	public ArrayList<Category> getAllCategories()

	{
		ArrayList<Category> list=new ArrayList<>();
		try {
			String query="select * from techblog.category";
			Statement p=con.createStatement();
			ResultSet rs=p.executeQuery(query);	
			
			while(rs.next())
			{
				int cid=rs.getInt("cid");
				String name=rs.getString("name");
				String desc=rs.getString("description");
				Category c=new Category(cid,name,desc);
				list.add(c);
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return list;
	}

public boolean savePost(Post post)
{
	boolean f=false;
	
	try {
		String query="insert into techblog.post (pTitle,pContent,pCode,pPic,catId,userId) values(?,?,?,?,?,?)";
		PreparedStatement p=con.prepareStatement(query);
		p.setString(1,post.getpTitle());
		p.setString(2,post.getpContent());
		p.setString(3,post.getpCode());
		p.setString(4,post.getpPic());
		
		p.setInt(5,post.getCatId());
		p.setInt(6,post.getUserId());
		p.executeUpdate();
		f=true;
	
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	return f;
}

public List<Post> getAllPost()
{
	
	List<Post> ll=new ArrayList<>();
	try {
		String query="select * from techblog.post order by pid desc";
		Statement p=con.createStatement();
		ResultSet rs=p.executeQuery(query);	
		
		while(rs.next())
		{
			
			int pid=rs.getInt(1);
			String pTitle=rs.getString(2);
			String pContent=rs.getString(3);
			String pCode=rs.getString(4);
			String pPic=rs.getString(5);
			Timestamp date=rs.getTimestamp(6);
			int catid=rs.getInt(7);
			int userid=rs.getInt(8);
			Post pp=new Post(pid,pTitle,pContent,pCode,pPic,date,catid,userid);
			
			ll.add(pp);
		}
		
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	
	return ll;
}

public List<Post> getAllPostByCatId(int catId)
{
	List<Post> ll=new ArrayList<>();
	try {
		String query="select * from techblog.post where catId=?";
		PreparedStatement p=con.prepareStatement(query);
		p.setInt(1, catId);
		ResultSet rs=p.executeQuery();	
		
		while(rs.next())
		{
			
			int pid=rs.getInt("pid");
			String pTitle=rs.getString("pTitle");
			String pContent=rs.getString("pContent");
			String pCode=rs.getString("pCode");
			String pPic=rs.getString("pPic");
			Timestamp date=rs.getTimestamp("pDate");
			
			int userid=rs.getInt("userId");
			Post pp=new Post(pid,pTitle,pContent,pCode,pPic,date,catId,userid);
			
			ll.add(pp);
		}
		
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	
	return ll;
}

public Post getPostBtPostId(int postId)
{
	Post post=new Post();
	
	try {
		String query="select * from techblog.post where pid=?";
		PreparedStatement p=con.prepareStatement(query);
		p.setInt(1, postId);
		ResultSet rs=p.executeQuery();
		
		if(rs.next())
		{
			int pid=rs.getInt("pid");
			String pTitle=rs.getString("pTitle");
			String pContent=rs.getString("pContent");
			String pCode=rs.getString("pCode");
			String pPic=rs.getString("pPic");
			Timestamp date=rs.getTimestamp("pDate");
			int catId=rs.getInt("catId");
			int userid=rs.getInt("userId");
			post=new Post(pid,pTitle,pContent,pCode,pPic,date,catId,userid);
			
		}
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	
	return post;
	
	
}

}
