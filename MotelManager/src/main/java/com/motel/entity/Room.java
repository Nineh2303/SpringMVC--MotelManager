package com.motel.entity;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="PHONGTRO")
public class Room {
    @Id
    @Column(name = "MaPT" )
    private String roomId;

    @Column(name = "MaNT",insertable = false, updatable = false)
    private String homeId;
    @Column(name = "TenPhong")
    private String name;
    @Column(name = "GiaPhong")
    private Float price;
    @Column(name = "SLToiDa")
    private int max;
    @Column(name = "TrangThai")
    private int status;
    @Column (name="SoLuongHienTai")
    private int currentQuantity ;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="MaNT")
    private Home home;
    @OneToMany (mappedBy="room")
    private List<Contract> contract ;

    public String getRoomId() {
        return roomId;
    }

    public void setRoomId(String roomId) {
        this.roomId = roomId;
    }

    public String getHomeId() {
        return homeId;
    }

    public void setHomeId(String homeId) {
        this.homeId = homeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }

    public int getMax() {
        return max;
    }

    public void setMax(int max) {
        this.max = max;
    }


    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Home getHome() {
        return home;
    }

    public void setHome(Home home) {
        this.home = home;
    }


    public int getCurrentQuantity() {
        return currentQuantity;
    }

    public void setCurrentQuantity(int currentQuantity) {
        this.currentQuantity = currentQuantity;
    }


    public Room(String roomId, String homeId, String name, Float price, int max, int status, int currentQuantity, Home home, List<Contract> contract) {
        super();
        this.roomId = roomId;
        this.homeId = homeId;
        this.name = name;
        this.price = price;
        this.max = max;
        this.status = status;
        this.currentQuantity = currentQuantity;
        this.home = home;
        this.contract = contract;
    }

    public Room() {
        super();
    }
}
