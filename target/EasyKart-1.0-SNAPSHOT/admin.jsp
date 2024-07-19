<%-- 
    Document   : admin
    Created on : Aug 6, 2023, 9:09:30 PM
    Author     : 91731
--%>

<%@page import="com.mycompany.easykart.dao.UserDao"%>
<%@page import="com.mycompany.easykart.dao.ProductDao"%>
<%@page import="com.mycompany.easykart.entities.Category"%>
<%@page import="com.mycompany.easykart.dao.CategoryDao"%>
<%@page import="com.mycompany.easykart.helper.FactoryProvider"%>
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
    CategoryDao categoryDa=new CategoryDao(FactoryProvider.getFactory());
    List<Category>cate=categoryDa.getCategory();
    
    ProductDao pDao=new ProductDao(FactoryProvider.getFactory());
    long pCount=pDao.getProductCount();
    
    UserDao uDao= new UserDao(FactoryProvider.getFactory());
    long uCount= (uDao.getUserCount())-1;
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include  file="css/addToCart.jsp" %>
        <%@include file="components/common_css_js.jsp" %>
       
       
       
    </head>
    <body style="background-color: #fff8e4;">
        <%@include file="components/navbar.jsp" %>
      
        <div class="container">
            <div class="row mt-4">
                <div class="container-fluid">
                <%@include file="components/msg.jsp" %>
            </div>
                <div class="col-md-4">
                    <section class="hover-div">
                        <a href="AllUser.jsp" style="text-decoration: none; ">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img  style="max-width: 125px;" src="img/team.png" class="img-fluid rounded-circle" alt="users">
                            </div>
                            <h3><%=uCount%></h3>
                            <h2 class="text-uppercase text-muted">Users</h2>
                        </div>
                    </div>
                        </a>
                    </section>
                </div>
                <div class="col-md-4">
                     <section class="hover-div">
                         <a href="AllCategory.jsp" style="text-decoration: none; ">
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img  style="max-width: 125px;" src="img/options.png" class="img-fluid rounded-circle" alt="users">
                            </div>
                            <h3><%=cate.size()%></h3>
                            <h2 class="text-uppercase text-muted">Categories</h2>
                        </div>
                    </div>
                         </a>
                     </section>    
                </div>
                <div class="col-md-4">
                     <section class="hover-div">
                         <a href="AllProduct.jsp" style="text-decoration: none; ">
                         <div class="card" onclick="allProduct()">
                        <div class="card-body text-center">
                            <div class="container">
                                <img  style="max-width: 125px;" src="img/products.png" class="img-fluid rounded-circle" alt="users">
                            </div>
                            <h3><%=pCount%></h3>
                            <h2 class="text-uppercase text-muted">Products</h2>
                        </div>
                    </div>
                         </a>
                     </section>    
                </div>
                
                
            </div>
            <div class="row mt-4">
                <div class="col-md-6">
                     <section class="hover-div">
                    <div class="card" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img  style="max-width: 125px;" src="img/menu.png" class="img-fluid rounded-circle" alt="users">
                            </div>
                            <h3><%=cate.size()%></h3>
                            <p>click here to add category</p>
                            <h2 class="text-uppercase text-muted">Add Category</h2>
                        </div>
                    </div>
                     </section>
                </div>
                <div class="col-md-6">
                     <section class="hover-div">
                    <div class="card" data-bs-toggle="modal" data-bs-target="#exampleModal1">
                        <div class="card-body text-center">
                            <div class="container">
                                <img  style="max-width: 125px;" src="img/add-product.png" class="img-fluid rounded-circle" alt="users">
                            </div>
                            <h3><%=pCount%></h3>
                            <p>click here to add product</p>
                            <h2 class="text-uppercase text-muted">Add Product</h2>
                        </div>
                    </div>
                     </section>
                </div>
            </div>
        </div>
        
        <!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header" style="background: linear-gradient(to bottom, lightcoral, #FFA500);
        color: lightcoral;">
            <h5 class="modal-title" id="exampleModalLabel" style="color: black">Fill Category Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <form action="ProductOperationServlet" method="post">
              <input type="hidden" name="operation" value="addCategory">
  <div class="mb-3">
      <input type="text" class="form-control" placeholder="Enter category title" name="catTitle">
  </div>
  <div class="mb-3">
      <textarea style="height: 125px" class="form-control" placeholder="Enter category Description" name="catDescription"></textarea>
  </div>
              <div class="modal-footer">
                  <button type="submit" class="btn btn-primary">Add Category</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
  
</form>
       
      </div>
      
    </div>
  </div>
</div>


<!-- Modal -->
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
        <div class="modal-header" style="background: linear-gradient(to bottom, lightcoral, #FFA500);
        color: lightcoral;">
            <h5 class="modal-title" id="exampleModalLabel" style="color: black">Fill Product Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
              <input type="hidden" name="operation" value="addProduct">
  <div class="mb-3">
      <input type="text" class="form-control" placeholder="Enter Product Name" name="proTitle">
  </div>
  <div class="mb-3">
      <textarea style="height: 125px" class="form-control" placeholder="Enter Product Description" name="proDescription"></textarea>
  </div>
               <div class="mb-3">
      <input type="number" class="form-control" placeholder="Enter Product Price" name="proPrice">
  </div>
               <div class="mb-3">
      <input type="number" class="form-control" placeholder="Enter Product Discount" name="proDiscount">
  </div>
               <div class="mb-3">
      <input type="number" class="form-control" placeholder="Enter Product Quantity" name="proQuantity">
  </div>
 <select  name="catId" class="form-select mb-3" aria-label="Default select example">
  <option selected>Select Product Category</option>
  <%for(Category c:cate){
  %>
  <option value="<%=c.getCategoryId()%>"><%=c.getCategoryTittle()%></option>
  <%}%>
</select>
               <div class="mb-3">
  <label for="formFile" class="form-label">Select Product Photo</label>
  <input class="form-control" type="file" id="formFile" name="proPhoto">
</div>
              <div class="modal-footer">
                  <button type="submit" class="btn btn-primary">Add Product</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
  
</form>
       
      </div>
      
    </div>
  </div>
</div>
        
  <%@include file="components/common-model.jsp" %>
  
    </body>
</html>
