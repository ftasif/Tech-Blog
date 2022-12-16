package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LikeServlet extends HttpServlet{
	protected void service(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException
	{
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		String operation=req.getParameter("operation");
		int uid=Integer.parseInt(req.getParameter("uid"));
		int pid=Integer.parseInt(req.getParameter("pid"));
		
		out.println("data form server");
		out.println(operation);
		out.println(uid);
		out.println(pid);
		
}
}