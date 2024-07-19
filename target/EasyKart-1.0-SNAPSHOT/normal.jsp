<%-- 
    Document   : normal
    Created on : Aug 6, 2023, 9:10:02 PM
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
    else
    {
    response.sendRedirect("index.jsp");
    }
%>


