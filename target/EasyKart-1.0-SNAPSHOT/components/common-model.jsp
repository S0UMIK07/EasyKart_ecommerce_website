<%-- 
    Document   : common-model
    Created on : Aug 16, 2023, 6:34:20 PM
    Author     : 91731
--%>
<%@include file="common_css_js.jsp" %>
<!DOCTYPE html>
<link rel="stylesheet" href="css/style.css"/>
<!-- Modal -->
<body>
<div class="modal fade" id="add-to-cart" tabindex="-1" aria-labelledby="add-to-cart" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header" style="background: linear-gradient(to bottom, lightcoral, #FFA500);
        color: lightcoral;">
        <h5 class="modal-title" id="add-to-cart" style="color: black">Your Cart </h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        

          <div class="cart-body">
              
          </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary checkout" onclick="goToCheckOut()">Check Out</button>
      </div>
    </div>
  </div>
</div>
    
    <div id="toast">This is our custom toast</div>
</body>
</html>
   
