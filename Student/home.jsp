<%@ page import="java.sql.*"%>
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
            top: 4em;
        }

        body {
           background:url('https://i.stack.imgur.com/5kzat.png');
           background-repeat: no-repeat;
           background-size: cover;  
        }

        #logout{
            font-size:2em;
        }
    
    </style>
</head>

<body>
<div class="d-flex justify-content-end">
 <button type="button" id="logout" class="btn btn-rounded mr-5 mt-4 text-white" style="background: linear-gradient(114deg, rgba(2,0,36,1) 0%, 
 rgba(0,212,255,1) 0%, rgba(45,108,170,1) 46%, rgba(76,76,112,1) 100%);; border-radius:40px" onclick="document.location='index.jsp';return confirm('Do you want to exit?')">Logout</button>
</div>
    <div class="container">
        <div class="row">
            <div class="card m-4" style="width: 500px;">
                <div class="row no-gutters">
                    <div class="col-sm-5">
                        <img class="card-img" src="https://cdn-icons-png.flaticon.com/512/306/306232.png"
                            alt="Suresh Dasari Card">
                    </div>
                    <div class="col-sm-7">
                        <div class="card-body">
                            <h5 class="card-title">Add Yourself</h5>
                            <p class="card-text">Suresh Dasari is a founder and technical lead developer in tutlane.</p>
                            <a href="/Student/add.jsp" class="btn btn-primary">ADD</a>
                        </div>
                    </div>
                </div>
            </div>

            <br>

            <div class="card m-4" style="width: 500px;">
                <div class="row no-gutters">

                    <div class="col-sm-5">
                        <img class="card-img" src="https://cdn-icons-png.flaticon.com/512/470/470308.png"
                            alt="Suresh Dasari Card">
                    </div>
                    <div class="col-sm-7">
                        <div class="card-body">
                            <h5 class="card-title">View Yourself</h5>
                            <p class="card-text">Suresh Dasari is a founder and technical lead developer in tutlane.</p>
                            <a href="/Student/view.jsp" class="btn btn-primary">VIEW</a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <br>
        <div class="row">
            <div class="card m-4" style="width: 500px;">
                <div class="row no-gutters">
                    <div class="col-sm-5">
                        <img class="card-img"
                            src="https://www.iconexperience.com/_img/v_collection_png/512x512/shadow/businessman_edit.png"
                            alt="Suresh Dasari Card">
                    </div>
                    <div class="col-sm-7">
                        <div class="card-body">
                            <h5 class="card-title">Update</h5>
                            <p class="card-text">Suresh Dasari is a founder and technical lead developer in tutlane.</p>
                            <a href="/Student/update.jsp" class="btn btn-primary">UPDATE</a>
                        </div>
                    </div>
                </div>
            </div>

            <br>

            <div class="card m-4" style="width: 500px;">
                <div class="row no-gutters">

                    <div class="col-sm-5">
                        <img class="card-img" src="https://www.pngkey.com/png/full/355-3559808_delete-user-icon-png.png"
                            alt="Suresh Dasari Card">
                    </div>
                    <div class="col-sm-7">
                        <div class="card-body">
                            <h5 class="card-title">Delete</h5>
                            <p class="card-text">Suresh Dasari is a founder and technical lead developer in tutlane.</p>
                            <a href="/Student/delete.jsp" class="btn btn-primary">DELETE</a>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>  

<%
String name1 = (String)session.getAttribute("name");
    if(name1 == null){
        response.sendRedirect("index.jsp");
    }
%>
</body> 

</html>