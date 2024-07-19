<%-- 
    Document   : register
    Created on : Aug 4, 2023, 6:18:22 PM
    Author     : 91731
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/common_css_js.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/style.css"/>
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
                  
                 <form action="RegisterServlet" method="post" >
            <h3 style="text-align: center">Register Here</h3>
            <div class="mb-3">
    <label for="userName" class="form-label">Name</label>
    <input type="text" name="username" placeholder="Enter Your Name" class="form-control" id="userName" required>
  </div>
            
  <div class="mb-3">
    <label for="userEmail" class="form-label">Email address</label>
    <input type="email" name="useremail" placeholder="Enter your Email Address" class="form-control" id="userEmail" aria-describedby="emailHelp" required>
    
  </div>
  <div class="mb-3">
    <label for="userPassword" class="form-label">Password</label>
    <input type="password" name="userpassword" placeholder="Enter Password" class="form-control" id="userPassword" required>
  </div>
            <div class="mb-3">
    <label for="userPhone" class="form-label">Phone Number</label>
    <input type="text" name="userphonenumber" placeholder="Enter Your Phone Number" class="form-control" id="userPhone" required>
  </div>
            <div class="mb-3">
    <label for="userAddress" class="form-label">Address</label>
    <textarea style="height:150px;" name="useraddress" placeholder="Enter Your Address" class="form-control" id="userAddress" required></textarea>
  </div>
            <p>Already Registered?<br>
                <a href="login.jsp">click here to login</a></p>
  
            <button class="button-42" type="reset">Reset</button>
            <button class="button-42" type="submit">Register</button>
</form>
         </div>
         </div>
         </div>
         </div>
         </div>
            </div>
    </body>
</html>
