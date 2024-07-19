/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.easykart.servlets;


import com.mycompany.easykart.dao.EditProductDao;
import com.mycompany.easykart.dao.OrderDao;
import com.mycompany.easykart.entities.OrderItem;
import com.mycompany.easykart.entities.Product;
import com.mycompany.easykart.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import org.json.JSONException;
import org.json.JSONObject;


/**
 *
 * @author 91731
 */
public class EditPaymentByUserServlet extends HttpServlet {

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
            int t1,t2;
            t1=0;
            t2=0;
           int userId = Integer.parseInt(request.getParameter("userId"));
           int orderId = Integer.parseInt(request.getParameter("orderId"));
           String paymentId = request.getParameter("paymentId");
           OrderDao odao =new OrderDao(FactoryProvider.getFactory());
           t1=odao.UpdatePaymentID(orderId, userId, paymentId);
           t2=odao.UpdatePaymentStatus(orderId, userId, "Paid");
        
           List<OrderItem> oil = odao.getOrderItemsByOrderId(orderId);
           EditProductDao epd=new EditProductDao(FactoryProvider.getFactory());
           int s=0;
           for(OrderItem oItemList: oil){
               if(oItemList.getProduct().getpQuantity()<oItemList.getQuantity()){
                   s++;
               break;
           }
           }
           HttpSession session=request.getSession();
           if(s!=0){
           for(OrderItem oItemList: oil){
               int s1=epd.updateProductQuantityByProductID(oItemList.getProduct().getpId(), (oItemList.getProduct().getpQuantity()-oItemList.getQuantity()));
           }
           }else{
               session.setAttribute("message", "PaymentReverse");
           }
           
           if(t1>0 && t2>0){
               
               session.setAttribute("message", "OrderSuccess");
           }
           else{
               session.setAttribute("message", "FailureRegister");
             
               
           }
           session.removeAttribute("order_id");
            response.sendRedirect("index.jsp");
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
