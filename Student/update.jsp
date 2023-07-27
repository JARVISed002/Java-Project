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
            top: 10em;
        }

        body {
            background-image: url('https://img.freepik.com/free-photo/top-view-back-school-stationery-with-colorful-pencils-copy-space_23-2148587576.jpg?w=2000');
            background-repeat: no-repeat;
            background-size: cover;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1 class=" mb-4">Update Yourself</h1>
        <div class="card" style="border-radius: 20px;">

            <div class="card-body">
                <div class="m-sm-4">
                    <form>
                        <div class="form-group"> <label>ID</label> <input class="form-control form-control-lg"
                                type="number" name="id" placeholder="Enter your ID" required min="1" /></div>
                        <div class="form-group"> <label>Name</label> <input class="form-control form-control-lg"
                                type="text" name="name" placeholder="Enter your name" required /></div>
                        <div class="form-group"> <label>Marks</label> <input class="form-control form-control-lg"
                                type="number" name="marks" placeholder="Enter your marks" required min="0" max="100" /></div> 
                </div>
            </div>
            <div class="px-5 py-4" style="display: flex; flex-direction: row-reverse;">
               
                     <input type="submit" name="btn_u" value="Update" style="background-color:blue;" class="btn btn-primary btn-lg mx-2" />
                <button type="submit" class="btn btn-primary btn-lg" style=" background-color: blue; color: white"
                    onclick="document.location='home.jsp'">Back</button>
                     </form>
            </div>
        </div>
    </div>

    <%

         String name1 = (String)session.getAttribute("name");
             if(name1 == null){
              response.sendRedirect("index.jsp");
             }

    if(request.getParameter("btn_u") != null){
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int marks = Integer.parseInt(request.getParameter("marks"));
        
        if(name.trim().length() < 2)
        {
           %>
          <script>
                let suc = "Invalid Name";
                alert(suc);
                </script>
          <%
        return ; 
        }

        try{
                DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

                String url = "jdbc:mysql://localhost:3306/sm_25july23";
                Connection con = DriverManager.getConnection(url,"root","abc123");

                String sql = "update users set name=?,marks=? where id=?";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setString(1,name);
                pst.setInt(2,marks);
                pst.setInt(3,id);
                long r = pst.executeUpdate();
                %>
                 <script>
                let aAlert = "<%= r %>" + " Updated Successfully !";
                 alert(aAlert);
                </script>
                <%
                con.close();
        }catch(SQLException e){
            %>
            <script>
            let suc = "<%= e%>";
            alert(suc);
            </script>
            <%
        }
    }
%>

</body>

</html>