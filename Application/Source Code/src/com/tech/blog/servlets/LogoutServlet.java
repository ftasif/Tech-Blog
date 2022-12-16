package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.entities.Message;

public class LogoutServlet  extends HttpServlet{
	protected void service(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException
	{
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		
		HttpSession session = req.getSession();
		
		session.removeAttribute("currentUser");
		
		Message msg = new Message("Logout Successfully","success","alert-success");
		session.setAttribute("msg",msg);
		resp.sendRedirect("login_page.jsp");
		
		
}
}