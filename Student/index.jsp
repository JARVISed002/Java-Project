<%@ page import="java.sql.*"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>

<body>
    <section class="vh-100" style="background:url('https://www.shutterstock.com/image-vector/colourful-landing-page-background-eps-260nw-1920897089.jpg');background-repeat: no-repeat;background-size: cover;">
        <div class="container py-5 h-100">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-12 col-md-8 col-lg-6 col-xl-5">
                    <div class="card shadow-2-strong" style="border-radius: 1rem;">
                        <div class="card-body p-5 text-center">
                            <form method="post">
                            <h3 class="mb-5">Sign in</h3>

                            <div class="form-outline mb-4">
                                <input type="text" name="name" class="form-control form-control-lg" placeholder="Name" required />
                                <br>
                            </div>

                            <div class="form-outline mb-4">
                                <input type="password" name="pw"  id="typePasswordX-2" class="form-control form-control-lg" placeholder="Password" required />
                                <br>
                            </div>

                            <!-- Checkbox -->
                            <div class="form-check d-flex justify-content-start mb-4">
                                <input class="form-check-input" type="checkbox" value="" id="form1Example3" />
                                <label class="form-check-label" for="form1Example3"> Remember password </label>
                            </div>

                            <input type="submit" value="Login" name="btn_lo" class="btn btn-primary btn-lg btn-block" />

                            <hr class="my-4">

                            <p class="mb-5 pb-lg-2" style="color: #000000;">Don't have an account? <a href="/Student/register.jsp"
                                style="color: #393f81;">Register here</a></p>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

<%
    if(request.getParameter("btn_lo") != null)
    {
        String name1 = request.getParameter("name");
        String pw = request.getParameter("pw");

        try{
                DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

                String url = "jdbc:mysql://localhost:3306/sm_25july23";
                Connection con = DriverManager.getConnection(url,"root","abc123");

                String check = "select * from login where name=? and password=?";
                PreparedStatement p = con.prepareStatement(check);
                p.setString(1,name1);
                p.setString(2,pw);
                ResultSet rs = p.executeQuery();

                if(rs.next())
                {
                    session.setAttribute("name",name1);
                    response.sendRedirect("home.jsp");    
                }
                else
                {
            
                     %>
                                <script>
                                    let pAlert = "User not found!";
                                    alert(pAlert);
                                </script>
                    <%
                }
                con.close();
        }catch(SQLException e){
            %>
            <script>
                let eAlert = "Issue: " + " <%= e %> ";
                alert(eAlert);
            </script>
            <%
        }
    }
%>
</body>
</html>