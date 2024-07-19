/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.easykart.dao;

import com.mycompany.easykart.entities.OrderItem;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author 91731
 */
public class OrderItemDao {
        private SessionFactory factory;

    public OrderItemDao(SessionFactory factory) {
        this.factory = factory;
    }
    public List<OrderItem> getOrderItemByOrderId( int oid){
        List<OrderItem> list = null;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            Query query;
            query = session.createQuery("from OrderItem where order_id=:e");
            query.setParameter("e", oid);
            list=query.list();
            tx.commit();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
}
