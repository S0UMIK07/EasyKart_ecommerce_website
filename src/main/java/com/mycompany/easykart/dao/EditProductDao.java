/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.easykart.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author 91731
 */
public class EditProductDao {
    private SessionFactory factory;

    public EditProductDao(SessionFactory factory) {
        this.factory = factory;
    }
     public int updateProductNameByProductID(int pid,String pname){
         int t=0;
         try {
             Session session=this.factory.openSession();
             Transaction tx= session.beginTransaction();
             Query query;
             query=session.createQuery("Update Product set pName =:p where pId =:i");
             query.setParameter("p", pname);
             query.setParameter("i", pid);
             query.executeUpdate();
             t++;
             tx.commit();
             session.close();
         } catch (Exception e) {
             e.printStackTrace();
             t=0;
         }
         return t;
     }
     
     public int updateProductPriceByProductID(int pid,int pprice){
         int t=0;
         try {
             Session session=this.factory.openSession();
             Transaction tx= session.beginTransaction();
             Query query;
             query=session.createQuery("Update Product set pPrice =:p where pId =:i");
             query.setParameter("p", pprice);
             query.setParameter("i", pid);
             query.executeUpdate();
             t++;
             tx.commit();
             session.close();
         } catch (Exception e) {
             e.printStackTrace();
             t=0;
         }
         return t;
     }
     
     public int updateProductDiscountByProductID(int pid,int pdiscount){
         int t=0;
         try {
             Session session=this.factory.openSession();
             Transaction tx= session.beginTransaction();
             Query query;
             query=session.createQuery("Update Product set pDiscount =:p where pId =:i");
             query.setParameter("p", pdiscount);
             query.setParameter("i", pid);
             query.executeUpdate();
             t++;
             tx.commit();
             session.close();
         } catch (Exception e) {
             e.printStackTrace();
             t=0;
         }
         return t;
     }
     
     public int updateProductQuantityByProductID(int pid,int pquantity){
         int t=0;
         try {
             Session session=this.factory.openSession();
             Transaction tx= session.beginTransaction();
             Query query;
             query=session.createQuery("Update Product set pQuantity =:p where pId =:i");
             query.setParameter("p", pquantity);
             query.setParameter("i", pid);
             query.executeUpdate();
             t++;
             tx.commit();
             session.close();
         } catch (Exception e) {
             e.printStackTrace();
             t=0;
         }
         return t;
     }
     
     public int updateProductDescriptionByProductID(int pid,String pdescription){
         int t=0;
         try {
             Session session=this.factory.openSession();
             Transaction tx= session.beginTransaction();
             Query query;
             query=session.createQuery("Update Product set pDesc =:p where pId =:i");
             query.setParameter("p", pdescription);
             query.setParameter("i", pid);
             query.executeUpdate();
             t++;
             tx.commit();
             session.close();
         } catch (Exception e) {
             e.printStackTrace();
             t=0;
         }
         return t;
     }
    
}
