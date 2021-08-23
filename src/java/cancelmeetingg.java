/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mail.ejb.sendMailBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javainfinite.DAOImpl.appointmentDaoImpl;
import javainfinite.DAOImpl.notificationDaoImpl;
import javainfinite.DAOImpl.slotDaoImpl;
import javainfinite.DAOImpl.staffmemberDAOImpl;
import javainfinite.DAOImpl.studentDaoImpl;
import javainfinite.pojo.appointment;
import javainfinite.pojo.notificationn;
import javainfinite.pojo.slot;
import javainfinite.pojo.staffmember;
import javainfinite.pojo.student;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Saeed
 */
@WebServlet(urlPatterns = {"/cancelmeetingg"})
public class cancelmeetingg extends HttpServlet {

        appointment appointment = new appointment();
           appointmentDaoImpl appointmentDaoImpl = new appointmentDaoImpl();
           slot slot = new slot();
           slotDaoImpl slotDaoImpl = new slotDaoImpl();
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
           
            if(request.getParameter("cancelMeeting")!=null){
            
                String meetingId=request.getParameter("meetingId");
                appointment=appointmentDaoImpl.getAppointmentByID(Integer. parseInt(meetingId));
                if(appointment!=null){
                String memberid = appointment.getMemberid();
                String idstudent = appointment.getStudentid();
                String slotId = appointment.getSlotid();
                String date = appointment.getDate().toString();
                appointmentDaoImpl.deleteAppointment(appointment);
                slot = slotDaoImpl.getSlotByID(Integer.parseInt(slotId));
                slot.setReserved("0");
                slotDaoImpl.updateSlot(slot);
                
                
                
                staffmemberDAOImpl staffmemberDaoImpl = new staffmemberDAOImpl();
                staffmember staffmember = staffmemberDaoImpl.getStaffMemberByID(memberid);
                
                notificationDaoImpl  notificationDaoImpl = new  notificationDaoImpl();
                notificationn notification = new notificationn();
                notification.setId(idstudent);
                notification.setMemberid(memberid);
                java.util.Date date2 = new java.util.Date(); 
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
                notification.setDate(formatter.format(date2));
                notification.setBody("Your Meeting was canceled at date " + date+" Form "+appointment.getStart()+" To "+appointment.getEnd());
               // notification.setBody("cancel meeting");
                notification.setToMember(staffmember.getEmail());
               student student = new student();
               studentDaoImpl studentDaoImpl = new studentDaoImpl();
               student = studentDaoImpl.getStudentByID(idstudent);
               notification.setTo(student.getEmail());
               notification.setSent("yes");
               notificationDaoImpl.savenotification(notification);
               sendMailBean mailSender = new sendMailBean("meetingsystem2020@gmail.com",notification.getTo(),"Cancellation Meeting",notification.getBody());
                sendMailBean mailSender2 = new sendMailBean("meetingsystem2020@gmail.com",notification.getToMember(),"Cancellation Meeting",notification.getBody());
                
                 out.println("<script>");
                 out.println("alert('Cancel successfully');");
                 out.println("location='cancelmeeting.jsp';");
                 out.println("</script>");
                // RequestDispatcher rd = request.getRequestDispatcher("cancelmeeting.jsp");
                  //        rd.forward(request, response);
                }
                else{
                  
                 out.println("<script>");
                 out.println("alert('There is no appointment with this id');");
                 out.println("location='cancelmeeting.jsp';");
                 out.println("</script>");    
                //out.println("There is no appointment with this id");
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
                Logger.getLogger(cancelmeetingg.class.getName()).log(Level.SEVERE, null, ex);
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
                Logger.getLogger(cancelmeetingg.class.getName()).log(Level.SEVERE, null, ex);
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
