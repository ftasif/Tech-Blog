<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tech Blog - Asif Raza</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link  href="css.css" rel="stylesheet" type="text/css"/>

<style>
.banner-background{

clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 91%, 65% 100%, 30% 91%, 0 100%, 0 0);


}

</style>
</head>
<body>

<%@include file="normal_navbar.jsp" %>

<!-- banner -->
<div class="container-fluid ">
<div class="row justify-content-evenly primary-background pt-5 pb-3 text-white banner-background">
<div class="col-md-8 pb-5 ">

<h3 class="display-3 ">Welcome to TechBlog</h3>
<p>This is the place where user can Post tech articles.A very interactive Application to come and share your knowledge. Please do visit Tech Blog Application and give your Feedback. </p>
<p>User Posts and User details are saved in the database and user can fetch the post and user details and User can Update his Profile details. This Application consists many features like LogIn , SIgnUp , Share Post , View Profile , Edit Profile & Logout.</p>

<button type="button" class="btn primary-background btn-outline-light btn-lg"><i class="bi bi-box-arrow-up-right"></i> Start ! its Free</button>
<a href="login_page.jsp" class="btn primary-background btn-outline-light btn-lg"><i class="bi bi-person-circle "></i> Login</a>

</div>

</div>

</div>


<!-- Cards -->

<div class="container">
<div class="row pt-4">
<div class="col-md-4 pb-2">
<div class="card" >
  
  <div class="card-body">
    <h5 class="card-title text-center">Java Programming</h5>
    <p class="card-text">Java is a powerful general-purpose programming language. It is used to develop desktop and mobile applications, big data processing, embedded systems, and so on. According to Oracle, the company that owns Java, Java runs on 3 billion devices worldwide, which makes Java one of the most popular programming languages.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>

</div>

<div class="col-md-4 pb-2">
<div class="card" >
  
  <div class="card-body">
    <h5 class="card-title text-center">Python Programming</h5>
    <p class="card-text">Python is a popular general-purpose programming language. It is used in machine learning, web development, desktop applications, and many other fields. Fortunately for beginners, Python has a simple, easy-to-use syntax. This makes Python a great language to learn for beginners.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>


</div>

<div class="col-md-4 pb-2">
<div class="card" >
  
  <div class="card-body">
    <h5 class="card-title text-center">C Programming</h5>
    <p class="card-text">C is a powerful general-purpose programming language. It can be used to develop software like operating systems, databases, compilers, and so on. C programming is an excellent language to learn to program for beginners.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>


</div>

</div>

<div class="row ">
<div class="col-md-4 pb-2">
<div class="card" >
  
  <div class="card-body">
    <h5 class="card-title text-center">MYSQL</h5>
    <p class="card-text">MySQL tutorial provides basic and advanced concepts of MySQL. Our MySQL tutorial is designed for beginners and professionals.

MySQL is a relational database management system based on the Structured Query Language, which is the popular language for accessing and managing the records in the database.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>

</div>

<div class="col-md-4 pb-2">
<div class="card" >
  
  <div class="card-body">
    <h5 class="card-title text-center">JavaScript</h5>
    <p class="card-text">JavaScript is a lightweight, interpreted programming language. It is designed for creating network-centric applications. It is complimentary to and integrated with Java. JavaScript is very easy to implement because it is integrated with HTML. It is open and cross-platform.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>


</div>

<div class="col-md-4 pb-2">
<div class="card" >
  
  <div class="card-body">
    <h5 class="card-title text-center">ReactJs</h5>
    <p class="card-text">ReactJS tutorial provides basic and advanced concepts of ReactJS. Currently, ReactJS is one of the most popular JavaScript front-end libraries which has a strong foundation and a large community.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>


</div>

</div>

</div>

<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

</body>
</html>