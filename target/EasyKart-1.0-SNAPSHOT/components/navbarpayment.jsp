<%-- 
    Document   : navbarpayment
    Created on : Sep 3, 2023, 9:06:04 PM
    Author     : 91731
--%>


<%@page import="com.mycompany.easykart.entities.User"%>
<%
    User user1=(User)session.getAttribute("current-user");
%>
<head>
    <link href="https://use.fontawesome.com/releases/v5.0.1/css/all.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
   
    <style>
        .cart-co{
            cursor: pointer; font-size: 1.5rem;
        }
    </style>
</head>
<body>
<div style="background: linear-gradient(to bottom, lightcoral, #FFA500);
        color: lightcoral;">
<nav class="navbar navbar-expand-lg navbar-light">
  <div class="container-fluid" >
 
    
      <img src="img/logo.jpg" alt="" width="60" height="70" class="d-inline-block align-text-top">
      &nbsp;
       &nbsp;
      <span class="navbar-brand mb-0 h1">EasyKart</span>
  
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
        </li>
       
       <% if(user1!=null){
 if(user1.getUserType().equals("admin") || user1.getUserType().equals("normal")){
 %>
<li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            My Profile
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="EditProfile.jsp">Edit Profile</a></li>
            <% if(user1.getUserType().equals("normal")){%>
            <li><a class="dropdown-item" href="myOrder.jsp">My Order</a></li>
            <% } else if(user1.getUserType().equals("admin")){ %>
            <li><a class="dropdown-item" href="AdminOrder.jsp">Orders</a></li>
            <li><a class="dropdown-item" href="admin.jsp">Admin Page</a></li>
            <%}%>
            <li><hr class="dropdown-divider"></li>
            <li><a class="dropdown-item" href="LogoutServlet">Logout</a></li>
          </ul>
        </li>
 <%
     }
           }

       %>
       
        </ul>
        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
            
   
   <%
       if(user1==null)
       {
       %>
       <li class="nav-item"> <a class="btn btn-outline-success me-2" href="login.jsp" style="color:black; border:none;"><b>Login</b></a> </li>
       <li class="nav-item"> <a class="btn btn-outline-success me-2" href="register.jsp" style="color:black; border:none;"><b>Sign Up</b></a> </li>
        <%
       }
       else
       {
       if(user1.getUserType().equals("admin") || user1.getUserType().equals("normal")){
           %>
       <li class="nav-item">   <b style="color: black"> Hi, <%= user1.getUserName()%> </b>&nbsp;&nbsp; </li>
       
        <%
        }
 
        
       }
   %>
     </ul>
    </div>
  </div>
 </nav>
</div>
  
</body> 
