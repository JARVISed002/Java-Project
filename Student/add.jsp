<%@ page import="java.sql.*" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
    <section class="vh-100"
        style="background-image: url('https://images.unsplash.com/photo-1607081758728-78b82a34dc64?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8ZWR1Y2F0aW9uJTIwYmFja2dyb3VuZHxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80'); background-repeat: no-repeat;background-size:cover;">
        <div class="container h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-xl-9">

                    <h1 class=" mb-4">Add Student</h1>

                    <div class="card" style="border-radius: 15px;">
                        <div class="card-body">
                            <form method="post">
                            <div class="row align-items-center py-3">
                                <div class="col-md-3 ps-5">
                                    <h6 class="mb-0">Enter your ID</h6>
                                </div>
                                <div class="col-md-9 pe-5">
                                    <input type="number" name="id" class="form-control form-control-lg" placeholder="" min="1" required />
                                </div>
                            </div>

                            <hr class="mx-n3">

                            <div class="row align-items-center pt-4 pb-3">
                                <div class="col-md-3 ps-5">
                                    <h6 class="mb-0">Enter Your name</h6>
                                </div>
                                <div class="col-md-9 pe-5">
                                    <input type="text" name="name" class="form-control form-control-lg" required />
                                </div>
                            </div>

                            <hr class="mx-n3">

                            <div class="row align-items-center py-3">
                                <div class="col-md-3 ps-5">
                                    <h6 class="mb-0">Enter your marks</h6>
                                </div>
                                <div class="col-md-9 pe-5">
                                    <input type="number" name="marks" class="form-control form-control-lg" placeholder="" required min="0" max="100" />
                                </div>
                            </div>

                            <hr class="mx-n3">

                            <div class="px-5 py-4" style="display: flex; flex-direction: row-reverse;">
                              
                                <input type="submit" name="btn_s" value="Save" class="btn btn-primary btn-lg" />
                                <button  style="margin-right:14px" class="btn btn-primary btn-lg" onclick="document.location='home.jsp'">Back</button>
                            </div>

                        </form>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
    
<%
   String name1 = (String)session.getAttribute("name");
    if(name1 == null){
        response.sendRedirect("index.jsp");
    }


    if(request.getParameter("btn_s") != null){
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

                String sql = "insert into users values(?,?,?)";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setInt(1,id);
                pst.setString(2,name);
                pst.setInt(3,marks);
                pst.executeUpdate();
                %>
                 <script>
                let suc = "Added Successfully";
                alert(suc);
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