/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javainfinite.DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javainfinite.DAO.messagestaffmemberDao;
import javainfinite.pojo.message;
import javainfinite.pojo.messagestaffmember;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Dell
 */
public class messagestaffmemberDaoImpl implements messagestaffmemberDao {

    @Override
    public void saveMessage(messagestaffmember messagestaffmember) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(messagestaffmember);
        transaction.commit();
        session.close(); 
    
    }

    @Override
    public List<messagestaffmember> showAllMessage(String memberID) {
         List<messagestaffmember> messagestaffmember = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From messagestaffmember where toid = '"+memberID+"'");
        messagestaffmember = query.list();
        return messagestaffmember;
     }

    @Override
    public void updateMessage(messagestaffmember messagestaffmember) {
      Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.update(messagestaffmember);
        transaction.commit();
        session.close();  
    
    }

    @Override
    public void deleteMessage(messagestaffmember messagestaffmember) {
          Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(messagestaffmember);
        transaction.commit();
        session.close(); 
     }

    @Override
    public messagestaffmember getMessageByID(String id) {
     messagestaffmember messagestaffmember = null;   
    Session session = HibernateUtil.getSessionFactory().openSession();
    messagestaffmember =  (messagestaffmember) session.get(message.class, id);
    return messagestaffmember; 
    }
    
}
