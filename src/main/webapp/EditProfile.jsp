<%-- 
    Document   : EditProfile
    Created on : Aug 21, 2023, 6:25:00 PM
    Author     : 91731
--%>

<%@page import="com.mycompany.easykart.entities.User"%>
<%
    User user=(User)session.getAttribute("current-user");
    if(user==null){
    session.setAttribute("message", "LoginFirst");
    response.sendRedirect("login.jsp");
    return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp" %>
        <link href="css/EditButton.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="components/navbar.jsp" %> 
        <%@include file="components/msg.jsp" %>
      
        <div class="container-fluid">
            <div class="row mt-3" >
                
                <div class="col-md-8" style="margin: auto">
                    <div class="card">
                        <div class="card-header" style="text-align: center">
                            <h4> <b>Your Profile</b></h4>
                        </div>
                        <div class="card-body">
                            <div class="card">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-10">
                                            <p style="font-size: 1.2em"> <b>Name:</b> <%=user.getUserName()%></p>
                                        </div>
                                        <div class="col-md-2">
                                            <button class="edit" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal20"><span class="edit-icon"></span><span>Edit</span></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="card">
                                <div class="card-body">
                                     <div class="row">
                                        <div class="col-md-10">
                                            <p style="font-size: 1.2em"> <b>Phone Number:</b> <%=user.getUserPhone()%></p>
                                        </div>
                                        <div class="col-md-2">
                                            <button class="edit" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal21"><span class="edit-icon"></span><span>Edit</span></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="card">
                                <div class="card-body">
                                     <div class="row">
                                        <div class="col-md-10">
                                            <p style="font-size: 1.2em"> <b>Password:</b> <%=user.getUserPassword()%></p>
                                        </div>
                                        <div class="col-md-2">
                                            <button class="edit" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal22"><span class="edit-icon"></span><span>Edit</span></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <div class="card">
                                <div class="card-body">
                                     <div class="row">
                                        <div class="col-md-10">
                                            <p style="font-size: 1.2em"> <b>Address:</b> <%=user.getUserAddress()%></p>
                                        </div>
                                        <div class="col-md-2">
                                            <button class="edit" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal23"><span class="edit-icon"></span><span>Edit</span></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>
        
        
        
     

<!-- Modal -->
<div class="modal fade" id="exampleModal20" tabindex="-1" aria-labelledby="exampleModalLabel20" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <form action="EditUser" method="post">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel20">Edit Name</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          
          <input type="hidden" name="ui" value="<%=user.getUserId()%>">
          <input type="hidden" name="d" value="na">  
  <div class="mb-3">
    <label for="name" class="form-label">Enter Your Name</label>
    <input type="text" class="form-control" id="name" aria-describedby="emailHelp" name="name">
    <div id="emailHelp" class="form-text">You are changing your name </div>
  </div>
  
          
          
      </div>
      <div class="modal-footer">
          <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
        </form>
    </div>
  </div>
</div>
     





<!-- Modal -->
<div class="modal fade" id="exampleModal21" tabindex="-1" aria-labelledby="exampleModalLabel21" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <form action="EditUser" method="post">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel21">Edit Phone Number</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <input type="hidden" name="ui" value="<%=user.getUserId()%>">
          <input type="hidden" name="d" value="ph">
        <div class="mb-3">
    <label for="PNo" class="form-label">Enter Your Phone Number</label>
    <input type="text" class="form-control" id="Pno" aria-describedby="emailHelp" name="PhoneNumber">
    <div id="emailHelp" class="form-text">You are changing your Phone Number </div>
  </div>
  
      </div>
      <div class="modal-footer">
          <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
    </form>
    </div>
  </div>
</div>




  
<!-- Modal -->
<div class="modal fade" id="exampleModal22" tabindex="-1" aria-labelledby="exampleModalLabel22" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <form action="EditUser" method="post">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel22">Change Password</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
          <input type="hidden" name="ui" value="<%=user.getUserId()%>">
          <input type="hidden" name="d" value="pa">
          <div class="mb-3">
    <label for="pass" class="form-label">Enter Your Password</label>
    <input type="password" class="form-control" id="pass" aria-describedby="emailHelp" name="password">
    <div id="emailHelp" class="form-text">You are changing your Password </div>
  </div>
  
          
          
      </div>
      <div class="modal-footer">
          <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
        </form>
    </div>
  </div>
</div>




        <!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal23" tabindex="-1" aria-labelledby="exampleModalLabel23" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        <form action="EditUser" method="post">
           
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel23">Change Address</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <input type="hidden" name="d" value="ad">
          <input type="hidden" name="ui" value="<%=user.getUserId()%>">
          <div class="mb-3">
    <label for="add" class="form-label">Enter Your Address</label>
    <input type="text" class="form-control" id="add" aria-describedby="emailHelp" name="address">
    <div id="emailHelp" class="form-text">You are changing your address </div>
  </div>
  
          
          
      </div>
      <div class="modal-footer">
          <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Save changes</button>
      </div>
        </form>
    </div>
  </div>
</div>
       <%@include file="components/common-model.jsp" %> 
    </body>
</html>
