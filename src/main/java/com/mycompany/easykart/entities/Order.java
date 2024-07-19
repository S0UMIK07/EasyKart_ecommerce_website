/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.easykart.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author 91731
 */


@Entity
@Table(name = "orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_id")
    private int orderId;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "delivery_address_id")
    private DeliveryAddress deliveryAddress;
    
    
    @OneToMany(mappedBy = "order", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<OrderItem> orderItems = new ArrayList<>();
    

    private String orderDate;
    private int totalAmount;
    private String status;
    private String Payment;
    private String PaymentId;

    public Order() {
    }

    public Order(int orderId, User user, DeliveryAddress deliveryAddress, String orderDate, int totalAmount, String status, String Payment, String PaymentId,List<OrderItem> orderItems) {
        this.orderId = orderId;
        this.user = user;
        this.deliveryAddress = deliveryAddress;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
        this.status = status;
        this.Payment = Payment;
        this.PaymentId = PaymentId;
        this.orderItems=orderItems;
    }

    public Order(User user, DeliveryAddress deliveryAddress, String orderDate, int totalAmount, String status, String Payment, String PaymentId,List<OrderItem> orderItems) {
        this.user = user;
        this.deliveryAddress = deliveryAddress;
        this.orderDate = orderDate;
        this.totalAmount = totalAmount;
        this.status = status;
        this.Payment = Payment;
        this.PaymentId = PaymentId;
        this.orderItems=orderItems;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public DeliveryAddress getDeliveryAddress() {
        return deliveryAddress;
    }

    public void setDeliveryAddress(DeliveryAddress deliveryAddress) {
        this.deliveryAddress = deliveryAddress;
    }

    public List<OrderItem> getOrderItems() {
        return orderItems;
    }

    public void setOrderItems(List<OrderItem> orderItems) {
        this.orderItems = orderItems;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPayment() {
        return Payment;
    }

    public void setPayment(String Payment) {
        this.Payment = Payment;
    }

    public String getPaymentId() {
        return PaymentId;
    }

    public void setPaymentId(String PaymentId) {
        this.PaymentId = PaymentId;
    }
    

   
    
    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", user=" + user + ", deliveryAddress=" + deliveryAddress + ", orderItems=" + orderItems + ", orderDate=" + orderDate + ", totalAmount=" + totalAmount + ", status=" + status + ", Payment=" + Payment + ", PaymentId=" + PaymentId + '}';
    }
    

   

    

   
    
}

