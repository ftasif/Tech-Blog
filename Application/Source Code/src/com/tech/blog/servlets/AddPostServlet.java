package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.*;
import com.tech.blog.entities.*;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
@MultipartConfig
public class AddPostServlet extends HttpServlet{
	protected void service(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException
	{
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
		int cid=Integer.parseInt(req.getParameter("cid"));
		String pTitle=req.getParameter("pTitle");
		String pContent=req.getParameter("pContent");
		String pCode=req.getParameter("pCode");
		Part part=req.getPart("pic");
		
		String pp=part.getSubmittedFileName();
		
		out.println("<h1>"+pTitle+" cid = "+cid+"</h1>");
		out.println("<h1>"+pContent+"</h1>");
		out.println("<h1>"+pCode+"</h1>");
		out.println("<h1>"+pp+"</h1>");
		
		HttpSession session = req.getSession();
		User user = (User)session.getAttribute("currentUser");
		
		Post post=new Post(pTitle,pContent,pCode,pp,null,cid,user.getId());
		PostDao pd=new PostDao(ConnectionProvider.getConnection());
		if(pd.savePost(post))
		{
			
			Message m=new Message("Done","success","alert-success");
			session.setAttribute("m", m);
			
			resp.sendRedirect("profile.jsp");
			out.println("<h1>done</h1>");
		}
		else
		{
			out.println("<h1>not done</h1>");
		}
		
	}
}
