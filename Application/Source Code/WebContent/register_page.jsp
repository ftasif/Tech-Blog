<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up - Tech Blog</title>
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
<main class="primary-background pt-5 banner-background" style="padding-bottom:80px;">
<div class="container ">
    <div class="row">
	<div class="col-md-4 offset-md-4 ">
	   <div class="card">
	<div class="card-header text-center primary-background">
	<i class="bi bi-person-plus-fill display-6"></i>
	<br>
	Register Here
	
</div>   
	<div class="card-body">
	
	<form action="RegisterServlet" method="post">
	
	<div class="mb-3">
    <label for="exampleInputName1" class="form-label">UserName</label>
    <input type="text" name="user_name" class="form-control" id="user_name" aria-describedby="nameHelp">
    <br>
	
  <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Email address</label>
    <input type="email" name="user_email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    
  </div>
  
  <div class="mb-3">
    <label for="exampleInputPassword1" class="form-label">Password</label>
    <input type="password" name="user_password" class="form-control" id="exampleInputPassword1">
  </div>
  
  <div class="mb-3 form-check">
    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div>
  
 <div class="form-group">
 <label for="gender">Select Gender</label>
 <br>
 <input type="radio"  id="gender" value="Male" name="gender"> Male
 
 <input type="radio"  id="gender" value="Female" name="gender"> Female 
 
 </div>
 <br>
 <div class="form-group">
 
 <textarea name="about" class="form-control" rows="5" palceholder="Enter Something about yourself">Enter Something about yourself</textarea>
 
 </div>
 
 
  <br>
  <button type="submit" class="btn btn-primary">Submit</button>
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