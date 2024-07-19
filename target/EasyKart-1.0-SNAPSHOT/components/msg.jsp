<%-- 
    Document   : msg
    Created on : Aug 6, 2023, 1:39:41 AM
    Author     : 91731
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
    </head>
    <body>
        <svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
  <symbol id="check-circle-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zm-3.97-3.03a.75.75 0 0 0-1.08.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-.01-1.05z"/>
  </symbol>
  <symbol id="info-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M8 16A8 8 0 1 0 8 0a8 8 0 0 0 0 16zm.93-9.412-1 4.705c-.07.34.029.533.304.533.194 0 .487-.07.686-.246l-.088.416c-.287.346-.92.598-1.465.598-.703 0-1.002-.422-.808-1.319l.738-3.468c.064-.293.006-.399-.287-.47l-.451-.081.082-.381 2.29-.287zM8 5.5a1 1 0 1 1 0-2 1 1 0 0 1 0 2z"/>
  </symbol>
  <symbol id="exclamation-triangle-fill" fill="currentColor" viewBox="0 0 16 16">
    <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
  </symbol>
</svg>
        <%
            String message=(String)session.getAttribute("message");
            if(message == "SuccessRegister"){
            %>
            <div class="alert alert-success d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
  <div>
    Registered Successfully
  </div>
</div>
            <%
            }
else if(message=="FailureRegister"){
%>
<div class="alert alert-danger d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
  <div>
    Something Went Wrong
  </div>
</div>
<%
}
else if(message=="invalidInput")
{
%>
<div class="alert alert-danger d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
  <div>
    Wrong Credentials
  </div>
</div>
<%
    }
    else if(message=="AlreadyRegistered"){
       %>   
       <div class="alert alert-warning d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Warning:"><use xlink:href="#exclamation-triangle-fill"/></svg>
  <div>
    Email id is already registered
  </div>
</div>
            

<%
}
 else if(message=="userTypeNotFound"){
       %>   
       <div class="alert alert-warning d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Warning:"><use xlink:href="#exclamation-triangle-fill"/></svg>
  <div>
    User Type not Found
  </div>
</div>
            

<%
    }
else if(message=="LoginFirst"){
       %>   
       <div class="alert alert-warning d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Warning:"><use xlink:href="#exclamation-triangle-fill"/></svg>
  <div>
    You have to Login first
  </div>
</div>
            

<%
    }
else if(message=="notAllowed"){
       %>   
       <div class="alert alert-warning d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Warning:"><use xlink:href="#exclamation-triangle-fill"/></svg>
  <div>
    You are not allowed to access this page
  </div>
</div>
            

<%
    }
else if(message=="addcategorySuccessfull"){
       %>   
       <div class="alert alert-success d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
  <div>
      <%
          int catid=(int)session.getAttribute("CategoryIdMessage");
      %>
      Category is Added SuccessFully and the Category Id is: <%= catid %>
  </div>
</div>
  
<%
    }
else if(message=="ProductSaved"){
       %>   
       <div class="alert alert-success d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
  <div>
    Product Saved Successfully
  </div>
</div>
            

<%
    }
else if(message=="OStatusChangedS"){
       %>   
       <div class="alert alert-success d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
  <div>
    Order Status Changed Successfully
  </div>
</div>
            

<%
    }
else if(message=="OStatusChangedF"){
       %>   
       <div class="alert alert-danger d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
  <div>
    Something Went Wrong
  </div>
</div>
            

<%
    }
else if(message=="OPaymentStatusChangedS"){
       %>   
       <div class="alert alert-success d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
  <div>
    Payment Status Changed Successfully
  </div>
</div>
            

<%
    }
else if(message=="OPaymentStatusChangedF"){
       %>   
       <div class="alert alert-danger d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
  <div>
    Something Went Wrong
  </div>
</div>
            

<%
    }
else if(message=="nameChangeS"){
       %>   
       <div class="alert alert-success d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
  <div>
    UserName Changed Successfully (You have to logout to display the changes)
  </div>
</div>
            

<%
    }
else if(message=="nameChangeF"){
       %>   
       <div class="alert alert-danger d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
  <div>
    Failed to change the username
  </div>
</div>
            

<%
    }
else if(message=="PhoneChangeS"){
       %>   
       <div class="alert alert-success d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
  <div>
    Phone Number Changed Successfully (You have to logout to display the changes)
  </div>
</div>
            

<%
    }
else if(message=="PhoneChangeF"){
       %>   
       <div class="alert alert-danger d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
  <div>
    Failed to changed the Phone Number 
  </div>
</div>
            

<%
    }
else if(message=="PasswordChangeS"){
       %>   
       <div class="alert alert-success d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
  <div>
    Password Changed Successfully (You have to logout to display the changes)
  </div>
</div>
            

<%
    }
else if(message=="PasswordChangeF"){
       %>   
       <div class="alert alert-danger d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
  <div>
    Failed to change the Password
  </div>
</div>
            

<%
    }
else if(message=="AddressChangeS"){
       %>   
       <div class="alert alert-success d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
  <div>
    Address Changed Successfully (You have to logout to display the changes)
  </div>
</div>
            

<%
    }
else if(message=="AddressChangeF"){
       %>   
       <div class="alert alert-danger d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
  <div>
    Failed to change the Address
  </div>
</div>
            

<%
    }
else if(message=="ProductSavedSuccess"){
       %>   
       <div class="alert alert-success d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
  <div>
    Product attribute changed successfully;
  </div>
</div>
            

<%
    }
else if(message=="ProductSavedFail"){
       %>   
       <div class="alert alert-danger d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
  <div>
    Failed to modify the Product
  </div>
</div>
            

<%
    }

else if(message=="FailCheckOut"){
       %>   
       <div class="alert alert-danger d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
  <div>
      <%
          String m=(String)session.getAttribute("FailPName");
          int m1=(int)session.getAttribute("FailPDifference");
      %>
      We can not Process Your Request (You have to decrease this <%=m%> Product quantity by <%=m1%>)
  </div>
</div>
            

<%
    }
else if(message=="OrderSuccess"){
       %>   
       <div class="alert alert-success d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Success:"><use xlink:href="#check-circle-fill"/></svg>
  <div>
    We are thrilled that you've chosen to shop with us. Your order has been successfully placed and is now being processed. ;
  </div>
</div>
            

<%
    }
else if(message=="PaymentReverse"){
       %>   
       <div class="alert alert-danger d-flex align-items-center" role="alert">
  <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
  <div>
    Product is out of stock Contact us for refund 
  </div>
</div>
            

<%
    }
            session.removeAttribute("order_id");

            session.removeAttribute("message");
            %>
    </body>
</html>
