/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.easykart.servlets;

import com.mycompany.easykart.dao.ProductDao;
import com.mycompany.easykart.dao.UserDao;
import com.mycompany.easykart.entities.DeliveryAddress;
import com.mycompany.easykart.entities.Order;
import com.mycompany.easykart.entities.OrderItem;
import com.mycompany.easykart.entities.Product;
import com.mycompany.easykart.entities.User;
import com.mycompany.easykart.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import org.hibernate.Session;
import org.hibernate.Transaction;


import org.json.JSONException;
import org.json.JSONObject;
/**
 *
 * @author 91731
 */
public class DeliveryAddressServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String name=request.getParameter("DName");
            String demail=request.getParameter("DEmail");
            String Pnumber=request.getParameter("DPhone");
            String City=request.getParameter("DCity");
            String State=request.getParameter("DState");
            String Pcode=request.getParameter("DPin");
            String Address=request.getParameter("DAddress");
            String user_email=request.getParameter("useremail");
            String orderDate = request.getParameter("currentDateTime");
            int totalAmount=Integer.parseInt(request.getParameter("TotalVal"));
            String status = request.getParameter("status");
            String PaymentStatus = request.getParameter("Payment");
            String PaymentId = request.getParameter("PaymentId");
            UserDao userDao=new UserDao(FactoryProvider.getFactory());
            User newuser=userDao.getUserByEmail(user_email);
            String[] cartItems = request.getParameterValues("cartItems[]");
            
            
            
            
            
            
            int t1=0,d1=0;
            String s1=null;
            for (int i1 = 0; i1 < (cartItems.length/3); i1++) {
                 String cartItemJson1 = cartItems[i1];
    try {
        // Parse JSON string to get product details
        JSONObject cartItemObject1 = new JSONObject(cartItemJson1);
        int pId1 = cartItemObject1.getInt("pId");
        ProductDao productDao1=new ProductDao(FactoryProvider.getFactory());
        Product product1=productDao1.getProductByid(pId1);
        int pQuantity1 = cartItemObject1.getInt("pQuantity");
        if(pQuantity1>product1.getpQuantity()){
            s1=product1.getpName();
            d1=pQuantity1-product1.getpQuantity();
            t1++;
            break;
        }
    } catch (JSONException e) {
        // Handle JSON parsing exception
        e.printStackTrace();
    }
}
            
            
            
            
            
            
            if(t1==0){
                int t2=0;
            
            try (Session session = FactoryProvider.getFactory().openSession()) {
                Transaction tx= session.beginTransaction();
              
                DeliveryAddress deliveryAddress=new DeliveryAddress();
                Order order=new Order();
                deliveryAddress.setCity(City);
                deliveryAddress.setDAddress(Address);
                deliveryAddress.setDname(name);
                deliveryAddress.setEmail(demail);
                deliveryAddress.setPhonenumber(Pnumber);
                deliveryAddress.setPostalCode(Pcode);
                deliveryAddress.setState(State);
                deliveryAddress.setUser(newuser);
                session.save(deliveryAddress);
                order.setDeliveryAddress(deliveryAddress);
                order.setOrderDate(orderDate);
                order.setStatus(status);
                order.setTotalAmount(totalAmount);
                order.setUser(newuser);
                order.setPayment(PaymentStatus);
                order.setPaymentId(PaymentId);
                session.save(order);
                
                
                
               for (int i = 0; i < cartItems.length/3; i++) {
                 String cartItemJson = cartItems[i];
    try {
        // Parse JSON string to get product details
        JSONObject cartItemObject = new JSONObject(cartItemJson);
        int pId = cartItemObject.getInt("pId");
        ProductDao productDao=new ProductDao(FactoryProvider.getFactory());
        Product product=productDao.getProductByid(pId);
        int pQuantity = cartItemObject.getInt("pQuantity");
        String pName=cartItemObject.getString("pName");
        int pPrice=cartItemObject.getInt("pPrice");
        OrderItem orderItem=new OrderItem();
        orderItem.setProduct(product);
        orderItem.setQuantity(pQuantity);
        orderItem.setOrder(order);
        orderItem.setProductName(pName);
        orderItem.setProductDPrice(pPrice);
        session.save(orderItem);
        // Create OrderItem instances and persist in the database
        // ... (your code to create OrderItem and associate it with Order)
    } catch (JSONException e) {
        // Handle JSON parsing exception
        e.printStackTrace();
    }
}
                
               
                
                tx.commit();
                t2=order.getOrderId();
            }
            
            HttpSession session=request.getSession();
            session.setAttribute("order_id", t2);
            response.sendRedirect("payment.jsp");
            
            }else{
                
                HttpSession session=request.getSession();
                session.setAttribute("message", "FailCheckOut");
                session.setAttribute("FailPName", s1);
                session.setAttribute("FailPDifference", d1);
                response.sendRedirect("checkOut.jsp");
                
            }
            
            
            
            
             
        }
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
