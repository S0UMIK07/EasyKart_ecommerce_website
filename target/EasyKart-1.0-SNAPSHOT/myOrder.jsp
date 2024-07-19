<%-- 
    Document   : myOrder
    Created on : Aug 18, 2023, 4:00:10 PM
    Author     : 91731
--%>


<%@page import="com.mycompany.easykart.entities.OrderItem"%>
<%@page import="com.mycompany.easykart.entities.Order"%>
<%@page import="com.mycompany.easykart.dao.OrderDao"%>
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
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp" %> 
        <style>
            .emoji-sad {
  position: relative;
  width: 120px;
  height: 120px;
  background: #ffd200;
  border-radius: 50%;
  margin-left: 1%;
}

.face {
  width: inherit;
  height: inherit;
}

.eyebrow-left {
  position: absolute;
  height: 20px;
  width: 24px;
  left: 27px;
  border-radius: 50%;
  border: 5px solid transparent;
  box-sizing: border-box;
  border-top-color: black;
  top: 25px;
}

.eyebrow-right {
  position: absolute;
  height: 20px;
  width: 24px;
  right: 27px;
  border-radius: 50%;
  border: 5px solid transparent;
  box-sizing: border-box;
  border-top-color: black;
  top: 25px;
}

.eye-left {
  position: absolute;
  width: 11px;
  height: 12px;
  background: black;
  left: 33px;
  top: 40px;
  border-radius: 50%;
}

.eye-right {
  position: absolute;
  width: 11px;
  height: 12px;
  background: black;
  right: 33px;
  top: 40px;
  border-radius: 50%;
}
.mouth-sad {
  position: absolute;
  width: 78px;
  height: 80px;
  border: 6px solid transparent;
  top: 70px;
  left: 20px;
  box-sizing: border-box;
  border-radius: 50%;
  border-top-color: black;
}

        </style>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <%
                    int t=user.getUserId();
                    OrderDao odao=new OrderDao(FactoryProvider.getFactory());
                List<Order> olist=odao.getOrdersByUserId(t);
                int tm=0;
                for(Order ort: olist){
                tm++;
                }
                if(tm!=0){
            %>
            <div class="row mt-5">
                <div class="col-md-2">
                    <div class="card">
                        <div class="card-header"><h3 class="text-center mb-4"> Order Id </h3></div>
                       <div class="card-body">
                           <div class="list-group">
                    
                    <%
                       
                    int poi=0;
                    for(Order od: olist)
                    {
                    
                    poi++;
                    
                %><form action="myOrder.jsp" method="post">
                    <input type="hidden" name="id1" value="<%=od.getOrderId()%>" />
                    <input type="hidden" name="id4" value="<%=poi%>" />
                   

    <button type="submit" class="list-group-item list-group-item-action">Order Number: <%=poi%></button>
                           </form>
                <%   
                    }
                %> 
  
</div>
                
            </div>
                            
                        </div>
                    </div> 
                
                <div class="col-md-7">
                    
                    
                        
                        
                            <% 
                            String ip= request.getParameter("id1");
                            String ip2= request.getParameter("id4");
                             if(ip!= null){
                              int i=Integer.parseInt(ip.trim());
                              int i2=Integer.parseInt(ip2.trim());
                            Order or= odao.getOrderById(i);
                            List<OrderItem> OIlist=odao.getOrderItemsByOrderId(i);
                            %>
                            <div class="card-header"><b>Order No.:<%=i2%></b><h3 class="text-center mb-4"> Product Details </h3></div>
                            <div class="card-body">
                            <table class="table table-hover">
                                <thead>
                                       <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Product Name</th>
                                            <th scope="col">Product Price</th>
                                            
                                            <th scope="col">Product Quantity</th>
                                            <th scope="col">Total Price</th>
                                        </tr>
                                </thead>
                                 <tbody><%
                                           int to=0,temp=0;
                                           for(OrderItem oi: OIlist){
                                           to=to+ oi.getQuantity();
                                           temp++;
                                        %>
                                        <tr>
                                            <th scope="row"><%=temp%></th>
                                            <td><%=oi.getProductName()%></td>
                                            <td>&#8377;<%=oi.getProductDPrice()%></td>
                                            
                                            <td><%=oi.getQuantity()%></td>
                                            <%
                                                int top= ((oi.getQuantity())*(oi.getProductDPrice()));
                                            %>
                                            <td>&#8377;<%=top%></td>
                                        </tr>
                                        <%
                                             }
                                        %>
                                 </tbody>
                            </table>
                            
                        </div>
                           
                      
                        <div class="card-footer">
                            <div class="row">
                            <div class="col-md-3"><h5>Order-Date:</h5><%=or.getOrderDate()%></div>
                            <div class="col-md-2"><h5>Total Items:</h5><%=to%></div>
                            <div class="col-md-2"><h5>Order-Status:</h5><%=or.getStatus()%></div>
                            <div class="col-md-3"><h5>Payment-Status:</h5><%=or.getPayment()%></div>
                            <div class="col-md-2"><h5>Total Price:</h5>&#8377;<%=or.getTotalAmount()%>/-</div>
                            
                        </div>
                        </div>
                        <%
                            }
                        %>
                    
              </div>
                <div class="col-md-3">
                    <div class="card">
                        <div class="card-header"><h3 class="text-center mb-4"> Delivery Address </h3></div>
                         <% 

                             String ip1= request.getParameter("id1");
                             if(ip1!= null){ %>
                        <div class="card-body">
                            <%
                              int j=Integer.parseInt(ip1.trim());
                            Order op= odao.getOrderById(j);
                            %> <h6>
                            <%=op.getDeliveryAddress().getDname()%>
                            <br><!-- comment -->
                            <%=op.getDeliveryAddress().getEmail()%>
                            <br>
                            <%=op.getDeliveryAddress().getPhonenumber()%>
                            <br>
                            <%=op.getDeliveryAddress().getCity()%>
                            <%=op.getDeliveryAddress().getState()%>
                            <%=op.getDeliveryAddress().getPostalCode()%>
                            <br>
                            <%=op.getDeliveryAddress().getDAddress()%>
                            </h6>
                          
                        </div>
                            <div class="card-footer">
                                <b>Payment Id</b>=<%=op.getPaymentId()%>
                            </div>
                        <% } %>
                    </div>
              </div>
            </div>
                            <% }else{ %>
                            <div style=" margin: 0;
                                         padding: 0;
                                         display: flex;
                                         justify-content: center;
                                         align-items: center;
                                         min-height: 100vh;">
                            <div class="emoji-sad">
                                <div class="face">
                                    <div class="eyebrow-left"></div>
                                    <div class="eyebrow-right"></div>
                                    <div class="eye-left"></div>
                                    <div class="eye-right"></div>
                                    <div class="mouth-sad"></div>
                               </div>
                            </div>    <div class="ms-4 fs-5 fw-bolder"> You don't have Order Yet</div></div>
                            
                            
                            <% } %>
        </div>
       
        <%@include file="components/common-model.jsp"%>
    </body>
</html>
