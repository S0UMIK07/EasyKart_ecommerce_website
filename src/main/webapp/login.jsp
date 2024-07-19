<%-- 
    Document   : login
    Created on : Aug 6, 2023, 9:43:24 AM
    Author     : 91731
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login  Page</title>
        <link rel="stylesheet" href="css/style.css">
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body style="background-color: #fff8e4;">
           
         <%@include file="components/navbar.jsp" %>
         
          <div class="container-fluid">
         <div class="row mt-5" >
           
            <div class="col-md-4 offset-md-4" >
                <div class="shadow p-3 mb-5 bg-body rounded">
                 <div class="card">
                     <%@include file="components/msg.jsp" %>
                     <img src="img/LoginLogo.jpeg" style="margin-left: auto; margin-right: auto; margin-top: 8px;" height="80" width="90" alt="image">
             <div class="card-body">
                  
                 <form action="LoginServlet" method="post">
            <h3 style="text-align: center">Login</h3>
           
            
  <div class="mb-3">
    <label for="userEmail" class="form-label">Email address</label>
    <input type="email" name="useremail" placeholder="Enter your Email Address" class="form-control" id="userEmail" aria-describedby="emailHelp" required>
    
  </div>
  <div class="mb-3">
    <label for="userPassword" class="form-label">Password</label>
    <input type="password" name="userpassword" placeholder="Enter Password" class="form-control" id="userPassword" required>
  </div>
            <p>Not Registered?<br>
                <a href="register.jsp">click here to register</a></p>
            
            <button class="button-42" type="reset">Reset</button>
            <button class="button-42" type="submit">Login</button>
    </form>
         </div>
         </div>
         </div>
         </div>
         </div>
            </div>
    </body>
</html>
