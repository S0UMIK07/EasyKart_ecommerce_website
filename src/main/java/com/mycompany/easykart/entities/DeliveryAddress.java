/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.easykart.entities;

import javax.persistence.Column;
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
@Table(name = "delivery_addresses")
public class DeliveryAddress {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "address_id")
    private int addressId;

    private String Dname;
    private String Email;
    private String Phonenumber;
    private String city;
    private String state;
    private String postalCode;
    private String DAddress;

    @ManyToOne
    @JoinColumn(name = "userId")
    private User user;

    public DeliveryAddress(int addressId, String Dname, String Email, String Phonenumber, String city, String state, String postalCode, String DAddress, User user) {
        this.addressId = addressId;
        this.Dname = Dname;
        this.Email = Email;
        this.Phonenumber = Phonenumber;
        this.city = city;
        this.state = state;
        this.postalCode = postalCode;
        this.DAddress = DAddress;
        this.user = user;
    }

    public DeliveryAddress() {
    }

    public DeliveryAddress(String Dname, String Email, String Phonenumber, String city, String state, String postalCode, String DAddress, User user) {
        this.Dname = Dname;
        this.Email = Email;
        this.Phonenumber = Phonenumber;
        this.city = city;
        this.state = state;
        this.postalCode = postalCode;
        this.DAddress = DAddress;
        this.user = user;
    }

    public int getAddressId() {
        return addressId;
    }

    public void setAddressId(int addressId) {
        this.addressId = addressId;
    }

    public String getDname() {
        return Dname;
    }

    public void setDname(String Dname) {
        this.Dname = Dname;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public String getPhonenumber() {
        return Phonenumber;
    }

    public void setPhonenumber(String Phonenumber) {
        this.Phonenumber = Phonenumber;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getDAddress() {
        return DAddress;
    }

    public void setDAddress(String DAddress) {
        this.DAddress = DAddress;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "DeliveryAddress{" + "addressId=" + addressId + ", Dname=" + Dname + ", Email=" + Email + ", Phonenumber=" + Phonenumber + ", city=" + city + ", state=" + state + ", postalCode=" + postalCode + ", DAddress=" + DAddress + ", user=" + user + '}';
    }
    
}

