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
    style="background:url('https://www.shutterstock.com/image-vector/colourful-landing-page-background-eps-260nw-1920897089.jpg');background-repeat: no-repeat;background-size: cover;  ">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-lg-12 col-xl-11">
          <div class="card text-black" style="border-radius: 25px;">
            <div class="card-body p-md-5">
              <div class="row justify-content-center">
                <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
                  <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>

                  <form method="post" class="mx-1 mx-md-4">

                    <div class="d-flex flex-row align-items-center mb-4">
                      <i class="fas fa-user fa-lg me-3 fa-fw"></i>
                      <div class="form-outline flex-fill mb-0">
                        <input type="text" name="name" id="form3Example1c" class="form-control" required />
                        <label class="form-label" for="form3Example1c">Your Name</label>
                      </div>
                    </div>

                    <div class="d-flex flex-row align-items-center mb-4">
                      <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
                      <div class="form-outline flex-fill mb-0">
                        <input type="password" name="pw" id="form3Example4c" class="form-control" required />
                        <label class="form-label"  for="form3Example4c">Password</label>
                      </div>
                    </div>

                    <div class="d-flex flex-row align-items-center mb-4">
                      <i class="fas fa-key fa-lg me-3 fa-fw"></i>
                      <div class="form-outline flex-fill mb-0">
                        <input type="password" name="cpw" id="form3Example4cd" class="form-control" required />
                        <label class="form-label"  for="form3Example4cd">Confirm your password</label>
                      </div>
                    </div>

                    <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
                      <button type="submit" name="btn_rg" class="btn btn-primary btn-lg">Register</button>
              
                    </div>

                    <p class="mb-5 pb-lg-2" style="color: #000000;">Have already an account? <a href="/Student/index.jsp"
                        style="color: #393f81;">Login here</a></p>

                  </form>

                </div>
                <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
                  <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-registration/draw1.webp"
                    class="img-fluid" alt="Sample image">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

<%
    if(request.getParameter("btn_rg") != null)
    {
        String name = request.getParameter("name");
        String pw = request.getParameter("pw");
        String cpw = request.getParameter("cpw");

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

        if(!pw.equals(cpw))
        {
          %>
          <script>
                let suc = "Password Not Match";
                alert(suc);
                </script>
          <%
          return ;
        }
        try{
       
                DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

                String url = "jdbc:mysql://localhost:3306/sm_25july23";
                Connection con = DriverManager.getConnection(url,"root","abc123");

                String sql = "insert into login values(?,?)";
                PreparedStatement pst = con.prepareStatement(sql);
                pst.setString(1,name);
                pst.setString(2,pw);
                pst.executeUpdate();
                con.close();
                %>
                <script>
                let suc = "Registered Successfully";
                alert(suc);
                </script>
               <%
                con.close();
                
        }catch(SQLException e){
                     %>
          <script>
                let suc = "<%= e %>";
                alert(suc);
                </script>
          <%                 
        }
    }
%>
 

</body>

</html>