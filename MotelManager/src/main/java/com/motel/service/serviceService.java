package com.motel.service;

import com.motel.entity.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;


public interface serviceService {
    List <Service> getAllService() ;
    List <Service> getActiveService() ;
    boolean insertService(Service sevice) ;
    boolean changeStatusService(String serviceId) ;
    boolean updateService (Service service) ;
}
