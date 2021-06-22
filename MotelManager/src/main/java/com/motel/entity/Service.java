package com.motel.entity;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name = "DICHVU")
public class Service {
    @Id
    @Column(name = "MaDV")
    private String serviceId;
    @Column(name = "TenDV")
    private String name;
    @Column(name = "DonGia")
    private float price;
    @Column(name = "DonViTinh")
    private String countIndex;
    @Column(name="TrangThai")
    private int status;

    @OneToMany(mappedBy="service")
    private Collection<BillDetail> billDetail;

    public String getServiceId() {
        return serviceId;
    }

    public void setServiceId(String serviceId) {
        this.serviceId = serviceId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCountIndex() {
        return countIndex;
    }

    public void setCountIndex(String countIndex) {
        this.countIndex = countIndex;
    }

    public Collection<BillDetail> getBillDetail() {
        return billDetail;
    }

    public void setBillDetail(Collection<BillDetail> billDetail) {
        this.billDetail = billDetail;
    }

    public Service(String serviceId, String name, float price, String countIndex, int status, Collection<BillDetail> billDetail) {
        super();
        this.serviceId = serviceId;
        this.name = name;
        this.price = price;
        this.countIndex = countIndex;
        this.status = status;
        this.billDetail = billDetail;
    }

    public Service() {
        super();
    }
}
