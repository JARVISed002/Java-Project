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
    
<section class="vh-100 bg-image"
  style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
  <div class="mask d-flex align-items-center h-100 gradient-custom-3">
    <div class="container h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-12 col-md-9 col-lg-7 col-xl-6">
          <div class="card" style="border-radius: 15px;">
            <div class="card-body p-5">
              <h1 class="text-center mb-5">Remove Student</h1>

              <form>
                <div class="form-outline mb-4">
                  <input type="number" name="id" class="form-control form-control-lg" required min="1" />
                  <label class="form-label" for="form3Example1cg">Enter Your Id</label>
                </div>

                <div class="d-flex justify-content-center">
                    <button type="submit" name="btn_d"
                      class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Delete</button>
                  </div>
                  <div class="d-flex my-3 justify-content-center">
                    <button type="button"
                      class="btn btn-success btn-block btn-lg gradient-custom-4 text-body" onclick="document.location='home.jsp'">Back</button>
                  </div>    
              </form>

            </div>
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

    if(request.getParameter("btn_d") != null)
    {
      int id = Integer.parseInt(request.getParameter("id"));

      try{
           DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

           String url ="jdbc:mysql://localhost:3306/sm_25july23";
           Connection con = DriverManager.getConnection(url,"root","abc123");

           String sql ="delete from users where id=?";
           PreparedStatement pst = con.prepareStatement(sql);
           pst.setInt(1,id);
           long r = pst.executeUpdate();
	         %>
             <script>
                let aAlert = "<%= r %>" + " Record Deleted";
                 alert(aAlert);
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