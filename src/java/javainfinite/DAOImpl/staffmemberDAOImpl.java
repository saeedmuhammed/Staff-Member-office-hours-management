/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javainfinite.DAOImpl;

import java.util.ArrayList;
import java.util.List;
import javainfinite.DAO.staffmemberDao;
import javainfinite.pojo.staffmember;
import javainfinite.pojo.student;
import javainfinite.pojo.subject;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Dell
 */
public class staffmemberDAOImpl implements staffmemberDao {

    @Override
    public void saveStaffMember(staffmember staffmember) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(staffmember);
        transaction.commit();
        session.close();
     }

    @Override
    public List<staffmember> showAllStaffMember(String subjectid) {
        List<staffmember> staffmember = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From staffmember where subjectid ='"+ subjectid +"'");
        staffmember = query.list();
        return staffmember;
     }

    @Override
    public void updateStaffMember(staffmember staffmember) {
         Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.update(staffmember);
        transaction.commit();
        session.close();
     }

    @Override
    public void deleteStaffMember(staffmember staffmember) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(staffmember);
        transaction.commit();
        session.close();
     }

    @Override
    public staffmember getStaffMemberByID(String id) {
    staffmember staffmember = null;   
    Session session = HibernateUtil.getSessionFactory().openSession();
    staffmember =  (staffmember) session.get(staffmember.class, id);
    return staffmember;
    
      }
    
}
