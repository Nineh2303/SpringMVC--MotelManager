package com.motel.service;

import com.motel.entity.Home;

import java.util.List;

public interface HomeService {
    public List<Home> getAllHome (Integer offset , Integer maxResult) ;
    public Home getHomeById(String homeId) ;
    boolean insertHome(Home home) ;
    boolean updateHome(Home home) ;
    boolean removeHome(String homeId) ;
}
