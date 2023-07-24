<%@ page import="java.sql.*" %>
<html>
<head>
	<title>Feedback Management System </title>
	<style>
		* { font-size:25px; }
		body {background-color:#008dff;}
		h1 {font-size:40px;background-color:black; color:white; width:40%; border-radius:10px;}
		textarea {resize:none;}
	</style>
</head>
<body>
<center>
	<h1> Student's Feedback Form </h1>
    <form method="POST">
	<h2> Name </h2>
		<input type="text" name="name" placeholder="Enter Name" required pattern="^[A-Za-z ]+$"/>
	<h2> Email </h2>
		<input type="email" name="email" placeholder="Enter Email" required />
	<h2> Feedback </h2>
        	<textarea name="query" placeholder="Enter Feedback" rows="4" cols="25" required></textarea> 	
	<br><br>
		<input type="radio" name="f" value="Excellent" checked=true/>Excellent 
		<input type="radio" name="f" value="Very Good"/> Very Good
		<input type="radio" name="f" value="Satisfactory"/> Satisfactory
		<input type="radio" name="f" value="Poor"/> Poor
	<br><br>
		<input type ="Submit" value="Submit" name="btn_s">
		 
		<input type="button" value="Back" onclick="window.location='index.jsp'" >
    </form>
    <%
		if(request.getParameter("btn_s") != null)
		{
		  String name = request.getParameter("name");
		  String email = request.getParameter("email");
		  String query = request.getParameter("query");
		  String fb = request.getParameter("f");
 
		try
		{
			DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
			String url = "jdbc:mysql://localhost:3306/fb_20july23";
			Connection con = DriverManager.getConnection(url,"root","abc123");

			String sql = "Insert into student value(?,?,?,?)";
			PreparedStatement pst = con.prepareStatement(sql);
			pst.setString(1,name);
			pst.setString(2,email);
			pst.setString(3,query);
			pst.setString(4,fb);
			pst.executeUpdate();
			con.close();
			%>
                        <script>
                            let suc = "Record Created";
                            alert(suc);
                        </script>
                    <%

			con.close();
		}
		catch(SQLException e)
		{
			out.println("SQL Issue" + e);
		}
		}
  %>
  <%
		if(request.getParameter("btn_b") != null)
		{
			response.sendRedirect("index.jsp");
		}
    %>	
</center>
</body>
</html>