<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<link  href="css.css" rel="stylesheet" type="text/css"/>


</head>
<body>
<div class="container text-center">

<img  src="image/error.png" class="img-fluid">
<h3 class="display-3">Sorry ! Something went wrong.</h3>
<%= exception %>
<a href="index.jsp" class="btn btn-lg mt-3 primary-background text-white">Home</a>

</div>
</body>
</html>