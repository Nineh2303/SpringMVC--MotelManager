package com.motel.entity;

import com.motel.Serializer.BillId;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Collection;
import java.util.Date;

@Entity
@Table(name = "HOADON")
public class Bill {
    @Id
    @Column(name = "MaHoaDon")
    private String billId;
    @ManyToOne
    @JoinColumn(name="MaHD")
    private Contract contract;
    @Column(name = "NgayThu")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date date;
    @Column(name="TongTien")
    private float money;
    @Column(name="TrangThai")
    private int status;



    @OneToMany(mappedBy = "bill")
    private Collection<BillDetail> billDetail;

    public String getBillId() {
        return billId;
    }

    public void setBillId(String billId) {
        this.billId = billId;
    }


    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public float getMoney() {
        return money;
    }

    public void setMoney(float money) {
        this.money = money;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Contract getContract() {
        return contract;
    }

    public void setContract(Contract contract) {
        this.contract = contract;
    }

    public Collection<BillDetail> getBillDetail() {
        return billDetail;
    }

    public void setBillDetail(Collection<BillDetail> billDetail) {
        this.billDetail = billDetail;
    }

    public Bill(String billId,  Date date, float money, int status, Contract contract, Collection<BillDetail> billDetail) {
        super();
        this.billId = billId;
        this.date = date;
        this.money = money;
        this.status = status;
        this.contract = contract;
        this.billDetail = billDetail;
    }

    public Bill() {
        super();
    }
}
