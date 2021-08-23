/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javainfinite.DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javainfinite.DAO.slotDao;
import javainfinite.pojo.slot;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Saeed
 */
public class slotDaoImpl implements slotDao{

    @Override
    public void saveSlot(slot slot) {
       Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(slot);
        transaction.commit();
        session.close();

    }

    @Override
    public List<slot> showAllSlotsOfOfficeHours(String officeHourID) {
         List<slot> slotList = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From slot where officehoursid ='"+officeHourID+"'");
        slotList = query.list();
        return slotList;

    }
     @Override
    public List<slot> showSlotInScepificTime(String from , String to){
    
        List<slot> slotList = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From slot where fromm ='"+from+"' and too='"+to+"'");
        slotList = query.list();
        return slotList;
    
    }

    @Override
    public void updateSlot(slot slot) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.update(slot);
        transaction.commit();
        session.close();        
    }

    @Override
    public void deleteslot(slot slot) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(slot);
        transaction.commit();
        session.close();    }

    @Override
    public slot getSlotByID(int id) {
    slot slot = null;   
    Session session = HibernateUtil.getSessionFactory().openSession();
    slot  =  (slot) session.get(slot.class, id);
     return slot;
        }
    
    
}
