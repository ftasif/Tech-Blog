<%@page import="com.tech.blog.helper.*" %>
<%@page import="com.tech.blog.entities.*" %>
<%@page import="com.tech.blog.dao.*" %>
<%@page import="java.util.*" %>

<div class="row">
<% 
PostDao d=new PostDao(ConnectionProvider.getConnection());
List<Post>lll=d.getAllPost();
for(Post p1:lll)
{
	
	%>
	<div class="col-md-6 mt-2">
	<div class="card">
	<img class="card-img-top" src="image/<%=p1.getpPic() %>" alt="Card image cap" >
	<div class="card-body">
	<b><%=p1.getpTitle() %></b>
	<p><%=p1.getpContent() %></p>
	<pre><%=p1.getpCode() %></pre>
	
	</div>
	<div class="card-footer primary-background text-white">
	<a href="#!" class="btn btn-outline-light btn-sm"><i class="bi bi-hand-thumbs-up"></i><span>20</span></a>
	<a href="#!" class="btn btn-outline-light btn-sm"><i class="bi bi-chat-left-text"></i><span>10</span></a>
	<a href="show_blog_page.jsp?pid=<%=p1.getPid() %>" class="btn btn-outline-light btn-sm">Read More</a>
	
	</div>
	</div>
	</div>
	
	<%
}

%>
</div>
