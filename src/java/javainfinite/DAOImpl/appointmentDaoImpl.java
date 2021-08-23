/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javainfinite.DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javainfinite.DAO.appointmentDao;
import javainfinite.pojo.appointment;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Saeed
 */
public class appointmentDaoImpl implements appointmentDao {

    @Override
    public void saveAppointment(appointment appointment) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(appointment);
        transaction.commit();
        session.close();    
    }

    @Override
    public List<appointment> showAllAppointmentsOfStudent(String id) {
        List<appointment> appointmentList = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From appointment where studentid ='"+id+"'");
        appointmentList = query.list();
        return appointmentList;
    }
    
     @Override
    public List<appointment> showAllAppointmentsOfMember(String id) {
        List<appointment> appointmentList = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From appointment where memberid ='"+id+"'");
        appointmentList = query.list();
        return appointmentList;
    }

    @Override
    public void updateAppointment(appointment appointment) {
Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.update(appointment);
        transaction.commit();
        session.close();       }

    @Override
    public void deleteAppointment(appointment appointment) {
Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(appointment);
        transaction.commit();
        session.close();    }

    @Override
    public appointment getAppointmentByID(int id) {
 appointment appointment = null;   
    Session session = HibernateUtil.getSessionFactory().openSession();
    appointment =  (appointment) session.get(appointment.class, id);
    
    return appointment;    }

    @Override
    public List<appointment> showAllAppointments(String col, String data, String id) {
        List<appointment> appointmentList = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From appointment where "+col+ " = '"+data+"' and memberid = '"+id+"'");
        appointmentList = query.list();
        return appointmentList;
    }

    @Override
    public List<appointment> showAllAppointmentsOfSlotid(String slotid) {
         List<appointment> appointmentList = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From appointment where slotid ='"+slotid+"'");
        appointmentList = query.list();
        return appointmentList;
    
    }
    
}
