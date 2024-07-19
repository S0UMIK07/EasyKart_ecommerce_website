<%-- 
    Document   : payment
    Created on : Sep 3, 2023, 8:56:42 PM
    Author     : 91731
--%>


<%@page import="com.mycompany.easykart.entities.OrderItem"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.easykart.dao.OrderItemDao"%>
<%@page import="com.mycompany.easykart.entities.Order"%>
<%@page import="com.mycompany.easykart.dao.OrderDao"%>
<%@page import="com.mycompany.easykart.helper.FactoryProvider"%>
<%@page import="com.mycompany.easykart.helper.FactoryProvider"%>
<%@page import="com.mycompany.easykart.entities.User"%>
<!DOCTYPE html>
<%
    User user=(User)session.getAttribute("current-user");
    Integer orderi=(Integer)session.getAttribute("order_id");
    if(user==null){
    session.setAttribute("message", "LoginFirst");
    response.sendRedirect("login.jsp");
    return;
    }else if(orderi==null){
    session.setAttribute("message", "FailureRegister");
    response.sendRedirect("checkOut.jsp");
    }
    else
    {
   
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

        
       <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
       
  
    </head>
    
    <body>
        <%@include file="components/navbarpayment.jsp" %>
        <%
                    int orderid=0;
                    orderid=(int)session.getAttribute("order_id");
                    
                
                    OrderDao odao=new OrderDao(FactoryProvider.getFactory());
                    Order order=odao.getOrderById(orderid);
                    
                %>
        <div class="row-md-4">
            <div class="col-md-12">
                <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-4">Your Selected Items(<b>You are in payment page do not refresh the page</b>)</h3>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Product Name</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Quantity</th>
                                        <th scope="col">total Price</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        OrderItemDao orderItem=new OrderItemDao(FactoryProvider.getFactory());
                                        List<OrderItem> oItem= orderItem.getOrderItemByOrderId(orderid);
                         
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
                                        <h2 style="text-align: center">Total Price = &#8377;<%=order.getTotalAmount()%></h2>
                        </div>
                    </div>
                
                
            </div>
        </div>
                        <br>
                        <form id="payment-form" style="text-align: center" method="post">
    <input type="hidden" id="amount" name="amount" value="<%=order.getTotalAmount()%>">
    <input type="hidden" id="name" name="name" value="<%=user.getUserName()%>">
    <input type="hidden" id="phone" name="phone" value="<%=user.getUserPhone()%>">
    <input type="hidden" id="email" name="email" value="<%=user.getUserEmail()%>">
    <button type="submit" class="btn btn-primary btn-lg">Pay</button>
</form>

    <script>
document.getElementById("payment-form").addEventListener("submit", function (event) {
    event.preventDefault(); 
    var xhr = new XMLHttpRequest();
    var amount = document.getElementById("amount").value;
    amount = amount * 100;
    var name = document.getElementById("name").value;
    var phone = document.getElementById("phone").value;
    var email = document.getElementById("email").value;

  
    var options = {
        key: "rzp_test_KUTwsbSS43Z0UV",
        amount: amount, 
        currency: "INR",
        name: "EasyKart",
        description: "Payment for your product/service",
        handler: function (response) {
           var PaymentID = response.razorpay_payment_id;
            swal({
                title: "Good job!",
                text: "Your Order Placed Successfully",
                icon: "success",
                buttons: {
                    confirm: "OK",
                },
            }).then((value) => {
                
                    localStorage.clear();
                    xhr.open("POST", "EditPaymentByUserServlet", true); 
                    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                    var data = "userId=" + encodeURIComponent('<%=user.getUserId()%>') +
                               "&orderId=" + encodeURIComponent('<%=orderid%>') +
                               "&paymentId=" + encodeURIComponent(PaymentID);
                    xhr.send(data);
                              
                    window.location = "index.jsp";
                    //window.location.reload();
                    
            });

        },

        prefill: {
            name: name,
            email: email,
            contact: phone
            
        }
    };


    var rzp = new window.Razorpay(options);

    rzp.open();
});




</script>

                                           
    </body>
</html>
<%}%>