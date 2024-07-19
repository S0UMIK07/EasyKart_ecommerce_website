/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.easykart.entities;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



/**
 *
 * @author 91731
 */
@Entity
@Table(name = "order_item")
public class OrderItem {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "order_id")
    private Order order;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    private int quantity;
    private String productName;
    private int productDPrice;
  

    public OrderItem() {
    }

    public OrderItem(int id, Order order, Product product, int quantity, String productName, int productDPrice) {
        this.id = id;
        this.order = order;
        this.product = product;
        this.quantity = quantity;
        this.productName = productName;
        this.productDPrice = productDPrice;
    }

    public OrderItem(Order order, Product product, int quantity, String productName, int productDPrice) {
        this.order = order;
        this.product = product;
        this.quantity = quantity;
        this.productName = productName;
        this.productDPrice = productDPrice;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getProductDPrice() {
        return productDPrice;
    }

    public void setProductDPrice(int productDPrice) {
        this.productDPrice = productDPrice;
    }

    @Override
    public String toString() {
        return "OrderItem{" + "id=" + id + ", order=" + order + ", product=" + product + ", quantity=" + quantity + ", productName=" + productName + ", productDPrice=" + productDPrice + '}';
    }

    
    
    
}

