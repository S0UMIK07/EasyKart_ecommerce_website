<%-- 
    Document   : AllCategory
    Created on : Aug 19, 2023, 9:24:15 PM
    Author     : 91731
--%>


<%@page import="com.mycompany.easykart.entities.Product"%>
<%@page import="com.mycompany.easykart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.easykart.dao.ProductDao"%>
<%@page import="com.mycompany.easykart.dao.CategoryDao"%>
<%@page import="com.mycompany.easykart.helper.FactoryProvider"%>
<%@page import="com.mycompany.easykart.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
   
    CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
    ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
    List<Category>clist=cdao.getCategory();
    int t=0;
    for(Category cat: clist){
    t++;
    }
%>
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
                    
            <div class="card-header"><h3 class="text-center mb-4"> Total Category <%=t%> </h3></div>
                        
                            <% 
                             if(t >= 1){
                            %>
                            <div class="card-body">
                            <table class="table table-hover">
                                <thead>
                                       <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Category Name</th>
                                            <th scope="col">Category Details</th>
                                            <th scope="col">Total Products</th>
                                            
                                        </tr>
                                </thead>
                                 <tbody><%
                                           int temp=0;
                                           for(Category cl: clist){
                                           List<Product> plist=pdao.getProductsById(cl.getCategoryId());
                                           int ct=0;
                                           if(plist !=null){
                                           for(Product pl:plist){
                                           ct++;
                                           
                                            }
                                            }
                                           temp++;
                                        %>
                                        <tr>
                                            <th scope="row"><%=temp%></th>
                                            <td><%=cl.getCategoryTittle()%></td>
                                            <td><%=cl.getCategoryDescription()%></td>
                                            <td><%=ct%></td>
                                           
                                           
                                            
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
