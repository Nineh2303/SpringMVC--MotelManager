package com.motel.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Collection;
import java.util.Date;
import java.util.List;

@Entity
@Table(name="KHACHTRO")
public class Tenant {
    @Id
    @Column(name="CMND")
    private String CMND;
    @Column(name="HoTen")
    private String name;
    @Column(name="NgaySinh")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="dd/MM/yyyy")
    private Date birthDay;
    @Column(name="GioiTinh")
    private String gender;
    @Column(name="SDT")
    private String numberPhone ;
    @Column(name="DiaChi")
    private String address;
    @Column(name="TrangThaiThue")
    private int status ;
    @Column(name="img_url")
    private String image ;

    @OneToMany(mappedBy="tenant", cascade=CascadeType.ALL)
    private List<Tenant> tenant;


    public String getCMND() {
        return CMND;
    }

    public void setCMND(String CMND) {
        this.CMND = CMND;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(Date birthDay) {
        this.birthDay = birthDay;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getNumberPhone() {
        return numberPhone;
    }

    public void setNumberPhone(String numberPhone) {
        this.numberPhone = numberPhone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public List<Tenant> getTenant() {
        return tenant;
    }

    public void setTenant(List<Tenant> tenant) {
        this.tenant = tenant;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Tenant(String CMND, String name, Date birthDay, String gender, String numberPhone, String address, int status, String image, List<Tenant> tenant) {
        this.CMND = CMND;
        this.name = name;
        this.birthDay = birthDay;
        this.gender = gender;
        this.numberPhone = numberPhone;
        this.address = address;
        this.status = status;
        this.image = image;
        this.tenant = tenant;
    }

    public Tenant() {
        super();
    }
}

