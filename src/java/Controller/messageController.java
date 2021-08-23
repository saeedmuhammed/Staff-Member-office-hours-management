/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import com.mail.ejb.sendMailBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javainfinite.DAOImpl.messageDaoImpl;
import javainfinite.DAOImpl.messagestaffmemberDaoImpl;
import javainfinite.DAOImpl.notificationDaoImpl;
import javainfinite.DAOImpl.staffmemberDAOImpl;
import javainfinite.DAOImpl.studentDaoImpl;
import javainfinite.DAOImpl.subjectDaoImpl;
import javainfinite.pojo.message;
import javainfinite.pojo.messagestaffmember;
import javainfinite.pojo.notificationn;
import javainfinite.pojo.staffmember;
import javainfinite.pojo.student;
import javainfinite.pojo.subject;
import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Saeed
 */
@WebServlet(name = "messageController", urlPatterns = {"/messageController"})
public class messageController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, MessagingException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           HttpSession session = request.getSession(true);
           
           if(request.getParameter("reply")!=null){
           String memberId = request.getSession().getAttribute("memId").toString();
              String studentId = request.getParameter("studentID");
              String message = request.getParameter("message");
              message messagee = new message();
              messageDaoImpl messageDaoImpl = new messageDaoImpl();
              
              
              messagee.setFromid(memberId);
              messagee.setToid(studentId);
              messagee.setData(message);
              messageDaoImpl.saveMessage(messagee);
              
                   out.println("<script>");
                 out.println("alert('Reply sent successfully');");
                 out.println("location='messagestaffmemberstudents.jsp';");
                 out.println("</script>");
              
          
           }
           
            if(request.getParameter("sendTostudent")!=null){
           String memberId = request.getSession().getAttribute("memId").toString();
              student student = new student();
              //String memberId = request.getSession().getAttribute("memId").toString();
              String messagee=request.getParameter("message");
              String studentId=  request.getParameter("id");
              studentDaoImpl studentDaoImpl = new studentDaoImpl(); 
                student = studentDaoImpl.getStudentByID(studentId);
            if(student != null){
                
                message message = new message();
                messageDaoImpl messageDaoImpl = new messageDaoImpl();
                
                message.setData(messagee);
                message.setToid(studentId);
                
                message.setFromid(memberId);
                
               
                messageDaoImpl.saveMessage(message);
                
                out.println("<script>");
                 out.println("alert('Message sent successfully');");
                 out.println("location='sentmessage_staff_student.jsp';");
                 out.println("</script>");
                
                
                
             }
            else{
            
             out.println("<script>");
                 out.println("alert('There is no student with this id');");
                 out.println("location='sentmessage_staff_student.jsp';");
                 out.println("</script>");

            
            }
        
        
        }
            
         if(request.getParameter("sendTomember")!=null){
           String memberId = request.getSession().getAttribute("memId").toString();
            staffmember staffmember = new staffmember();
            staffmemberDAOImpl staffmemberDAOImpl = new staffmemberDAOImpl();
             String messagee=request.getParameter("message");
              String memberIdTo=  request.getParameter("id");
            // String memberId = request.getSession().getAttribute("memId").toString();
             staffmember = staffmemberDAOImpl.getStaffMemberByID(memberIdTo);
            if(staffmember != null){
                
                if(memberIdTo.equals(memberId)){
                
                
                   out.println("<script>");
                 out.println("alert('This is your id');");
                 out.println("location='sentmessage_staff_staff.jsp';");
                 out.println("</script>");
                
                }
                
                else{
                messagestaffmember message = new messagestaffmember();
                messagestaffmemberDaoImpl messageDaoImpl = new messagestaffmemberDaoImpl();
                
                
                message.setData(messagee);
                message.setToid(memberIdTo);
               // out.print(iduser);
                message.setFromid(memberId);
                               
               messageDaoImpl.saveMessage(message);
                
                 
               staffmemberDAOImpl staffmemberDaoImpl = new staffmemberDAOImpl();
               
                
                notificationDaoImpl  notificationDaoImpl = new  notificationDaoImpl();
                notificationn notification = new notificationn();
                notification.setId(memberId);
                notification.setMemberid(memberIdTo);
                java.util.Date date2 = new java.util.Date(); 
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
                notification.setDate(formatter.format(date2));
              
               // notification.setBody("cancel meeting");
                
               student student = new student();
                staffmember staffmember2 = new staffmember();
               staffmember2 = staffmemberDAOImpl.getStaffMemberByID(memberId);
                 notification.setBody("You have new message form "+staffmember2.getRole()+" / "+memberId);
               notification.setToMember(staffmember.getEmail());
               notification.setTo(staffmember2.getEmail());
               notification.setSent("yes");
               notificationDaoImpl.savenotification(notification);
               sendMailBean mailSender = new sendMailBean("meetingsystem2020@gmail.com",notification.getToMember(),"New Message",notification.getBody());
                
                //sendMailBean mailSender = new sendMailBean("se.seifzzzz@gmail.com",staffmember.getEmail(),"New Message","You have new message from :"+memberId);
                
               
               
               
               
               out.println("<script>");
                 out.println("alert('Message sent successfully');");
                 out.println("location='sentmessage_staff_staff.jsp';");
                 out.println("</script>");
                
                
                }  
             }
            else{
            
              out.println("<script>");
                 out.println("alert('There is no member with this id');");
                 out.println("location='sentmessage_staff_staff.jsp';");
                 out.println("</script>");

            
            }
        
            
        }
            if(request.getParameter("sendToteam")!=null){
               String memberId = request.getSession().getAttribute("memId").toString(); 
              String messagee=request.getParameter("message");
              String subjectId=  request.getParameter("id");
             //String memberId = request.getSession().getAttribute("memId").toString();
             subject subject = new subject();
             subjectDaoImpl subjectDaoImpl = new subjectDaoImpl();
             
             subject=subjectDaoImpl.getSubjectByID(subjectId);
             
             if(subject!=null){
             
             staffmemberDAOImpl staffmemberDAOImpl = new staffmemberDAOImpl();
             List<staffmember> staffmembers = staffmemberDAOImpl.showAllStaffMember(subjectId);
              staffmember staffmembermain = new staffmember();
              staffmembermain=staffmemberDAOImpl.getStaffMemberByID(memberId);
             if(staffmembers.size()!=0){
                
                 
                for(staffmember staffmember : staffmembers){ 
                messagestaffmember message = new messagestaffmember();
                messagestaffmemberDaoImpl messageDaoImpl = new messagestaffmemberDaoImpl();
                
                if(!staffmember.getId().equals(memberId)){
                message.setData(messagee);
                message.setToid(staffmember.getId());
                //out.print(iduser);
                message.setFromid(memberId);
                
               
               messageDaoImpl.saveMessage(message);
            
                
                
                 
                              
                
                notificationDaoImpl  notificationDaoImpl = new  notificationDaoImpl();
                notificationn notification = new notificationn();
                notification.setId(memberId);
                notification.setMemberid(staffmember.getId());
                java.util.Date date2 = new java.util.Date(); 
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
                notification.setDate(formatter.format(date2));
                notification.setBody("You have new message form"+memberId);
               // notification.setBody("cancel meeting");
                
               student student = new student();
               
               notification.setToMember(staffmember.getEmail());
               notification.setTo(staffmembermain.getEmail());
               notification.setSent("yes");
               notificationDaoImpl.savenotification(notification);
               sendMailBean mailSender = new sendMailBean("meetingsystem2020@gmail.com",notification.getToMember(),"New Message",notification.getBody());
              //sendMailBean mailSender = new sendMailBean("se.seifzzzz@gmail.com",staffmember.getEmail(),"New Message","You have new message from :"+memberId);
  
               
               
               
               
               out.println("<script>");
                 out.println("alert('Message sent successfully');");
                 out.println("location='message_subjectteam.jsp';");
                 out.println("</script>");
                }
                }  
         }
             
         }
             
             else{
             
                out.println("<script>");
                 out.println("alert('There is no subject with this id');");
                 out.println("location='message_subjectteam.jsp';");
                 out.println("</script>");
             
             }
             
             
            }
            
            
         if(request.getParameter("sendmessage")!=null){
           
            staffmember staffmember = new staffmember();
            staffmemberDAOImpl staffmemberDAOImpl = new staffmemberDAOImpl();
            
            
            staffmember = staffmemberDAOImpl.getStaffMemberByID(request.getParameter("id"));
            if(staffmember != null){
                
                message m = new message();
                messageDaoImpl messageDaoImpl = new messageDaoImpl();
                String iduser = (String)session.getAttribute("id");
                
                m.setData(request.getParameter("message"));
                m.setToid(request.getParameter("id"));
                 m.setFromid(iduser);
                
               
               messageDaoImpl.saveMessage(m);
               
               
                notificationDaoImpl  notificationDaoImpl = new  notificationDaoImpl();
                notificationn notification = new notificationn();
                notification.setId(iduser);
                notification.setMemberid(staffmember.getId());
                java.util.Date date2 = new java.util.Date(); 
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
                notification.setDate(formatter.format(date2));
                notification.setBody("You have new message from Student / "+iduser);
               // notification.setBody("cancel meeting");
                notification.setToMember(staffmember.getEmail());
               student student = new student();
               studentDaoImpl studentDaoImpl = new studentDaoImpl();
               student = studentDaoImpl.getStudentByID(iduser);
               notification.setTo(student.getEmail());
               notification.setSent("yes");
               notificationDaoImpl.savenotification(notification);
                  sendMailBean mailSender = new sendMailBean("meetingsystem2020@gmail.com",notification.getToMember(),"New Message",notification.getBody());
            
                //sendMailBean mailSender = new sendMailBean("se.seifzzzz@gmail.com",staffmember.getEmail(),"New Message","You have new message from :"+iduser);
                
               
               
                
               out.println("<script>");
                 out.println("alert('Message sent successfully');");
                 out.println("location='student_sent_message.jsp';");
                 out.println("</script>");
             
                
                
            }
            else{
            
              out.println("<script>");
                 out.println("alert('There is no staff member with this ID');");
                 out.println("location='student_sent_message.jsp';");
                 out.println("</script>");
             
            
            }
        
        
        }

        
        
            
        
        
        
        
        
            
            
            
            
            
            
            
            
            
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (MessagingException ex) {
            Logger.getLogger(messageController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (MessagingException ex) {
            Logger.getLogger(messageController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
