/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.easykart.dao;

import com.mycompany.easykart.entities.Product;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author 91731
 */
public class ProductDao {
    private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }
    public boolean saveProduct(Product product){
        boolean f=false;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            session.save(product);
            tx.commit();
            session.close();
            f=true;
            
        } catch (Exception e) {
            e.printStackTrace();
            f=false;
        }
        return f;
    }
    
    public List<Product> getAllProducts(){
        List<Product> list = null;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            Query query;
            query = session.createQuery("from Product");
            list=query.list();
            tx.commit();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Product> getProductsById(int cid){
        List<Product> list = null;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            Query query;
            query = session.createQuery("from Product as p where p.category.categoryId=:id");
            query.setParameter("id", cid);
            list=query.list();
            tx.commit();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    
    
      public Product getProductByid(int pid){
        
        Product product =null;
        try {
            String query;
            query = "FROM Product WHERE pId = :e";
            Session session=this.factory.openSession(); 
            Query q=session.createQuery(query);
            q.setParameter("e", pid);
            product=(Product) q.uniqueResult();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return product;
        
        
    }
      
      
      
      public long getProductCount(){
          long pCount=0;
          try {
              String query;
              query="Select count(*) FROM Product";
              Session session = this.factory.openSession();
              Query q=session.createQuery(query);
              pCount=(long)q.list().get(0);
              session.close();
          } catch (Exception e) {
              e.printStackTrace();
          }
          return pCount;
      }
    
}
