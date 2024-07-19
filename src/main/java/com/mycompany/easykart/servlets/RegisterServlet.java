/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.easykart.servlets;
import com.mycompany.easykart.dao.UserDao;
import com.mycompany.easykart.entities.User;
import com.mycompany.easykart.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author 91731
 */

public class RegisterServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
           
                String user_name=request.getParameter("username");
                String user_email=request.getParameter("useremail");
                String user_password=request.getParameter("userpassword");
                String user_phone=request.getParameter("userphonenumber");
                String user_address=request.getParameter("useraddress");
                UserDao userDao=new UserDao(FactoryProvider.getFactory());
                User newuser=userDao.getUserByEmail(user_email);
                if(newuser==null)
                {
                    
                User user=new User(user_name, user_email, user_password, user_phone,"default.jpg", user_address,"normal");
                try (Session hibernateSession = FactoryProvider.getFactory().openSession()) {
               
                    Transaction tx=hibernateSession.beginTransaction();
                    int user_id=(int)hibernateSession.save(user);
                    tx.commit();
                    hibernateSession.close();
                    
                    HttpSession session=request.getSession();
                    if(user_id!=0){
                       session.setAttribute("message", "SuccessRegister"); 
                    }
                    else
                    {
                        session.setAttribute("message", "FailureRegister");
                    }
                   
                    
                    response.sendRedirect("register.jsp");
               
            } catch (HibernateException e) {
            }
            }
                else{
                    HttpSession session=request.getSession();
                    session.setAttribute("message", "AlreadyRegistered");
                    response.sendRedirect("register.jsp");
                }
        }
                
            }
       // processRequest(request, response);
    

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
