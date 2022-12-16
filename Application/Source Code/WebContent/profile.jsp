<%@page import="com.tech.blog.entities.*" %>
<%@page import="com.tech.blog.dao.*" %>
<%@page import="com.tech.blog.helper.*" %>
<%@page import="com.tech.blog.servlets.*" %>
<%@page import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
User user=(User)session.getAttribute("currentUser");
if(user==null)
{
	response.sendRedirect("login_page.jsp");
}

%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome <%=user.getName() %></title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link  href="css.css" rel="stylesheet" type="text/css"/>



</head>
<body>
<!-- Navbar -->

<nav class="navbar navbar-expand-lg navbar-dark bg-dark primary-background text-white">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp"><i class="bi bi-asterisk"></i>Tech Blog</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#"><span class="fa fa-bell-o"></span>Asif Raza</a>
        </li>
       
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
          <span class="fa fa-check-square-o"></span>
            Categories
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="#">Java</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Servlet</a></li>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="#">Jsp</a></li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">Contact</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#do-post-modal">Do Post</a>
        </li>
        
      </ul>
     
     <ul class="navbar-nav me-right">
     
      <li class="nav-item">
          <a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal"><i class="bi bi-person-circle "></i><%=user.getName() %></a>
        </li>
           <li class="nav-item">
          <a class="nav-link" href="LogoutServlet"><i class="bi bi-person-circle "></i>Log Out</a>
        </li>
        
     </ul>
     
    </div>
  </div>
</nav>


<!-- End Navbar -->

<!-- Sweet Alert for success of Post done -->
<%

Message msg=(Message)session.getAttribute("m");
if(msg!=null)
{
	
		%>
		<div class="alert <%=msg.getCssClass() %>" role="alert">
	  <%=msg.getContent() %>
	</div>
		<%
		session.removeAttribute("m");
	
}
%>
<!-- End of success post -->


<%@page import="com.tech.blog.entities.*" %>
<%
Message m=(Message)session.getAttribute("msg");
if(m!=null)
{
	%>
	<div class="alert <%=m.getCssClass() %>" role="alert">
  <%=m.getContent() %>
</div>
	<%
	session.removeAttribute("msg");
}
%>


<!-- Main Body of profile page -->
<main>
<div class="container">
<div class="row mt-4">
<!-- Categories -->
<div class="col-md-4">

<div class="list-group">
  <a href="#" class="list-group-item list-group-item-action active" aria-current="true">
    All Posts
  </a>
  <%
  PostDao pp=new PostDao(ConnectionProvider.getConnection());
  ArrayList<Category>ls=pp.getAllCategories();
  for(Category cc:ls)
  {
	  %>
	  <a href="#" class="list-group-item list-group-item-action"><%=cc.getName() %></a>
	  <% 
  }
  %>
 
</div>
</div>

<!-- Content/posts -->

<div class="col-md-8">
<div class="container">
<%@include file="load_post.jsp" %>
</div>
</div>
</div>
</div>
</main>

<!-- Modal -->

<!-- Button trigger modal -->


	<!-- Modal -->
	<div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header primary-background text-white">
	        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div class="container text-center">
	        
	        <img src="image/<%=user.getProfile() %>" class="img-fluid" style="border-radius: 50%; max-width:150px;">
	        <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName() %></h5>
	       
	        <div id="profile-details">
		    <table class="table">
			   <tbody>
				   <tr>
			   	   <th scope="row">Id : </th>
				      <td><%=user.getId() %></td>
					    
				   </tr>
				   <tr>
				      <th scope="row">Email : </th>
				      <td><%=user.getEmail() %></td>
				   </tr>
					    <tr>
					      <th scope="row">Gender : </th>
					   	  <td><%=user.getGender() %></td>
					    </tr>
						<tr>
						      <th scope="row">Status : </th>
						   	  <td><%=user.getAbout() %></td>
					    </tr> 
				  
			  </tbody>
			</table>
	     </div>
	     <div id="profile-edit" style="display:none;">
	    <h3 class="mt-2">Please Edit Here</h3>
	   
	    <form action="editservlet" method="post" enctype="multipart/form-data">
	    
	    <table class="table">
	    
	    <tr>
	    <td>Id : </td>
	    <td> <%=user.getId() %></td>
	    </tr>
	    
	     <tr>
	    <td>Name : </td>
	    <td> <input type="text" class="form-control" name="user_name" value="<%= user.getName()  %>"></td>
	    </tr>
	    
	    <tr>
	    <td>Email : </td>
	    <td> <input type="email" class="form-control" name="user_email" value="<%= user.getEmail()  %>"></td>
	    </tr>
	    
	    <tr>
	    <td>Password : </td>
	    <td> <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()  %>"></td>
	    </tr>
	      
	    <tr>
	    <td>Gender : </td>
	    <td> <%=user.getGender() %></td>
	    </tr>
	    
	    <tr>
	    <td>About : </td>
	    <td> <textarea rows="5" cols="5" class="form-control" name="user_about"><%=user.getAbout() %></textarea></td>
	    </tr>
	    
	     <tr>
	    <td>Profile Pic : </td>
	    <td> <input type="file" class="form-control" name="image" >
	    </td>
	    </tr>
	    
	    </table>
	    <div class="container">
	    
	    <button type="submit" class="btn btn-outline-primary primary-background text-white">Save</button>
	    
	    </div>
	    
	    </form>
	    
	    
	     </div>
	        </div> 
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- End of Profile Model -->


<!-- Start Post Modal -->



	<!-- Modal -->
	<div class="modal fade" id="do-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Post Details</h5>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        
	        <form action="AddPostServlet" method="post" enctype="multipart/form-data">
	        <div class="form-group">
	        <select class="form-control" name="cid">
	        <option selected disabled>--- Select Categories ---</option>
	        
	        
	        <%
	        
	        PostDao post=new PostDao(ConnectionProvider.getConnection());
	        
	        ArrayList<Category> list=post.getAllCategories();
	        
	        
	        for(Category c:list)
	        {
	        %>
	        
	        <option value="<%=c.getCid() %>"><%=c.getName() %></option>
	     
	        <%
	        
	        }
	        
	        %>
	        </select>	
	        </div>
	        <div class="form-group mt-3">
	        <input name="pTitle" type="text" placeholder="Enter post title" class="form-control">
	        </div>
	        <div class="form-group mt-3">
	        <textarea name="pContent" rows="5" cols="5" placeholder="Enter content here" class="form-control"></textarea>
	        
	        </div>
	        <div class="form-group mt-3">
	        <textarea name="pCode" rows="5" cols="5" placeholder="Enter your program here if any" class="form-control"></textarea>
	        
	        </div>
	        <div class="form-group mt-3">
	        <label>Select Your Picture </label>
	        <br>
	        <input name="pic" type="file" class="form-control mt-3 mb-3" >
	        </div>
	        <div class="container text-center">
	        <button type="submit" class="btn btn-primary">Post</button>
	        
	        </div>
	        </form>
	      </div>
	     
	    </div>
	  </div>
	</div>


<!--End of Post Modal  -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>

$(document).ready(function () {
	
	
	let editStatus=false;
	
	$('#edit-profile-button').click(function(){
		
		if(editStatus==false)
		{
		/* alert("button clicked") */
		$("#profile-details").hide()
		
		$("#profile-edit").show();
		editStatus=true;	
		$(this).text("Back")
		}
		else
			{
			$("#profile-details").show()
			
			$("#profile-edit").hide();
			editStatus=false;
			$(this).text("Edit")
			}
	}) 
});

</script>





</body>
</html>