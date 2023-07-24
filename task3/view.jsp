<%@ page import="java.sql.*" %>
<html>
<head>
	<title>Feedback Management System </title>
	<style>
		*{ font-size:30px; }
		body{background-color:#008dff;}
		h1{font-size:40px;background-color:black; color:white; width:40%; border-radius:10px;}
		.nav{ background-color:black; }
		.nav a {color:white; text-decoration:none; margin:10%; }
}
	</style>
</head>
<body>
<center>
	<h1> Admin Login </h1>
	<div class="nav">
	<a href="view.jsp"> View </a>
	<a href="delete.jsp"> Delete </a>
	<a href="index.jsp" onclick="return confirm('Do you want to exit?');";> Logout </a>
	</div>
	<form method="POST">
	<br>
	<table border="5" style="width=80%">
		<tr>
		<th> Name </th>
		<th> E-Mail </th>
		<th> Feedback </th>
		<th> Rating </th>
		</tr>
	</form>	
	<%
		try
		{
		  DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		  String url = "jdbc:mysql://localhost:3306/fb_20july23";
		  Connection con = DriverManager.getConnection(url,"root","abc123");

		  String sql="select * from student";
		  PreparedStatement pst = con.prepareStatement(sql);
		  ResultSet rs = pst.executeQuery();

		  while(rs.next())
		  {
		  %>
			<tr style="text-align:center;">
			<td> <%= rs.getString(1) %> </td>
			<td> <%= rs.getString(2) %> </td>
			<td> <%= rs.getString(3) %> </td>
			<td> <%= rs.getString(4) %> </td>
		  <%
		}
			con.close();
		}
		catch(SQLException e)
		{
			%>
			<script>
				let erAlert= "Issue: " + "<%= e %>";
				alert(erAlert); 
			</script>
			<%
		}
	%>
	</table>
</center>
</body>
</html>