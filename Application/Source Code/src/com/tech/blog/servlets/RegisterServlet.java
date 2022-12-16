package com.tech.blog.servlets;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import com.tech.blog.dao.*;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

public class RegisterServlet extends HttpServlet{
protected void service(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException
{
	
	PrintWriter out=resp.getWriter();
	resp.setContentType("text/html");
	String check=req.getParameter("check");
	
	if(check==null)
	{
		out.println("<h2>box not checked</h2>");
	}
	else
	{
		String name=req.getParameter("user_name");
		String email=req.getParameter("user_email");
		String password=req.getParameter("user_password");
		String gender=req.getParameter("gender");
		String about=req.getParameter("about");
		
		User user =new User(name,email,password,gender,about);
		
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		if(dao.saveUser(user))
		{
			out.println("<h2>Data Entered</h2>");
		}
		else
		{
			out.println("<h1>error</h1>");
		}
		
	}
	
	
}
}
