/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javainfinite.DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javainfinite.DAO.messageDao;
import javainfinite.pojo.message;
import javainfinite.pojo.officehourss;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Dell
 */
public class messageDaoImpl implements messageDao {

    @Override
    public void saveMessage(message message) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(message);
        transaction.commit();
        session.close();
     }

    @Override
    public List<message> showMessageToid(String memberID) {
        List<message> message = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From message where toid ='"+memberID+"'");
        message = query.list();
        return message;
     }
    
    @Override
    public List<message> showMessageFromid(String memberID) {
         List<message> message = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From message where fromid = '"+memberID+"'");
        message = query.list();
        return message;
     }
    

    @Override
    public void updateMessage(message message) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.update(message);
        transaction.commit();
        session.close();
     }

    @Override
    public void deleteMessage(message message) { 
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(message);
        transaction.commit();
        session.close();
        
     }

    
    
}
