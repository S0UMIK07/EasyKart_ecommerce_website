/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */



/* global cart, item */

function add_to_cart(pid,pname,pprice){
    let cart=localStorage.getItem("cart");
    if(cart == null){
        let products=[];
        let product={pId:pid,pName:pname,pQuantity:1,pPrice:pprice};
        products.push(product);
        localStorage.setItem("cart",JSON.stringify(products));
        showToast("Item is added to Cart");
    }else{
        let pCart=JSON.parse(cart);
        let oldProduct=pCart.find((item)=>item.pId==pid);
                if(oldProduct){
                    oldProduct.pQuantity=oldProduct.pQuantity+1;
                    pCart.map((item)=>{
                        if(item.pId==oldProduct.pId){
                            item.pQuantity=oldProduct.pQuantity;
                        }
                    });
                    localStorage.setItem("cart",JSON.stringify(pCart));
                     showToast( oldProduct.pName + " Quantity is Increased");
                }else{
                    
                    let product={pId:pid,pName:pname,pQuantity:1,pPrice:pprice};
                    pCart.push(product);
                    localStorage.setItem("cart",JSON.stringify(pCart));
                     showToast("Product is added to the cart");
                }
        
    }
    update_Cart();  
}

function update_Cart(){
    let cartstring=localStorage.getItem("cart");
    let cart=JSON.parse(cartstring);
    if(cart==null||cart.length==0){
        console.log("cart is empty");
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h3>Cart does not has items<h3>");
        $(".checkout").attr('disabled',true);
    }else{
        console.log(cart);
        $(".cart-items").html(`(${cart.length})`);
        let table=`
         <table class="table table-hover">
          <thead>
    <tr>
      <th scope="col">Item Name</th>
      <th scope="col" class="text-center">Quantity</th>
       
      <th scope="col" class="text-center">Price</th>
      <th scope="col">Total Price</th>
      <th scope="col">Action</th>  
    </tr>
  </thead>
       
`;
        let totalPrice=0;
        cart.map((item)=>{
            table+=`
            <tr>
            <td> ${item.pName}</td>
            <td> <div class="quantity-controls">
                    <button onclick="changeQuantity(${item.pId}, -1)" class="cssCircle minusSign"><b> &#8211;</b></button>
                    &nbsp;
                    ${item.pQuantity}
                    &nbsp;
                    <button onclick="changeQuantity(${item.pId}, 1)" class="cssCircle plusSign"><b>  &#43;</b></button>
           </div> </td>
           
            <td> ${item.pPrice}</td>
            <td> ${item.pPrice * item.pQuantity}</td>
            <td><button onclick="deleteIteCart(${item.pId})" class="btn btn-danger btn-sm">Remove</button></td>
            </tr>
`;
            totalPrice+=item.pQuantity * item.pPrice;
            
        });
        
       table=table+`</table> 
<h5 class='text-end'>Total Price: ${totalPrice}</h5>`;
       $(".cart-body").html(table);
        
$(".checkout").attr('disabled',false);
$("#TotalValue").val(totalPrice);
let cartItemsContainer = document.getElementById("cartItems");

    // Loop through each cart item and create hidden input fields for them
    cart.map((item) => {
        // Create a hidden input element
        let cartItemInput = document.createElement("input");
        cartItemInput.type = "hidden";
        cartItemInput.name = "cartItems[]"; // Use '[]' to indicate an array of values
        cartItemInput.value = JSON.stringify(item); // Convert the cart item to a JSON string

        // Append the hidden input to the container
        cartItemsContainer.appendChild(cartItemInput);
    });


}
}

function deleteIteCart(pid1) {
    let cart = JSON.parse(localStorage.getItem('cart'));
    let newCart = cart.filter((item) => item.pId !== pid1);

    localStorage.setItem('cart', JSON.stringify(newCart));
    update_Cart();
     showToast("Item is removed from Cart");
}


function changeQuantity(pid, change) {
    let cart = JSON.parse(localStorage.getItem("cart"));
    let product = cart.find((item) => item.pId === pid);

    if (product) {
        product.pQuantity += change;

        if (product.pQuantity <= 0) {
            cart = cart.filter((item) => item.pId !== pid);
        }

        localStorage.setItem("cart", JSON.stringify(cart));
        update_Cart();
    }
}

$(document).ready(function(){
    update_Cart();
});



 function showToast(content){
            $('#toast').addClass("display");
            $('#toast').html(content);
            setTimeout(()=>{
                $('#toast').removeClass("display");
            },2000);
        }

function goToCheckOut(){
    window.location="checkOut.jsp";
}







