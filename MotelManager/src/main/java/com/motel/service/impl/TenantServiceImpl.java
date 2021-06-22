package com.motel.service.impl;

import com.motel.entity.Room;
import com.motel.entity.Tenant;
import com.motel.entity.rentDetail;
import com.motel.service.TenantService;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TenantServiceImpl implements TenantService {
    @Autowired
    SessionFactory factory;

    @Override
    public List<Tenant> getAllTenant(Integer offset, Integer maxResult) {
        Session session = factory.openSession();
        try {
            String hql = "FROM Tenant";
            Query query = session.createQuery(hql);
            query.setFirstResult((offset != null) ? offset : 0);
            List<Tenant> result = query.list();
            if (result != null)
                return result;
        } catch (Exception e) {
            System.out.println("Lỗi : " + e);
        }
        return null;
    }

    @Override
    public List<Tenant> getActiveTenant(Integer offset, Integer maxResult) {
        Session session = factory.openSession();
        try {
            String hql = "FROM Tenant  r WHERE r.status =1";
            Query query = session.createQuery(hql);
            query.setFirstResult((offset != null) ? offset : 0);
            List<Tenant> result = query.list();
            if (result != null)
                return result;
        } catch (Exception e) {
            System.out.println("Lỗi : " + e);
        }
        return null;
    }

    @Override
    public List<Tenant> getTenantByStatus(int status, Integer offset, Integer maxResult) {
        Session session = factory.openSession();
        try {
            String hql = "FROM Tenant  r WHERE r.status = :status";
            Query query = session.createQuery(hql);
            query.setParameter("status", status) ;
            query.setFirstResult((offset != null) ? offset : 0);
            List<Tenant> result = query.list();
            if (result != null)
                return result;
        } catch (Exception e) {
            System.out.println("Lỗi : " + e);
        }
        return null;
    }

    @Override
    public boolean insertTenant(Tenant tenant) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.save(tenant);
            t.commit();
            return true;
        } catch (Exception e) {
            t.rollback();
        } finally {
            session.close();
        }
        return false;
    }

    @Override
    public boolean deActiveTenant(String CMND) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            Tenant tenant = (Tenant) session.get(Tenant.class, CMND);
            tenant.setStatus(0);
            session.update(tenant);
            t.commit();
            return true;
        } catch (Exception e) {
            t.rollback();
        } finally {
            session.close();
        }

        return false;
    }

    @Override
    public boolean removeTenant(String id) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        Tenant tenant = (Tenant) session.get(Tenant.class, id);
        try {
            session.delete(tenant);
            t.commit();
            return true;
        } catch (Exception e) {
            t.rollback();
        } finally {
            session.close();
        }
        return false;
    }

    @Override
    public boolean updateTenant(Tenant tenant, Session session) {
        Transaction t = session.beginTransaction();
        try {
            session.update(tenant);
            t.commit();
            return true;
        } catch (Exception e) {
            t.rollback();
        } finally {
            session.close();
        }
        return false;
    }

    @Override
    public boolean checkOutForTenant(rentDetail rent) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        int count = 0;
        Tenant tenant = (Tenant) session.get(Tenant.class, rent.getTenant().getCMND());
        try {
            String hql = "select count(*) from rentDetail r where r.tenant.CMND= :CMND and r.checkOutDate=null";
            Query query = session.createQuery(hql);
            query.setParameter("CMND", tenant.getCMND());
            count = ((Number) query.uniqueResult()).intValue();
        } catch (Exception e) {
            return false;
        }
        try {
            if (count == 0) {
                tenant.setStatus(0);
                session.update(tenant);
                t.commit();
                return true;
            } else {
                return true;
            }
        } catch (Exception e) {
            t.rollback();
            return false;
        }
    }

    @Override
    public boolean isInstanceTenant(String CMND) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        Tenant tenant = (Tenant) session.get(Tenant.class, CMND);
        if (tenant != null) {
            if (tenant.getStatus() == 0) {
                try {
                    tenant.setStatus(1);
                    session.update(tenant);
                    t.commit();
                    return true;
                } catch (Exception e) {
                    t.rollback();
                    return false;
                }
            }else {
                return true;
            }
        }
        return false;
    }


}
