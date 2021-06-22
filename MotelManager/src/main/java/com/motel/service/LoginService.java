package com.motel.service;

import com.motel.entity.User;

public interface LoginService {
    public User checkLoginAdmin(String username, String password);
}
