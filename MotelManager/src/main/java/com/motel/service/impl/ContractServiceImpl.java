package com.motel.service.impl;

import com.motel.entity.Contract;
import com.motel.entity.Room;
import com.motel.entity.rentDetail;
import com.motel.service.ContractService;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.querydsl.QuerydslRepositoryInvokerAdapter;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ContractServiceImpl implements ContractService {
    @Autowired
    SessionFactory factory;

    @Override
    public List<Contract> isAvailableContract(Integer offset, Integer maxResult) {
        Session session = factory.openSession();
        try {
            String hql = "FROM Contract contract WHERE contract.status=1";
            Query query = session.createQuery(hql);
            query.setFirstResult((offset != null) ? offset : 0);
            List<Contract> result = query.list();
            if (result != null)
                return result;
        } catch (Exception e) {
            System.out.println("Lỗi : " + e);
        }
        return null;
    }

    @Override
    public List<Contract> allContract(Integer offset, Integer maxResult) {
        Session session = factory.openSession();
        try {
            String hql = "FROM Contract";
            Query query = session.createQuery(hql);
            query.setFirstResult((offset != null) ? offset : 0);
            List<Contract> result = query.list();
            if (result != null)
                return result;
        } catch (Exception e) {
            System.out.println("Lỗi : " + e);
        }
        return null;
    }

    @Override
    public boolean insertContract(Contract contract) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.save(contract);
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
    public boolean checkOutForContract(rentDetail rent, Date checkOutDate) {
        int count = 0 ;
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        Contract contract =  (Contract) session.get(Contract.class , rent.getContract().getContractId());
        try {
            String hql = "select count(*) from rentDetail r where r.contract.contractId = :contractId and r.checkOutDate=null";
            Query query = session.createQuery(hql);
            query.setParameter("contractId" , contract.getContractId());
            count = ((Number) query.uniqueResult()).intValue();
        } catch (Exception e) {
            return false ;
        }
        try {
            if(count ==0 ) {
                contract.setCheckOutDate(checkOutDate);
                contract.setStatus(0);
                session.update(contract) ;
                t.commit();
                return true;
            }
            else {
                return true;
            }
        } catch (Exception e) {
            t.rollback();
        } finally {
            session.close() ;
        }
        return false ;
    }

    @Override
    public Contract getActiveContractInARoom(String roomId) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            String hql="FROM Contract c WHERE c.roomId = :roomId AND c.status =1" ;
            Query query = session.createQuery(hql);
            query.setParameter("roomId", roomId) ;
            return (Contract )query.uniqueResult();
        }
        catch (Exception e){
            return null ;
        }
    }

}
