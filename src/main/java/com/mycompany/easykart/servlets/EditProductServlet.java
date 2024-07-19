/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.easykart.servlets;
import com.mycompany.easykart.dao.EditProductDao;
import com.mycompany.easykart.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


/**
 *
 * @author 91731
 */
public class EditProductServlet extends HttpServlet {

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
            String d=request.getParameter("di");
            int t=0;
            if(d.trim().equals("pn")){
                String pname=request.getParameter("PName");
                int Pid=Integer.parseInt(request.getParameter("ProId"));
                EditProductDao editProductDao=new EditProductDao(FactoryProvider.getFactory());
                t=editProductDao.updateProductNameByProductID(Pid, pname);
                
            }else if(d.trim().equals("pp")){
                int Pprice=Integer.parseInt(request.getParameter("PPrice"));
                int Pid=Integer.parseInt(request.getParameter("ProId"));
                EditProductDao editProductDao=new EditProductDao(FactoryProvider.getFactory());
                t=editProductDao.updateProductPriceByProductID(Pid, Pprice);
                
            }else if(d.trim().equals("pd")){
                int pdiscount=Integer.parseInt(request.getParameter("PDiscount"));
                int Pid=Integer.parseInt(request.getParameter("ProId"));
                EditProductDao editProductDao=new EditProductDao(FactoryProvider.getFactory());
                t=editProductDao.updateProductDiscountByProductID(Pid, pdiscount);
                
            }else if(d.trim().equals("pq")){
                int pquantity=Integer.parseInt(request.getParameter("PQuantity"));
                int Pid=Integer.parseInt(request.getParameter("ProId"));
                EditProductDao editProductDao=new EditProductDao(FactoryProvider.getFactory());
                t=editProductDao.updateProductQuantityByProductID(Pid, pquantity);
                
            }else if(d.trim().equals("pdes")){
                String pdescription=request.getParameter("PDescription");
                int Pid=Integer.parseInt(request.getParameter("ProId"));
                EditProductDao editProductDao=new EditProductDao(FactoryProvider.getFactory());
                t=editProductDao.updateProductDescriptionByProductID(Pid, pdescription);
                
            }
            HttpSession session= (HttpSession) request.getSession();
            if(t==0){
                session.setAttribute("message", "ProductSavedFail");
                response.sendRedirect("AllProduct.jsp");
            }else{
                session.setAttribute("message", "ProductSavedSuccess");
                response.sendRedirect("AllProduct.jsp");
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
