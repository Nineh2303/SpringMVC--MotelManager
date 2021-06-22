package com.motel.service;

import com.motel.entity.Tenant;
import com.motel.entity.rentDetail;
import org.hibernate.Session;
import java.util.List;

public interface TenantService {
    List<Tenant> getAllTenant(Integer offset , Integer maxResult);
    List<Tenant> getActiveTenant(Integer offset , Integer maxResult);
    List<Tenant> getTenantByStatus( int status ,Integer offset , Integer maxResult);
    public boolean insertTenant(Tenant tenant);
    public boolean deActiveTenant(String id);
    public boolean removeTenant(String id);
    public boolean updateTenant(Tenant tenant, Session session) ;
    public boolean checkOutForTenant(rentDetail rent) ;
    public boolean isInstanceTenant(String CMND) ;
}
