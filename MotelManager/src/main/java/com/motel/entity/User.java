package com.motel.entity;

import javax.persistence.*;

@Entity
@Table(name="users")

public class User {
    @Id
    private int id;
    private String displayName;
    private String username;
    private String email;
    private int phone;
    private String password ;
    private String active;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDisplayName() {
        return displayName;
    }

    public void setDisplayName(String displayName) {
        this.displayName = displayName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPhone() {
        return phone;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }

    public User(int id, String displayName, String username, String email, int phone, String password, String active) {
        super();
        this.id = id;
        this.displayName = displayName;
        this.username = username;
        this.email = email;
        this.phone = phone;
        this.password = password;
        this.active = active;
    }

    public User() {
        super();
    }
}
