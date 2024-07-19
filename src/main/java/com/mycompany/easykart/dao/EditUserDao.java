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
public class EditUserDao {
     private SessionFactory factory;

    public EditUserDao(SessionFactory factory) {
        this.factory = factory;
    }
    public int EditUserName(int uid,String name){
        int temp=0;
        
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            Query query;
            query = session.createQuery("update User set userName = :s where userId = :id");
            query.setParameter("id", uid);
            query.setParameter("s", name);
            query.executeUpdate();
            temp++;
            tx.commit();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
            temp=0;
        }
        
        return temp;
    }
    public int EditUserPhoneNumber(int uid,String PhoneNumber){
        int temp=0;
        
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            Query query;
            query = session.createQuery("update User set userPhone = :s where userId = :id");
            query.setParameter("id", uid);
            query.setParameter("s", PhoneNumber);
            query.executeUpdate();
            temp++;
            tx.commit();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
            temp=0;
        }
        
        return temp;
    }
    public int EditUserPassword(int uid,String Password){
        int temp=0;
        
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            Query query;
            query = session.createQuery("update User set userPassword = :s where userId = :id");
            query.setParameter("id", uid);
            query.setParameter("s", Password);
            query.executeUpdate();
            temp++;
            tx.commit();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
            temp=0;
        }
        
        return temp;
    }
    public int EditUserAddress(int uid,String Address){
        int temp=0;
        
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            Query query;
            query = session.createQuery("update User set userAddress = :s where userId = :id");
            query.setParameter("id", uid);
            query.setParameter("s", Address);
            query.executeUpdate();
            temp++;
            tx.commit();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
            temp=0;
        }
        
        return temp;
    }
    
}
