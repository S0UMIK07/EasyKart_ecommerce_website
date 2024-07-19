<%-- 
    Document   : AdminOrder
    Created on : Aug 20, 2023, 12:00:42 PM
    Author     : 91731
--%>



<%@page import="com.mycompany.easykart.entities.OrderItem"%>
<%@page import="com.mycompany.easykart.dao.OrderItemDao"%>
<%@page import="com.mycompany.easykart.entities.Order"%>
<%@page import="com.mycompany.easykart.dao.OrderDao"%>
<%@page import="com.mycompany.easykart.dao.UserDao"%>
<%@page import="com.mycompany.easykart.helper.FactoryProvider"%>
<%@page import="com.mycompany.easykart.entities.User"%>
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
    UserDao udao=new UserDao(FactoryProvider.getFactory());
    List<User> ulist = udao.getAllUser();

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
            <% for(User ul: ulist){ 
            if(ul.getUserType().equals("normal")){
            
           OrderDao odao=new OrderDao(FactoryProvider.getFactory());
           List<Order>olist=odao.getOrdersByUserId(ul.getUserId());  

            %> 
           
            <div class="row mt-3">
                <div class="card">
                    <div class="card-body">
                        <%@include file="components/msg.jsp" %>
                        <div class="row">
                            <div class="col-md-2">
                                <div class="card">
                                    <div class="card-header">
                                        <table class="table-primary">
                                            <thead>
                                                <tr>
                                                    <th scope="col" style="text-align: center">
                                                        UserId
                                                    </th>
                                                   
                                                    <th scope="col" style="text-align: center">
                                                        Name
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <tr>
                                                    <td style="text-align: center">
                                                        <%=ul.getUserId()%>
                                                    </td>
                                                    
                                                    <td style="text-align: center">
                                                        <%=ul.getUserName()%>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>                    
                                    </div>
                                    <div class="card-body">
                                        <% int temp=0; %>
                                        <div class="dropdown">
                                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                                                Order Id
                                            </button>
                                            <%   
                                               int temp1=0;
                                               if(olist != null){
                                                temp=0;
                                            %>
                                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                                <% for(Order ol:olist){ 
                                                   temp++;
                                                   temp1++;
                                                %>
                                                <li>
                                                <form action="AdminOrder.jsp" method="post">
                                                    <input type="hidden" name="id1" value="<%=ol.getOrderId()%>" />
                                                    <input type="hidden" name="id3" value="<%=temp%>" />
                                                    <button type="submit" class="dropdown-item">Order:<%=temp%>:<%=ol.getStatus()%></button>
                                                </form>
                                                </li>
                                                <% } %>
                                           
                                            <% if(temp==0){ %>
                                            <li><h6 class="dropdown-item">No Order</h6></li>
                                               <% }%>
                                            </ul>
                                            <% } %>
                                        </div>
                                        <%
                                            int tes=0;
                                            for(Order olt:olist){
                                            if(!olt.getStatus().trim().equals("Delivered")){
                                            tes++;
                                            }
                                            }
                                            if(tes==0 && temp!=0){
                                            %>
                                            <br> <h6 style="color: green"><b>All Order Delivered</b></h6>
                                            <%
                                            }
                                            
                                        %>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="card">
                                    <%
                                     if(temp1 != 0){
                                    String id2= request.getParameter("id1");
                                    if(id2!= null){
                                    int i=Integer.parseInt(id2.trim());
                                    int i9=ul.getUserId();
                                    Order or= odao.getOrderByIdAndUserId(i, i9);
                                    if(or!=null){
                                    %>
                                    <div class="card-header">Status:<%=or.getStatus()%><br>Payment:<%=or.getPayment()%></div>
                                    <div class="card-body">
                                        <div class="row-md-4">
                                            
                                            <form method="post" action="AdminOrderOperationServlet">
                                                        <input type="hidden" name="orderStauts" value="oStatus">
                                                        <input type="hidden" name="uid" value="<%=ul.getUserId()%>">
                                                        <input type="hidden" name="oid" value="<%=i%>">
                                                        <b>Order Status :</b> <br>
                                                            <input type="radio" name="Status" id="s1" value="Pending">
                                                            <label  for="s1">
                                                                Pending
                                                            </label>
                                                            <input type="radio" name="Status" id="s2" value="Confirmed">
                                                            <label for="s2">
                                                                Confirmed
                                                            </label>
                                                      
                                                            <br>
                                                            <input  type="radio" name="Status" id="s3" value="Shipped">
                                                            <label  for="s3">
                                                                Shipped
                                                            </label>
                                                            <input  type="radio" name="Status" id="s4" value="Delivered">
                                                            <label  for="s4">
                                                                Delivered
                                                            </label>
                                                      
                                                        <div class="d-grid gap-2">
                                                        <button type="submit" class="btn btn-primary mt-1 btn-sm">Submit</button>
                                                        </div>                                  
                                                    </form>
                                               
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <form method="post" action="AdminOrderOperationServlet">
                                                        <input type="hidden" name="orderStauts" value="oPayment">
                                                        <input type="hidden" name="uid" value="<%=ul.getUserId()%>">
                                                        <input type="hidden" name="oid" value="<%=i%>">
                                                        <b>Payment Status :</b> <br>
                                                            <input type="radio" name="Payment" id="p1" value="Pending">
                                                            <label  for="p1">
                                                                Pending
                                                            </label>
                                                            <input type="radio" name="Payment" id="p2" value="Confirmed">
                                                            <label for="p2">
                                                                Confirmed
                                                            </label>
                                                      
                                                      
                                                        <div class="d-grid gap-2">
                                                        <button type="submit" class="btn btn-primary mt-1 btn-sm">Submit</button>
                                                        </div>                                  
                                                    </form>
                                               
                                        </div>
                                        </div>
                                    </div>
                                    
                                </div>
                           
                            <div class="col-md-6">
                                <div class="card">
                                    <%
                                            

                                    String id4= request.getParameter("id3");
                                    if(id4!= null){
                                    int i1=Integer.parseInt(id4.trim());                           
                                           
                                        
                                        %>
                                        <div class="card-header">
                                            <div class="row">
                                                <div class="col-md-2"> <b>Order ID= <%= i1%></b></div>
                                                <div class="col-md-6"><b> Order Date=</b><%=or.getOrderDate()%></div>
                                                <div class="col-md-4"><b>Total-Price:</b>&#8377;<%=or.getTotalAmount()%>/-</div>
                                            </div>
                                            </div>
                                            
                                    <div class="card-body">
                                        <table class="table table-hover">
                                        <%
                                            OrderItemDao orderItem=new OrderItemDao(FactoryProvider.getFactory());
                                           List<OrderItem> oItem= orderItem.getOrderItemByOrderId(i);
                                        %>
                                          
                                        
                                        <thead>
                                       <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Product Name</th>
                                            <th scope="col">Product Price</th>
                                            
                                            <th scope="col">Product Quantity</th>
                                            <th scope="col">Total Price</th>
                                        </tr>
                                        </thead>
                                        
                                        <tbody>
                                        <%  
                                            int to=0,temp3=0;
                                            for(OrderItem oItemList: oItem){
                                            to= to+oItemList.getQuantity();
                                            temp3++;
                                        %>
                                             
                                        
                                        <tr>
                                            <th scope="row"><%=temp3%></th>
                                            <td><%=oItemList.getProductName()%></td>
                                            <td>&#8377;<%=oItemList.getProductDPrice()%></td>
                                            
                                            <td><%=oItemList.getQuantity()%></td>
                                            <%
                                                int top= ((oItemList.getQuantity())*(oItemList.getProduct().getDiscountedPrice()));
                                            %>
                                            <td>&#8377;<%=top%></td>
                                        </tr>
                                        
                                        
                                        <% } %>
                                        </tbody>
                                        </table>
                                    </div>
                                        
                                        <div class="card-footer">
                            <div class="row">
                            
                            <div class="col"><b>Total-Items: </b><%=to%></div>
                            <div class="col"><b>Order-Status:</b><%=or.getStatus()%></div>
                            <div class="col"><b>Payment-Status:</b><%=or.getPayment()%></div>
                            <div class="col"><b>Payment-ID:</b><%=or.getPaymentId()%></div>
                        </div>
                        </div>
                                        
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="card">
                                    <div class="card-header"><b>Order ID = <%=i1%> </b><h6>Delivery Address</h6></div>
                                    <div class="card-body">
                                        <h6>
                            <%=or.getDeliveryAddress().getDname()%>
                            <br><!-- comment -->
                            <%=or.getDeliveryAddress().getEmail()%>
                            <br>
                            <%=or.getDeliveryAddress().getPhonenumber()%>
                            <br>
                            <%=or.getDeliveryAddress().getCity()%>
                            <%=or.getDeliveryAddress().getState()%>
                            <%=or.getDeliveryAddress().getPostalCode()%>
                            <br>
                            <%=or.getDeliveryAddress().getDAddress()%>
                            </h6>
                                        
                                    </div>
                                </div>
                            </div> 
                                <%  }} } }%>
                        </div>
                    </div>
                </div>
            </div>
            <% }} %>
        </div>
        
        
        <%@include file="components/common-model.jsp" %>
    </body>
</html>
