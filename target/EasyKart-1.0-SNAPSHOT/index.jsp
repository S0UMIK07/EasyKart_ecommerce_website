<%-- 
    Document   : index
    Created on : Jul 27, 2023, 8:16:36 PM
    Author     : 91731
--%>

<%@page import="com.mycompany.easykart.helper.Helper"%>
<%@page import="com.mycompany.easykart.entities.Category"%>
<%@page import="com.mycompany.easykart.dao.CategoryDao"%>
<%@page import="com.mycompany.easykart.dao.ProductDao"%>
<%@page import="com.mycompany.easykart.entities.Product"%>
<%@page import="com.mycompany.easykart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="components/common_css_js.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <%@include file="css/addToCart.jsp" %>
       
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <%@include file="components/msg.jsp" %>
        <div class="container-fluid">
        <div class="row mt-3 mx-2">
            <%
                String cate=request.getParameter("id");
                ProductDao dao=new ProductDao(FactoryProvider.getFactory());
                List<Product>list=null;
                if(cate==null || cate.trim().equals("all")){
                list=dao.getAllProducts();
                }else{
                int cid=Integer.parseInt(cate.trim());
                list=dao.getProductsById(cid);
                }
                
                CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                List<Category>clist=cdao.getCategory();
            %>
            <div class="col-md-2">
                <div class="list-group">
                    <a href="index.jsp?id=all" class="list-group-item list-group-item-action active" style="background: linear-gradient(to bottom, lightcoral, #FFA500);
        color: lightcoral; color: black; border-color:lightcoral " aria-current="true">
    All Products
  </a>
                    <%
                    for(Category cat:clist)
                    {
                %>
                <a href="index.jsp?id=<%=cat.getCategoryId()%>" class="list-group-item list-group-item-action"><%=cat.getCategoryTittle()%></a>
                <%   
                    }
                %> 
  
</div>
                
            </div>
            <div class="col-md-10">
                <div class="row mt-1">
                    <div class="col-md-12">
                        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-3">
                            <%
                                for(Product p:list){
                            %>
                            <div class="col">
                                <div class="hover-div">
                                <div class="card h-100">
        <img src="img/Product/<%=p.getpPhoto()%>" class="card-img-top" style="height: 125px;width: 125px; margin-left: auto;
  margin-right: auto;" alt="Image not found">
      <div class="card-body">
        <h5 class="card-title"><%=p.getpName()%></h5>
        <p class="card-text">
            <%=Helper.get10Words(p.getpDesc())%>
        </p>
      </div>
        <div class="card-footer">
            <div class="row">
                <div class="col-md-6">
                    <% if(p.getpQuantity()>0){
                    
                    %>
            <button class="soumik1" onclick="add_to_cart(<%=p.getpId()%>, '<%=p.getpName()%>' ,<%=p.getDiscountedPrice()%>)">
                <span class="soumik2">Add to cart</span>
    <span class="soumik3">
        <svg class="soumik4" viewBox="0 0 36 26">
            <polyline points="1 2.5 6 2.5 10 18.5 25.5 18.5 28.5 7.5 7.5 7.5"></polyline>
            <polyline points="15 13.5 17 15.5 22 10.5"></polyline>
        </svg>
    </span>
</button>
                   <% }else{ %>
                   
                   <button class="soumik1" onclick="showToast('Sorry! The Item is not Currently Avilable')">
                       <span> <b>+</b> Add to cart</span>
    
</button> 
    
    <% } %>
                </div>
    <div class="col-md-6">
            <div class="button-container">
  <div class="price-container">
    <span class="original-price">&#8377;<%=p.getpPrice()%></span>
    <span class="discount-percentage">-<%= p.getpDiscount()%>%</span>
    <span class="discounted-price">&#8377;<%=p.getDiscountedPrice()%></span>
  </div>
</div>
    </div>
            </div>
        </div>
    </div>
                            </div>
                            </div>
                            <%
                                }
if(list.size()==0){
out.println("<h3>There is no Product currently Present Here</h3>");
}
                            %>

  </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
                            <script>
                                document.querySelectorAll('.soumik1').forEach(button => button.addEventListener('click', e => {
    if(!button.classList.contains('loading')) {

        button.classList.add('loading');

        setTimeout(() => button.classList.remove('loading'), 3700);

    }
    e.preventDefault();
}));


  


                            </script>
                            <%@include file="components/common-model.jsp" %>
    </body>
</html>
