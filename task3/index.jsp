<%@ page import="java.sql.*" %>
<html>
<head>
	<title>Feedback Management System </title>
	<style>
		* { font-size:30px; }
		body {background-color:#008dff;}
		h1 {font-size:40px;background-color:black; color:white; width:40%; border-radius:10px;}
		button {background-color:white; color:black ;font size:30px;border-radius: 8px; width:10%;}
	</style>
</head>
<body>

<center>
	<h1> Feedback Management System </h1>
   <form method="POST">
	<br>
	<button type ="button" > <a style="text-decoration:none;" href="admin.jsp"> Admin </a> </button>  
	<br><br>
	<button type ="button" > <a style="text-decoration:none;" href="student.jsp"> Student </a> </button> 
   </form>	
</center>

</body>
</html>
