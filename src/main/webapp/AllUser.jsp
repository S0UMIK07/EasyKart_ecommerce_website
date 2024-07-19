<%-- 
    Document   : AllUser
    Created on : Aug 19, 2023, 9:21:57 PM
    Author     : 91731
--%>
<%@page import="com.mycompany.easykart.entities.User"%>
<%@page import="com.mycompany.easykart.dao.UserDao"%>
<%@page import="com.mycompany.easykart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>

<%
    User user=(User)session.getAttribute("current-user");
    if(user==null){
    session.setAttribute("message", "LoginFirst");
    response.sendRedirect("login.jsp");
    return;
    }
    else{
    if(user.getUserType().equals("normal")){
    session.setAttribute("message", "notAllowed");
    response.sendRedirect("login.jsp");
    return;
    }
    }
   
UserDao uDao= new UserDao(FactoryProvider.getFactory());
    long uCount= (uDao.getUserCount())-1;
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %> 
        
        
        
        <div class="container-fluid">
        <div class="row mt-5">
        <div class="col-md-12">
                    
            <div class="card-header"><h3 class="text-center mb-4"> Total User <%=uCount%> </h3></div>
                        
                            <% 
                             if(uCount >= 1){
                              
                            UserDao Udao=new UserDao(FactoryProvider.getFactory());
                            List<User> Ulist=Udao.getAllUser();
                            %>
                            <div class="card-body">
                            <table class="table table-hover">
                                <thead>
                                       <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Name</th>
                                            <th scope="col">Phone Number</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Password</th>
                                            <th scope="col">User Type</th>
                                            <th scope="col">Address</th>
                                        </tr>
                                </thead>
                                 <tbody><%
                                           int to=0,temp=0;
                                           for(User ul: Ulist){
                                           
                                           temp++;
                                        %>
                                        <tr>
                                            <th scope="row"><%=temp%></th>
                                            <td><%=ul.getUserName()%></td>
                                            <td><%=ul.getUserPhone()%></td>
                                            <td><%=ul.getUserEmail()%></td>
                                            <td><%=ul.getUserPassword()%></td>
                                            <td><%=ul.getUserType()%></td>
                                            <td><%=ul.getUserAddress()%></td>
                                           
                                            
                                        </tr>
                                        <%
                                             }
                                        %>
                                 </tbody>
                            </table>
                            
                        </div>
                       
                        <%
                            }
                        %>
                    
              </div>
        </div>
        </div>
        
        
        <%@include file="components/common-model.jsp" %>
    </body>
</html>
