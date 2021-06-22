package com.motel.service.impl;

import com.motel.entity.Home;
import com.motel.service.HomeService;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class HomeServiceImpl  implements HomeService {
    @Autowired
    SessionFactory factory;

    @Override
    public List<Home> getAllHome(Integer offset, Integer maxResult) {
        Session session = factory.openSession();
        try {
            String hql = "FROM Home";
            Query query = session.createQuery(hql);
            query.setFirstResult((offset != null) ? offset : 0);
            List<Home> result = query.list();
            if (result != null)
                return result;
        } catch (Exception e) {
            System.out.println("Lỗi : " + e);
        }
        return null;
    }

    public Home getHomeById(String homeId) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            Home home = (Home) session.get(Home.class, homeId);
            return home;
        } catch (Exception e) {
            return null;
        } finally {
            session.close();
        }
    }

    @Override
    public boolean insertHome(Home home) {
        Session session = factory.openSession() ;
        Transaction t =  session.beginTransaction();
        try{
            session.save(home);
            t.commit();
            return true;
        }catch(Exception e){
            t.rollback();
        } finally{
            session.close();
        }
        return false;
    }

    @Override
    public boolean updateHome(Home home) {
        Session session = factory.openSession() ;
        Transaction t =  session.beginTransaction();
        try{
            session.update(home);
            t.commit();
            return true;
        }catch(Exception e){
            t.rollback();
        } finally{
            session.close();
        }
        return false;
    }

    @Override
    public boolean removeHome(String homeId) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try{
            Home home= (Home) session.get(Home.class, homeId) ;
            session.delete(home);
            t.commit();
            return true ;
        } catch (Exception e){
            t.rollback();
        }
        finally{
            session.close();
        }
        return false;
    }

}
