package com.tech.blog.servlets;
import com.tech.blog.dao.*;
import com.tech.blog.entities.*;
import com.tech.blog.helper.ConnectionProvider;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginServlet extends HttpServlet{
	protected void service(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException
	{
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		String inputEmail=req.getParameter("email");
		String inputPassword=req.getParameter("password");
		
		
		
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
		
		User myData = dao.getUserByEmailAndPassword(inputEmail, inputPassword);
		
		if(myData==null)
		{
			Message msg = new Message("Email or Password Incorrect","error","alert-danger");
			HttpSession session = req.getSession();
			session.setAttribute("msg",msg);
			resp.sendRedirect("login_page.jsp");
		}
		else
		{
			HttpSession session = req.getSession();
			session.setAttribute("currentUser", myData);
			resp.sendRedirect("profile.jsp");
				}
	}
}
