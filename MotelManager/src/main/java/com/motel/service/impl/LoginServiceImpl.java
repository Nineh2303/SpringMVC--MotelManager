package com.motel.service.impl;

import com.motel.entity.User;
import com.motel.service.LoginService;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    SessionFactory factory;
    @Override
    public User checkLoginAdmin(String username, String password) {
        Session session = factory.openSession();
        System.out.println(username);
        System.out.println(password);
        try {
            String hql = "FROM User as u where u.username= :username and u.password= :password";
            Query query = ((Session) session).createQuery(hql);
            query.setParameter("username", username);
            query.setParameter("password", password);
            User result = (User) query.uniqueResult();
            if (result != null) {
                return result;
            }
        } catch (Exception e) {
            System.out.println("Lỗi: " + e);
        }
        return null;
    }
}
