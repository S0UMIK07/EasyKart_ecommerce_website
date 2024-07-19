/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.easykart.dao;


import com.mycompany.easykart.entities.Order;
import com.mycompany.easykart.entities.OrderItem;
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
public class OrderDao {
    private SessionFactory factory;

    public OrderDao(SessionFactory factory) {
        this.factory = factory;
    }
    public List<Order> getOrdersByUserId( int uid){
        List<Order> list = null;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            Query query;
            query = session.createQuery("from Order where user_id=:e");
            query.setParameter("e", uid);
            list=query.list();
            tx.commit();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    
    
    public Order getOrderById(int id){
        Order od=null;
        try {
            Session sessi=this.factory.openSession();
            od=sessi.get(Order.class, id);
            sessi.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return od;
    }
    public Order getOrderByIdAndUserId(int orderId, int userId) {
    Order od = null;
    try {
        Session session = this.factory.openSession();

        
        Query<Order> query = session.createQuery(
            "SELECT o FROM Order o WHERE o.orderId = :orderId AND o.user.userId = :userId",
            Order.class
        );
        query.setParameter("orderId", orderId);
        query.setParameter("userId", userId);

        od = query.uniqueResult(); 

        session.close();
    } catch (Exception e) {
        e.printStackTrace();
        od=null;
    }
    return od;
}

    
    
    public List<OrderItem> getOrderItemsByOrderId(int oid){
        List<OrderItem> listItem = null;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            Query query;
            query = session.createQuery("from OrderItem as o where o.order.orderId=:id");
            query.setParameter("id", oid);
            listItem=query.list();
            tx.commit();
            session.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listItem;
    }
    
    public int UpdateStatus(int oid,int uid,String status){
        int temp=0;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            Query query;
            query = session.createQuery("update Order o set o.status = :s where o.orderId = :oi and o.user.userId = :id");
            query.setParameter("id", uid);
            query.setParameter("oi", oid);
            query.setParameter("s", status);
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
    public int UpdatePaymentStatus(int oid,int uid,String Pstatus){
        int temp=0;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            Query query;
            query = session.createQuery("update Order o set o.Payment = :s where o.orderId = :oi and o.user.userId = :id");
            query.setParameter("id", uid);
            query.setParameter("oi", oid);
            query.setParameter("s", Pstatus);
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
    public int UpdatePaymentID(int oid,int uid,String PayId){
        int temp=0;
        try {
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            Query query;
            query = session.createQuery("update Order o set o.PaymentId = :s where o.orderId = :oi and o.user.userId = :id");
            query.setParameter("id", uid);
            query.setParameter("oi", oid);
            query.setParameter("s", PayId);
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
 