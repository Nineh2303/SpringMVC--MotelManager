package com.motel.entity;
import com.motel.Serializer.BillId;

import javax.persistence.*;
import java.util.Collection;

@IdClass(BillId.class)

@Entity
@Table(name="CT_HOADON")
public class BillDetail {
    @Id
    @ManyToOne
    @JoinColumn(name="MaHoaDon")
    private Bill bill ;
    @Id
    @ManyToOne
    @JoinColumn(name="MaDV")
    private Service service ;
    @Column(name="Soluong")
    private float count ;
    @Column(name="DonGia")
    private float price ;
    @Column(name="TongTien")
    private float total;
    @Column(name="GhiChu")
    private String note;


    public float getCount() {
        return count;
    }

    public void setCount(float count) {
        this.count = count;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Bill getBill() {
        return bill;
    }

    public void setBill(Bill bill) {
        this.bill = bill;
    }

    public Service getService() {
        return service;
    }

    public void setService(Service service) {
        this.service = service;
    }

    public BillDetail(Bill bill, Service service, float count, float price, float total, String note) {
        this.bill = bill;
        this.service = service;
        this.count = count;
        this.price = price;
        this.total = total;
        this.note = note;
    }

    public BillDetail() {
        super();
    }
}
