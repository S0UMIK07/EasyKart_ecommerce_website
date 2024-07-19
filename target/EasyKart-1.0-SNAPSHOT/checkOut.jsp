<%-- 
    Document   : checkOut
    Created on : Aug 17, 2023, 7:51:32 PM
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
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <%@include file="components/msg.jsp"%>
        <div class="container-fluid">
            <div class="row mt-5">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-4">Your Selected Items</h3>
                            <div class="cart-body">
                                
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mb-4">Enter your Delivery Address </h3>
                            <form action="DeliveryAddressServlet" method="post">
                                <input type="hidden" name="useremail" value="<%=user.getUserEmail()%>">
                                <input type="hidden" id="currentDateTime" name="currentDateTime" value="">
                                <input type="hidden" id="TotalValue" name="TotalVal" value="">
                                <input type="hidden" name="status" value="Pending">
                                <input type="hidden" name="Payment" value="Pending">
                                <input type="hidden" name="PaymentId" value="notPaid">
                                <div id="cartItems">
    </div>
                          
 <div class="mb-3">
    <label for="exampleInputName" class="form-label">Enter your Name</label>
    <input type="text" class="form-control" id="exampleInputName" placeholder="Name" name="DName" required>
  
  </div>
                                 <div class="mb-3">
    <label for="exampleInputEmail1" class="form-label">Enter your Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email" name="DEmail" required>
  
                                </div>
                                 <div class="mb-3">
    <label for="exampleInputPhoneNumber" class="form-label">Enter your Phone Number</label>
    <input type="text" class="form-control" id="exampleInputPhoneNumber" placeholder="Phone Number" name="DPhone" required>
  
                                </div>
                                <div class="mb-3">
                                     <div class="row g-3">
  <div class="col-sm-4">
      <label for="exampleInputCity" class="form-label">Enter your City</label>
      <input type="text" class="form-control" placeholder="City" aria-label="City" id="exampleInputCity" name="DCity" required>
  </div>
  <div class="col-sm">
      <label for="exampleInputState" class="form-label">Enter your State</label>
      <input type="text" class="form-control" placeholder="State" aria-label="State" id="exampleInputState" name="DState" required>
  </div>
  <div class="col-sm">
      <label for="exampleInputPin" class="form-label">Enter your Pin Code</label>
      <input type="text" class="form-control" placeholder="Pin" aria-label="Pin" id="exampleInputPin" name="DPin" required>
  </div>
</div>
                                </div>
                                 <div class="mb-3">
    <label for="exampleInputAddress" class="form-label">Enter your Delivery Address</label>
    <textarea style="height: 100px" class="form-control" id="exampleInputAddress" placeholder="Address" name="DAddress" required></textarea>
  
                                </div>
                                <div class="row g-3">
                                <div class="col-sm-6 text-center">
                                <button type="reset" class="btn btn-primary">Clear</button>
                                </div>
                                <div class="col-sm-6 text-center">
                                <button type="submit"  class="btn btn-primary checkout">Place Order</button>
                                </div>
                                </div>
</form>
                            
                        </div>
                    </div>
              </div>
            </div>
        </div>
        <%@include file="components/common-model.jsp"%>
        <script>
    // Function to set the current date and time in the hidden input field
    function setCurrentDateTime() {
        var now = new Date();
        var formattedDateTime = now.toISOString(); // Convert to ISO 8601 format
        document.getElementById("currentDateTime").value = formattedDateTime;
    }

    // Call the function when the form is loaded
    window.onload = function() {
        setCurrentDateTime();
    };
</script>

    </body>
</html>
