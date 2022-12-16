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

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@MultipartConfig
public class Edit extends HttpServlet {  
	protected void service(HttpServletRequest req,HttpServletResponse resp) throws ServletException,IOException
	{
		resp.setContentType("text/html");
		PrintWriter out = resp.getWriter();
		
	
		String userName=req.getParameter("user_name");
		String userEmail=req.getParameter("user_email");
		String userPassword=req.getParameter("user_password");
		String userAbout=req.getParameter("user_about");
		Part part=req.getPart("image");
		String imageName=part.getSubmittedFileName();
		
		HttpSession session =req.getSession();
		User user = (User)session.getAttribute("currentUser");
	
		user.setName(userName);
		user.setEmail(userEmail);
		user.setPassword(userPassword);
		user.setAbout(userAbout);
		String oldFile=user.getProfile();
		user.setProfile(imageName);
		
		UserDao dao=new UserDao(ConnectionProvider.getConnection());
	boolean b=dao.updateUser(user);
	if(b)
	{
	
		String path=req.getRealPath("/")+"pics"+File.separator+user.getProfile(); 
		
			Helper.deleteFile(path);
			if(Helper.saveFile(part.getInputStream(),path ))
			{
				out.println("<h1>Profile Updated</h1>");
				Message m = new Message("Profile details Updated Successfully !","success","alert-success");
				session.setAttribute("msg",m);
				
			}
			else
			{
				Message m = new Message("Something went Wrong !","error","alert-danger");
				session.setAttribute("msg",m);
			}
		
		
		}
		else
		{
			Message m = new Message("Something went Wrong !","error","alert-danger");
			session.setAttribute("msg",m);
		}
	resp.sendRedirect("profile.jsp");
	
	}

}
