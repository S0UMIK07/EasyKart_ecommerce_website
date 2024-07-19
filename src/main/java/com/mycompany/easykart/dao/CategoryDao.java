/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.easykart.dao;

import com.mycompany.easykart.entities.Category;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author 91731
 */
public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    public int saveCategory(Category cat){
        Session session= this.factory.openSession();
        Transaction tx=session.beginTransaction();
        int catId=(int)session.save(cat);
        tx.commit();
        session.clear();
        return catId;
    }
    public List<Category> getCategory(){
        Session sess=this.factory.openSession();
        Transaction tr=sess.beginTransaction();
        Query query;
        query = sess.createQuery("from Category");
        List<Category> cat =query.list();
        tr.commit();
        sess.close();
        return cat;
    }
    public Category getCategoryById(int id){
        Category cat=null;
        try {
            Session sessi=this.factory.openSession();
            cat=sessi.get(Category.class, id);
            sessi.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cat;
    }
}
