<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page - Tech Blog</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Bootstrap Icon -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link  href="./css.css" rel="stylesheet" type="text/css"/>

<style>
.banner-background{

clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 65% 100%, 30% 91%, 0 100%, 0 0);
}


</style>
</head>
<body>

<!-- Navbar -->
<%@include file="normal_navbar.jsp"%>
<main class="d-flex align-item-center primary-background banner-background pb-5" >
<div class="container mt-5">
<div class="row ">
<div class="col-md-4 offset-md-4 mb-5">
<div class="card">
<div class="card-header text-center text-white primary-background">
<i class="bi bi-person-plus-fill display-6"></i>
<p>Login Here</p>
</div>
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
<div class="card-body">
<form action="LoginServlet" method="post">
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" name="email" required class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    <div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  </div>
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" name="password" required class="form-control" id="exampleInputPassword1">
  </div>
 <div class="container text-center">
  <button type="submit" class="btn btn-primary ">Submit</button>
  </div>
</form>
</div>

</div>
</div>
</div>
</div>
</main>



<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>