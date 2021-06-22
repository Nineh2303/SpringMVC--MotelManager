package com.motel.entity;

import com.motel.Serializer.rentDetailId;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
//@IdClass(rentDetailId.class)
@Table(name="CT_THUE")
public class rentDetail {
    @Id
    @Column(name="MaCTT" ,insertable = false, updatable = false)
    private String rentID;
    @Column(name = "NgayO")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/YY")
    private Date checkInDate;
    @Column(name = "NgayDi")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "MM/dd/YY")
    private Date checkOutDate;
    @Column(name = "GhiChu")
    private String note;
    @Column(name="TrangThai")
    private int status;

    @ManyToOne
    @JoinColumn(name="MaHD")
    private Contract contract ;
    @ManyToOne
    @JoinColumn(name="CMND")
    private Tenant tenant;

    public String getRentID() {
        return rentID;
    }

    public void setRentID(String rentID) {
        this.rentID = rentID;
    }

    public Date getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(Date checkInDate) {
        this.checkInDate = checkInDate;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(Date checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public Contract getContract() {
        return contract;
    }

    public void setContract(Contract contract) {
        this.contract = contract;
    }

    public Tenant getTenant() {
        return tenant;
    }

    public void setTenant(Tenant tenant) {
        this.tenant = tenant;
    }

    public rentDetail(String rentID, Date checkInDate, Date checkOutDate, String note, int status, Contract contract, Tenant tenant) {
        this.rentID = rentID;
        this.checkInDate = checkInDate;
        this.checkOutDate = checkOutDate;
        this.note = note;
        this.status = status;
        this.contract = contract;
        this.tenant = tenant;
    }

    public rentDetail() {
        super();
    }
}

