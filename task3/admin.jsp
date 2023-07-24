<%@ page import="java.sql.*" %>
<html>
<head>
	<title> Feedback Management System </title>
	<style>
		* { font-size:30px; }
		body {background-color:#008dff;}
		h1 {font-size:40px;background-color:black; color:white; width:40%; border-radius:10px;}

	</style>
</head>
<body>
<center>
	<h1> Admin Login </h1>
	<form method="POST">
	<h2> Name </h2>
	<input type="text" name="name" placeholder="Enter Name" required pattern="^[A-Za-z ]+$" />
	<h2> Password </h2>
	<input type="password" name="pw" placeholder="Enter Password" />
	<br><br>
	<input type="Submit" value="Login" name="btn_lo">
	<input type="button" value="Back" onclick="window.location='index.jsp'" >
	
</form>
<%
	 if (request.getParameter("btn_lo") != null)
          {
           String name = request.getParameter("name");
           String pw = request.getParameter("pw");

           try {
              DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                              
              String url = "jdbc:mysql://localhost:3306/fb_20july23";
              Connection con = DriverManager.getConnection(url, "root", "abc123");

              String check = "select * from admin where name=? and pw=?";
              PreparedStatement p = con.prepareStatement(check);
              p.setString(1, name);
              p.setString(2, pw);
              ResultSet rs = p.executeQuery();
              
              if(rs.next())
              {
                session.setAttribute("name", name);
                response.sendRedirect("view.jsp");
              }
	      else
		{
			 %>
                                <script>
                                    let pAlert = "Password Incorrect !";
                                    alert(pAlert);
                                </script>
                    <%
		}
		con.close();
	      }
	   catch (SQLException e) {
                    %>
                                <script>
                                    let eAlert = "Issue: " + "<%= e %>";
                                    alert(eAlert);
                                </script>
                    <%
                }
		if(request.getParameter("btn_b") != null)
		{
			response.sendRedirect("index.jsp");
		}
	}
%>
</center>
</body>
</html>