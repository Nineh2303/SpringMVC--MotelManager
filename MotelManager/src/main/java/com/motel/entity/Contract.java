package com.motel.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Collection;
import java.util.Date;

@Entity
@Table(name="HOPDONGTHUE")
public class Contract {
    @Id
    @Column(name ="MaHD")
    private String contractId;
    @Column(name="MaPT", insertable = false, updatable = false)
    private String roomId;
    @Column(name="NgayThue")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="MM/dd/YY")
    private Date checkInDate;
    @Column(name="TienDatCoc")
    private float depositMoney ;
    @Column(name="NgayTra")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="MM/dd/YY")
    private Date checkOutDate ;
    @Column(name="GhiChu")
    private String note ;
    @Column(name="TrangThai")
    private int status ;
    @ManyToOne
    @JoinColumn(name="MaPT")
    private Room room ;

    @OneToMany(mappedBy ="contract")
    private Collection<rentDetail> rentDetail;


    @OneToMany(mappedBy = "contract")
    private Collection<Bill> bill ;

    public String getContractId() {
        return contractId;
    }

    public void setContractId(String contractId) {
        this.contractId = contractId;
    }

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public Date getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(Date checkInDate) {
        this.checkInDate = checkInDate;
    }

    public float getDepositMoney() {
        return depositMoney;
    }

    public void setDepositMoney(float depositMoney) {
        this.depositMoney = depositMoney;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Collection<com.motel.entity.rentDetail> getRentDetail() {
        return rentDetail;
    }

    public void setRentDetail(Collection<com.motel.entity.rentDetail> rentDetail) {
        this.rentDetail = rentDetail;
    }


    public Collection<Bill> getBill() {
        return bill;
    }

    public void setBill(Collection<Bill> bill) {
        this.bill = bill;
    }

    public Contract(String contractId, String roomId, Date checkInDate, float depositMoney, Date checkOutDate, String note, int status, Room room, Collection<com.motel.entity.rentDetail> rentDetail, Collection<Bill> bill) {
        this.contractId = contractId;
        this.roomId = roomId;
        this.checkInDate = checkInDate;
        this.depositMoney = depositMoney;
        this.checkOutDate = checkOutDate;
        this.note = note;
        this.status = status;
        this.room = room;
        this.rentDetail = rentDetail;
        this.bill = bill;
    }

    public Contract() {
        super();
    }
}
