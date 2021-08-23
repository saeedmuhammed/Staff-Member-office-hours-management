/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javainfinite.DAOImpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javainfinite.DAO.studentDao;
import javainfinite.pojo.student;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Saeed
 */
public class studentDaoImpl implements studentDao{

    @Override
    public void saveStudent(student student) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.save(student);
        transaction.commit();
        session.close();




    }

    @Override
    public List<student> showAllStudents() {
        List<student> studentList = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From student");
        studentList = query.list();
        return studentList;

    }

   

    @Override
    public void deleteStudent(student student) {
       Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(student);
        transaction.commit();
        session.close();


    }
    @Override
    public void updateStudent(student student) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();
        session.update(student);
        transaction.commit();
        session.close();        


    }

    @Override
    public student getStudentByID(String id){
     student student = null;   
    Session session = HibernateUtil.getSessionFactory().openSession();
    student =  (student) session.get(student.class, id);
    
    return student;
    }

    @Override
    public boolean getStudentByEmail(String email) {
        List<student> studentList = new ArrayList();
        Session session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From student where email ='"+email+"'");
        studentList = query.list();
        if(studentList.size()>0){return true;}
        
        return false;
    }
    
}
