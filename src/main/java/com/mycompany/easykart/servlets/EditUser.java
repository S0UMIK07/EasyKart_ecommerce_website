/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.easykart.servlets;
import com.mycompany.easykart.dao.EditUserDao;
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
public class EditUser extends HttpServlet {

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
           String div=request.getParameter("d");
           if(div.trim().equals("na")){
               int uid=Integer.parseInt(request.getParameter("ui"));
               String name=request.getParameter("name");
               EditUserDao editUserDao=new EditUserDao(FactoryProvider.getFactory());
               int t=editUserDao.EditUserName(uid, name);
               HttpSession httpSession=request.getSession();
               if(t!=0)
               {
                   httpSession.setAttribute("message", "nameChangeS");
                   response.sendRedirect("EditProfile.jsp");
               }else{
                   httpSession.setAttribute("message", "nameChangeF");
                   response.sendRedirect("EditProfile.jsp");
               }
           }else if(div.trim().equals("ph")){
               int uid=Integer.parseInt(request.getParameter("ui"));
               String PhoneNo=request.getParameter("PhoneNumber");
               EditUserDao editUserDao=new EditUserDao(FactoryProvider.getFactory());
               int t=editUserDao.EditUserPhoneNumber(uid, PhoneNo);
               HttpSession httpSession=request.getSession();
               if(t!=0)
               {
                   httpSession.setAttribute("message", "PhoneChangeS");
                   response.sendRedirect("EditProfile.jsp");
               }else{
                   httpSession.setAttribute("message", "PhoneChangeF");
                   response.sendRedirect("EditProfile.jsp");
               }
           }else if(div.trim().equals("pa")){
               int uid=Integer.parseInt(request.getParameter("ui"));
               String Pass=request.getParameter("password");
               EditUserDao editUserDao=new EditUserDao(FactoryProvider.getFactory());
               int t=editUserDao.EditUserPhoneNumber(uid, Pass);
               HttpSession httpSession=request.getSession();
               if(t!=0)
               {
                   httpSession.setAttribute("message", "PasswordChangeS");
                   response.sendRedirect("EditProfile.jsp");
               }else{
                   httpSession.setAttribute("message", "PasswordChangeF");
                   response.sendRedirect("EditProfile.jsp");
               }
           }else if(div.trim().equals("ad")){
               int uid=Integer.parseInt(request.getParameter("ui"));
               String Add=request.getParameter("address");
               EditUserDao editUserDao=new EditUserDao(FactoryProvider.getFactory());
               int t=editUserDao.EditUserAddress(uid, Add);
               HttpSession httpSession=request.getSession();
               if(t!=0)
               {
                   httpSession.setAttribute("message", "AddressChangeS");
                   response.sendRedirect("EditProfile.jsp");
               }else{
                   httpSession.setAttribute("message", "AddressChangeF");
                   response.sendRedirect("EditProfile.jsp");
               }
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
