<%@ page import="java.sql.*" %>
<html>
<head>
	<title>Feedback Management System </title>
	<style>
		*{ font-size:30px; }
		body{background-color:#008dff;}
		h1{font-size:40px;background-color:black; color:white; width:40%; border-radius:10px;}
}
	</style>
</head>
<body>
<center>
	<h1> Delete </h1>
	<form method="POST">
	<h2> Name </h2>
	<input type="text" name="name" placeholder="Enter Name" required pattern="^[A-Za-z ]+$" />
	<h2> Password </h2>
	<input type="email" name="email" placeholder="Enter Email" />
	<br><br>
	<input type="Submit" value="Delete" name="btn_d">
	<input type="button" value="Back" onclick="window.location='view.jsp'" >
	
</form>
<%
	 if (request.getParameter("btn_d") != null)
          {
           String name = request.getParameter("name");
           String email = request.getParameter("email");

           try {
              DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
                              
              String url = "jdbc:mysql://localhost:3306/fb_20july23";
              Connection con = DriverManager.getConnection(url, "root", "abc123");

              String check = "delete from student where name=? and email=?";
              PreparedStatement p = con.prepareStatement(check);
              p.setString(1, name);
              p.setString(2, email);
	      long r = p.executeUpdate();
		%>
                        <script>
                            let aAlert = "<%= r %>" + " Record Deleted";
                            alert(aAlert);
                        </script>
                    <%	
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
	}
%>
</center>
</body>
</html>