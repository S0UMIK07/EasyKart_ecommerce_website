/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.easykart.servlets;
import com.mycompany.easykart.dao.CategoryDao;
import com.mycompany.easykart.dao.ProductDao;
import com.mycompany.easykart.entities.Category;
import com.mycompany.easykart.entities.Product;
import com.mycompany.easykart.helper.FactoryProvider;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;


/**
 *
 * @author 91731
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            String temp=request.getParameter("operation");
            if(temp.trim().equals("addCategory")){
                String title=request.getParameter("catTitle");
                String description=request.getParameter("catDescription");
                Category category=new Category();
                category.setCategoryTittle(title);
                category.setCategoryDescription(description);
                CategoryDao categoryDao=new CategoryDao(FactoryProvider.getFactory());
                int catId=categoryDao.saveCategory(category);
                HttpSession httpsession=request.getSession();
                httpsession.setAttribute("message","addcategorySuccessfull");
                httpsession.setAttribute("CategoryIdMessage", catId);
                response.sendRedirect("admin.jsp");
            }else if(temp.trim().equals("addProduct")){
                String ProductName=request.getParameter("proTitle");
                String description=request.getParameter("proDescription");
                int price=Integer.parseInt(request.getParameter("proPrice"));
                int pDiscount=Integer.parseInt(request.getParameter("proDiscount"));
                int pQuantity=Integer.parseInt(request.getParameter("proQuantity"));
                int cId=Integer.parseInt(request.getParameter("catId"));
                Part part=request.getPart("proPhoto");
                Product p=new Product();
                p.setpName(ProductName);
                p.setpDesc(description);
                p.setpPrice(price);
                p.setpDiscount(pDiscount);
                p.setpQuantity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());
                
                CategoryDao cdao=new CategoryDao(FactoryProvider.getFactory());
                Category category=cdao.getCategoryById(cId);
                p.setCategory(category);
                
                ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
                pdao.saveProduct(p);
                String path = "img";
                String realPath = getServletConfig().getServletContext().getRealPath(path)+File.separator+"Product"+File.separator+part.getSubmittedFileName();
                System.out.println(realPath);
                FileOutputStream fos=new FileOutputStream(realPath);
                InputStream is=part.getInputStream();
                byte[] data=new byte[is.available()];
                is.read(data);
                fos.write(data);
                fos.close();
                
                HttpSession httpSession=request.getSession();
                httpSession.setAttribute("message", "ProductSaved");
                response.sendRedirect("admin.jsp");
                return;
                
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
