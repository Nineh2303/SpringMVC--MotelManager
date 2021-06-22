package com.motel.entity;

import javax.persistence.*;
import java.util.Collection;


@Entity
@Table(name="NHATRO")
public class Home {
    @Id
    @Column(name = "MaNT")
    private String homeId;
    @Column(name = "ChuTro")
    private String motelBossName;
    @Column(name = "SDT")
    private String numberPhone;
    @Column(name = "DiaChi")
    private String address;

    @OneToMany(mappedBy = "home", fetch = FetchType.EAGER)
    private Collection<Room> room;

    public String getHomeId() {
        return homeId;
    }

    public void setHomeId(String homeId) {
        this.homeId = homeId;
    }

    public String getMotelBossName() {
        return motelBossName;
    }

    public void setMotelBossName(String motelBossName) {
        this.motelBossName = motelBossName;
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

    public Collection<Room> getRoom() {
        return room;
    }

    public void setRoom(Collection<Room> room) {
        this.room = room;
    }

    public Home(String homeId, String motelBossName, String numberPhone, String address, Collection<Room> room) {
        super();
        this.homeId = homeId;
        this.motelBossName = motelBossName;
        this.numberPhone = numberPhone;
        this.address = address;
        this.room = room;
    }

    public Home() {
        super();
    }
}
