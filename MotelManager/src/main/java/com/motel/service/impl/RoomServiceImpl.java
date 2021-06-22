package com.motel.service.impl;

import com.motel.entity.Contract;
import com.motel.entity.Room;
import com.motel.entity.Tenant;
import com.motel.service.RoomService;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomServiceImpl implements RoomService {
    @Autowired
    SessionFactory factory;

    @Override
    public List<Room> getAllRoom(Integer offset, Integer maxResult) {
        Session session = factory.openSession();
        try {
            String hql = "FROM Room";
            Query query = session.createQuery(hql);
            query.setFirstResult((offset != null) ? offset : 0);
            List<Room> result = query.list();
            if (result != null)
                return result;
        } catch (Exception e) {
            System.out.println("Lỗi : " + e);
        }
        return null;
    }

    @Override
    public boolean insertRoom(Room room) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.save(room);
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
    public boolean removeRoom(String roomId) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            Room room = (Room) session.get(Room.class, roomId);
            session.delete(room);
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
    public boolean updateRoom(Room room) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        try {
            session.update(room);
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
    public boolean updateStatusRoom(Room room) {
        Session session = factory.openSession();
        Transaction t = session.beginTransaction();
        String hql = "select count(*) from Contract c where c.roomId = :roomId  and c.status=1 ";
        Query query = session.createQuery(hql);
        query.setParameter("roomId", room.getRoomId());
        int count = ((Number) query.uniqueResult()).intValue();
        if (count == 0) {
            try {
                room.setStatus(0);
                session.update(room);
                t.commit();
                return true;
            } catch (Exception e) {
                t.rollback();
                return false;
            }
        } else {
            return true;
        }
    }

    @Override
    public List<Room> getRoomByHomeId(String homeId, Integer offset, Integer maxResult) {
        Session session = factory.openSession();
        try {
            String hql = "FROM Room  r WHERE r.homeId = :id ";
            Query query = session.createQuery(hql);
            query.setParameter("id", homeId);
            query.setFirstResult((offset != null) ? offset : 0);
            List<Room> result = query.list();
            if (result != null)
                return result;
        } catch (Exception e) {
            System.out.println("Lỗi : " + e);
        }
        return null;
    }

    @Override
    public List<Tenant> showTenantInRoom(String homeId) {
        Session session = factory.openSession();
        try {
            String hql = "";
            Query query = session.createQuery(hql);
            query.setParameter("id", homeId);
            List<Tenant> result = query.list();
            if (result != null) return result;
        } catch (Exception e) {
            System.out.println("Lỗi: " + e);
        }
        return null;
    }


    @Override
    public Contract getContractFromRoomId(String roomId) {
        Session session = factory.openSession();
        try {
            String hql = "FROM Contract p where p.roomId = :id ";
            Query query = session.createQuery(hql);
            query.setParameter("id", roomId);
            Contract contract = (Contract) query.uniqueResult();
            return contract;
        } catch (Exception e) {
            return null;
        }

    }
    @Override
    public Contract getActiveContractFromRoomId(String roomId) {
        Session session = factory.openSession();
        try {
            String hql = "FROM Contract p where p.roomId = :id and p.status = 1";
            Query query = session.createQuery(hql);
            query.setParameter("id", roomId);
            Contract contract = (Contract) query.uniqueResult();
            return contract;
        } catch (Exception e) {
            return null;
        }

    }

    @Override
    public int getCountFromContractId(String roomId) {
        Contract contract = getContractFromRoomId(roomId);
        Session session = factory.openSession();
        try {
            String hql = "select count(*) from rentDetail r where r.contract.contractId = :contractId and r.checkOutDate is null";
            Query query = session.createQuery(hql);
            query.setParameter("contractId", contract.getContractId());
            return ((Number) query.uniqueResult()).intValue();
        } catch (Exception e) {
            return 0;
        }

    }
}
