/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javainfinite.DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javainfinite.DAO.subjectDao;
import javainfinite.pojo.subject;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Dell
 */
public class subjectDaoImpl implements subjectDao {

    @Override
    public void saveSubject(subject subject) { Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(subject);
        transaction.commit();
        session.close();
     }

    @Override
    public List<subject> showAllSubject(String id) {
        List<subject> subjectList = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From subject where id ='"+id+"'");
        subjectList = query.list();
        return subjectList;
     }

    @Override
    public void updateSubject(subject subject) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.update(subject);
        transaction.commit();
        session.close();
     }
    

    @Override
    public void deleteSubject(subject subject) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(subject);
        transaction.commit();
        session.close();
     }

    @Override
    public subject getSubjectByID(String id) {
    subject subject = null;   
    Session session = HibernateUtil.getSessionFactory().openSession();
    subject  =  (subject) session.get(subject.class, id);
     return subject;
     }
    @Override
    public subject getSubjectByName(String name) {
        subject subject = null;   
    Session session = HibernateUtil.getSessionFactory().openSession();
    subject  =  (subject) session.get(subject.class.getName(),name);
    
    return subject;
     }
    
}
