<%-- 
    Document   : AllProduct
    Created on : Aug 19, 2023, 9:22:46 PM
    Author     : 91731
--%>

<%@page import="com.mycompany.easykart.dao.ProductDao"%>
<%@page import="com.mycompany.easykart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.easykart.helper.FactoryProvider"%>
<%@page import="com.mycompany.easykart.entities.User"%>
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
   ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
   List<Product>Plist=pdao.getAllProducts();
   int t=0;
   for(Product pl: Plist){
   t++;
    }
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="components/common_css_js.jsp" %>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            

.button90{
  border: none;
  padding:0;
  background:none;
  border-radius: 5px;
}

.touch:hover {
  transform:scale(1.02);
  box-shadow:1px 1px 3px rgba(0,0,0,0.20), inset 0 0 0 99999px rgba(0,0,0,0.2);
}
 
.edit:hover {
  background: darken( rgb(52, 152, 219), 10%);
}




.touch {
  transition:ease-in-out .2s;
  line-height:20px;
  width:20px;
  padding: 0px;
  text-align: center;
}



.edit:before {
  font-family: FontAwesome;
  display: inline-block;
  font-size:.8rem;
  padding-right:2px;
  background:none;
  color:#FFF;
}



.touch.edit:before {
  width:100%;
  text-align:center;
  font-size:.8rem;
}




.edit {
  background: rgb(52, 152, 219);
  
  &:before {
    content: "\f040";
  }
}
        </style>
    </head>
    <body>
        
        
        <%@include file="components/navbar.jsp" %>
        <%@include file="components/msg.jsp" %>
         <div class="container-fluid">
             <% 
                             if(t >= 1){
                            %>
             
        <div class="row mt-3">
        <div class="col-md-12">
                    
            <div class="card-header"><h3 class="text-center mb-4"> Total Product <%=t%> </h3></div>
                        
                            
                            <div class="card-body">
                            <table class="table table-hover">
                                <thead>
                                       <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Product Name</th>
                                            <th scope="col"></th>
                                            <th scope="col">Category</th>
                                            <th scope="col">Price </th>
                                            <th scope="col"></th>
                                            <th scope="col">Discount</th>
                                            
                                            <th scope="col">Discounted Price</th>
                                            
                                            <th scope="col">Quantity</th>
                                          
                                            <th scope="col">Product Description</th>
                                            <th scope="col"></th>
                                        </tr>
                                </thead>
                                <tbody>
                                 <%
                                           int temp=0;
                                           for(Product Pli: Plist){
                                           temp++;
                                        %>
                                        
                                        <tr>
                                 
                                            <th scope="row"><%=temp%></th>
                                            <td><%=Pli.getpName()%></td>
                                            <td><button class="button90 touch edit" data-bs-toggle="modal" data-bs-target="#PName<%=temp%>" ></button></td>
                                            <td><%=Pli.getCategory().getCategoryTittle()%></td>
                                            <td>&#8377;<%=Pli.getpPrice()%></td>
                                            <td><button class="button90 touch edit" data-bs-toggle="modal" data-bs-target="#Price<%=temp%>" ></button></td>
                                            <td><%=Pli.getpDiscount()%>% &nbsp;<button  class="button90 touch edit" data-bs-toggle="modal" data-bs-target="#Discount<%=temp%>" ></button></td>
                                           
                                            <td>&#8377;<%=Pli.getDiscountedPrice()%> </td>
                                            
                                            <td><%=Pli.getpQuantity()%> &nbsp;<button  class="button90 touch edit" data-bs-toggle="modal" data-bs-target="#Quantity<%=temp%>" ></button></td>
                                            
                                            <td><%=Pli.getpDesc()%></td>
                                            <td><button  class="button90 touch edit" data-bs-toggle="modal" data-bs-target="#ProductDescription<%=temp%>" ></button></td>
                                    
                                 </tr>
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                 
    <div class="modal fade" id="PName<%=temp%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
       
        <form action="EditProductServlet" method="post">
            
            <input type="hidden" name="ProId" value="<%=Pli.getpId()%>">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Change Product Name</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <input type="hidden" name="di" value="pn">
  <div class="mb-3">
    <label for="exampleInputPrice" class="form-label">Enter your modified Product Name</label>
    <input type="text" class="form-control" id="exampleInputPrice" aria-describedby="emailHelp" name="PName">
    <div id="emailHelp" class="form-text">You are changing your Product Name </div>
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
<div class="modal fade" id="Price<%=temp%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
       
        <form action="EditProductServlet" method="post">
            
            <input type="hidden" name="ProId" value="<%=Pli.getpId()%>">
            <input type="hidden" name="di" value="pp">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Change Product Price</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        
  <div class="mb-3">
    <label for="exampleInputPrice" class="form-label">Enter your new Product Price</label>
    <input type="text" class="form-control" id="exampleInputPrice" aria-describedby="emailHelp" name="PPrice">
    <div id="emailHelp" class="form-text">You are changing your Product price </div>
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
                        
   <div class="modal fade" id="Discount<%=temp%>" tabindex="-1" aria-labelledby="Discount" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        
       <form action="EditProductServlet" method="post">
           
            <input type="hidden" name="ProId" value="<%=Pli.getpId()%>">
      <div class="modal-header">
        <h5 class="modal-title" id="Discount">Change Product Discount</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <input type="hidden" name="di" value="pd">
        <div class="mb-3">
    <label for="exampleInputDiscount" class="form-label">Enter your new Product Discount</label>
    <input type="text" class="form-control" id="exampleInputDiscount" aria-describedby="emailHelp" name="PDiscount">
    <div id="emailHelp" class="form-text">You are changing your Product Discount </div>
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



<div class="modal fade" id="Quantity<%=temp%>" tabindex="-1" aria-labelledby="Quantity" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
       
        <form action="EditProductServlet" method="post">
            
            <input type="hidden" name="ProId" value="<%=Pli.getpId()%>">
      <div class="modal-header">
        <h5 class="modal-title" id="Quantity">Change Quantity</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
            <input type="hidden" name="di" value="pq">
      <div class="modal-body">
        <div class="mb-3">
    <label for="exampleInputQuantity" class="form-label">Enter new Quantity of Product</label>
    <input type="text" class="form-control" id="exampleInputQuantity" aria-describedby="emailHelp" name="PQuantity">
    <div id="emailHelp" class="form-text">You are changing your Product Quantity </div>
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

<div class="modal fade" id="ProductDescription<%=temp%>" tabindex="-1" aria-labelledby="ProductDescription" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
        
        <form action="EditProductServlet" method="post">
            
            <input type="hidden" name="ProId" value="<%=Pli.getpId()%>">
      <div class="modal-header">
        <h5 class="modal-title" id="ProductDescription">Change Product Description</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
            <input type="hidden" name="di" value="pdes">
      <div class="modal-body">
        <div class="mb-3">
    <label for="exampleInputDescription" class="form-label">Enter your new Product Description</label>
    <input type="text" class="form-control" id="exampleInputDescription" aria-describedby="emailHelp" name="PDescription">
    <div id="emailHelp" class="form-text">You are changing your Product Description </div>
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
                                 
                                 
                                 
                                 
                                 
                                 
                                 
                                        
                                   <% } %>     
                                 </tbody>
                            </table>
                            
                        </div>
                       
                        
              </div>
        </div>
        
                        
 
      <%
            }
                        %>
                    
</div>                      

             
                        <%@include file="components/common-model.jsp" %>
        
    </body>
</html>
