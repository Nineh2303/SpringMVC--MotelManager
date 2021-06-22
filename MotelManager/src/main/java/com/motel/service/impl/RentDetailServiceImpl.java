package com.motel.service.impl;

import com.motel.entity.BillDetail;
import com.motel.entity.Room;
import com.motel.entity.rentDetail;
import com.motel.service.RentDetailService;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class RentDetailServiceImpl  implements RentDetailService {
    @Autowired
    SessionFactory factory;
    @Override
    public List<rentDetail> getAllRentDetail(Integer offset, Integer maxResult) {
        Session session = factory.openSession();
        try {
            String hql = "FROM rentDetail rent WHERE rent.checkOutDate != null";
            Query query = session.createQuery(hql);
            query.setFirstResult((offset != null) ? offset : 0);
            List<rentDetail> result = query.list();
            if (result != null)
                return result;
        } catch (Exception e) {
            System.out.println("Lỗi : " + e);
        }
        return null;
    }

    @Override
    public List<rentDetail> getRentDetailByStatus(int status) {
        Session session = factory.openSession();
        try {
            String hql = "FROM rentDetail rent WHERE rent.status = :status";
            Query query = session.createQuery(hql);
            query.setParameter("status", status) ;
            List<rentDetail> result = query.list();
            if (result != null)
                return result;
        } catch (Exception e) {
            System.out.println("Lỗi : " + e);
        }
        return null;
    }

    @Override
    public boolean insertDetail(rentDetail rent) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.save(rent);
            System.out.println(rent.toString());
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
    public List<rentDetail> getRentDetailFromContractId(String contractId) {
        Session session = factory.openSession();

        try {
            String hql = "FROM rentDetail rent WHERE rent.contract.contractId = :contractId and rent.contract.status=1 and rent.checkOutDate=null";
            Query query = session.createQuery(hql);
            query.setParameter("contractId", contractId);
            List<rentDetail> result = query.list();
            if (result != null)
                return result;
        } catch (Exception e) {
            System.out.println("Lỗi : " + e);
        }
        return null;
    }

    @Override
    public boolean updateRent(rentDetail rent) {
        Session session = factory.openSession() ;
        Transaction t =  session.beginTransaction();
        try{
            session.update(rent);
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
    public int countRentDetailOfATenant(String tenantId) {
        Session session = factory.openSession();
        try {
            String hql = "select count(*) from rentDetail r where r.tenant.CMND = :tenantId and r.checkOutDate = null";
            Query query = session.createQuery(hql);
            query.setParameter("tenantId", tenantId);
            return ((Number) query.uniqueResult()).intValue();
        } catch (Exception e) {
            return 0;
        }
    }


}
