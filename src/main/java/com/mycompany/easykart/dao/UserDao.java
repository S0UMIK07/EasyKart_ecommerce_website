/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.easykart.dao;

import com.mycompany.easykart.entities.User;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author 91731
 */
public class UserDao {
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    public User getUserByEmailAndPassword(String email,String pass){
        
        User user=null;
        try {
            String query;
            query = "FROM User WHERE userEmail = :e and userPassword = :p";
            Session session=this.factory.openSession(); 
            Query q=session.createQuery(query);
            q.setParameter("e", email);
            q.setParameter("p", pass);
            user=(User) q.uniqueResult();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
        
        
    }
    public User getUserByEmail(String email){
        
        User user=null;
        try {
            String query;
            query = "FROM User WHERE userEmail = :e";
            Session session=this.factory.openSession(); 
            Query q=session.createQuery(query);
            q.setParameter("e", email);
            user=(User) q.uniqueResult();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
        
        
    }
    
    
    public long getUserCount(){
          long UCount=0;
          try {
              String query;
              query="Select count(*) FROM User";
              Session session = this.factory.openSession();
              Query q=session.createQuery(query);
              UCount=(long)q.list().get(0);
              session.close();
          } catch (Exception e) {
              e.printStackTrace();
          }
          return UCount;
      }
    
    public List<User> getAllUser(){
        List<User> list = null;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            Query query;
            query = session.createQuery("from User");
            list=query.list();
            tx.commit();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
}
