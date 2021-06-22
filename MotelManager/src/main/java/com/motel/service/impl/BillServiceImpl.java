package com.motel.service.impl;

import com.motel.entity.Bill;
import com.motel.entity.BillDetail;
import com.motel.service.BillService;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
@Service
public class BillServiceImpl implements BillService {
    @Autowired
    SessionFactory factory;

    @Override
    public List<BillDetail> getAllServiceOffTheBill(String billId) {
        Session session = factory.openSession();
        Bill bill = (Bill) session.get(Bill.class, billId) ;
        try {
            String hql = "FROM BillDetail billD  WHERE billD.bill = :bill";
            Query query = session.createQuery(hql);
            query.setParameter( "bill" ,bill);
            List<BillDetail> result = query.list();
            if (result != null)
                return result;
        } catch (Exception e) {
            System.out.println("Lỗi : " + e);
        }
        return null;
    }

    @Override
    public List<Bill> searchBillByDate(Date fromDate, Date toDate) {
        Session session = factory.openSession();
        try {
            String hql = "FROM Bill bill  WHERE bill.date BETWEEN :fromDate AND :toDate";
            Query query = session.createQuery(hql);
            query.setParameter( "fromDate" ,fromDate);
            query.setParameter( "toDate" ,toDate);
            List<Bill> result = query.list();
            if (result != null)
                return result;
        } catch (Exception e) {
            System.out.println("Lỗi : " + e);
        }
        return null;
    }
}
