/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javainfinite.DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javainfinite.DAO.notificationDao;
import javainfinite.pojo.message;
import javainfinite.pojo.notificationn;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Dell
 */
public class notificationDaoImpl implements notificationDao {

    @Override
    public void savenotification(notificationn notification) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(notification);
        transaction.commit();
        session.close();
    }

    @Override
    public void updatenotification(notificationn notification) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.update(notification);
        transaction.commit();
        session.close();
    }

    @Override
    public void deletenotification(notificationn notification) {
          Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(notification);
        transaction.commit();
        session.close();
    }

    @Override
    public List<notificationn> showAllNotificationDate(String Date) {
       List<notificationn> notification = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From notificationn where date ='"+Date+"'");
        notification = query.list();
        return notification;
    }
    
    @Override
    public List<notificationn> showAllNotification() {
       List<notificationn> notification = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From notificationn ");
        notification = query.list();
        return notification;
    }
    
}
