<%@ page import="java.sql.*" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        .container {
            position: relative;
            top: 5em;
        }

        body {
            background: url('https://img.freepik.com/free-vector/dark-gradient-background-with-copy-space_53876-99548.jpg?w=360');
            background-repeat: no-repeat;
            background-size: cover;
        }
        table{
            font-size:30px;
            position:relative;
            bottom:20em;
            width:100%;
        }
    </style>
</head>

<body>

    <div class="container my-4">
        <h1 class="text-white mb-4">Student Entries</h1>
        <div class="form-outline">
            <textarea class="form-control" id="textAreaExample1" rows="20" readonly></textarea>
            <label class="form-label" for="textAreaExample"></label> 
	        <br>
	        <table border="5" style="width=50%;height=100%">
		    <tr>
		    <th class="text-center"> ID </th>
		    <th class="text-center"> Name </th>
		    <th class="text-center"> Marks </th>
		</tr>
        </div>
        <div class="px-5 py-4" style="display: flex; flex-direction: row-reverse;">
            <button type="submit" class="btn btn-primary btn-lg" style=" margin-left: 14px;"
                onclick="document.location='delete.jsp'">Delete</button>
            <button type="submit" class="btn btn-primary btn-lg" onclick="document.location='home.jsp'">Back</button>
        </div>	
    </div>

    <%

		 String name1 = (String)session.getAttribute("name");
    		if(name1 == null){
        response.sendRedirect("index.jsp");
    		}

		try
		{
		  DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
		  String url = "jdbc:mysql://localhost:3306/sm_25july23";
		  Connection con = DriverManager.getConnection(url,"root","abc123");

		  String sql="select * from users";
		  PreparedStatement pst = con.prepareStatement(sql);
		  ResultSet rs = pst.executeQuery();

		  while(rs.next())
		  {
		  %>
			<tr style="text-align:center;">
			<td> <%= rs.getInt(1) %> </td>
			<td> <%= rs.getString(2) %> </td>
			<td> <%= rs.getInt(3) %> </td>
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
</body>
</html>