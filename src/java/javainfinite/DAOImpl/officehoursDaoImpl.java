/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javainfinite.DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javainfinite.DAO.officehoursDao;
import javainfinite.pojo.officehourss;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Saeed
 */
public class officehoursDaoImpl implements officehoursDao {

    @Override
    public void saveOfficeHours(officehourss officehour) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(officehour);
        transaction.commit();
        session.close();

    }

    @Override
    public List<officehourss> showAllOfficeHoursOfMember(String memberID) {
        List<officehourss> officehours = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From officehourss where memberid='" + memberID+"'");
        officehours = query.list();
        return officehours;
       
    }
     public List<officehourss> showAllOfficeHours(String memberID,String col , String data){
      List<officehourss> officehours = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From officehourss where memberid='" + memberID+"' and " + col + "='"+data+"'");
        officehours = query.list();
        return officehours;
     
     
     }
    @Override
    public List<officehourss> getOfficeHourByID(String id,String memberid){
       
        List<officehourss> officehours = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From officehourss where id='" + id+"' and memberid ='"+memberid+"'");
        officehours = query.list();
        return officehours;
    
    }

    @Override
    public void updateOfficeHours(officehourss officehour) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.update(officehour);
        transaction.commit();
        session.close();       
    }

    @Override
    public void deleteOfficeHour(officehourss officehour) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(officehour);
        transaction.commit();
        session.close();
      

    }

    @Override
    public officehourss getOfficeHourByID(String id) {
        officehourss officehour = null;   
    Session session = HibernateUtil.getSessionFactory().openSession();
    officehour =  (officehourss) session.get(officehourss.class, id);
    return officehour;
    


    }
     @Override
    public List<officehourss> getOfficeHourByDate(String Date,String id) {
        List<officehourss> officehours = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From officehourss where date='" + Date+"' and memberid ='"+id+"'");
        officehours = query.list();
        return officehours;
      }
    
}
