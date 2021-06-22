package com.motel.service.impl;

import com.motel.entity.Room;
import com.motel.service.serviceService;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class serviceServiceImpl implements serviceService {
    @Autowired
    SessionFactory factory;
    @Override
    public List <com.motel.entity.Service> getAllService() {
        Session session = factory.openSession();
        try {
            String hql = "from Service";
            Query query = session.createQuery(hql);
            List<com.motel.entity.Service> list = query.list();
            if (list != null) {
                return list;
            }
        } catch (Exception e)
            {}
        return null;
    }

    @Override
    public List<com.motel.entity.Service> getActiveService() {
        Session session = factory.openSession();
        try {
            String hql = "FROM Service s WHERE s.status = 1";
            Query query = session.createQuery(hql);
            List<com.motel.entity.Service> list = query.list();
            if (list != null) {
                return list;
            }
        } catch (Exception e)
        {}
        return null;
    }

    @Override
    public boolean insertService(com.motel.entity.Service service) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            service.setStatus(1);
            session.save(service);
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
    public boolean changeStatusService(String serviceId) {

        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        com.motel.entity.Service service  = (com.motel.entity.Service) session.get(com.motel.entity.Service.class, serviceId) ;
        if(service.getStatus()==0) {
            try {
                service.setStatus(1) ;
                session.update(service);
                t.commit();
                return true;
            } catch (Exception e) {
                t.rollback();
            } finally {
                session.close();
            }
        } else {
            try {
                service.setStatus(0) ;
                session.update(service);
                t.commit();
                return true;
            } catch (Exception e) {
                t.rollback();
            } finally {
                session.close();
            }
        }
        return false;
    }

    @Override
    public boolean updateService(com.motel.entity.Service service) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try{
            session.update(service);
            t.commit();
            return true;
        }
        catch (Exception e ){
            t.rollback();
        }
        finally {
            session.close();
        }

        return false;
    }
}
