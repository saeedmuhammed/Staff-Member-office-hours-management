 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mail.ejb.sendMailBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javainfinite.DAOImpl.appointmentDaoImpl;
import javainfinite.DAOImpl.notificationDaoImpl;
import javainfinite.DAOImpl.officehoursDaoImpl;
import javainfinite.DAOImpl.slotDaoImpl;
import javainfinite.DAOImpl.staffmemberDAOImpl;
import javainfinite.DAOImpl.studentDaoImpl;
import javainfinite.pojo.appointment;
import javainfinite.pojo.notificationn;
import javainfinite.pojo.officehourss;
import javainfinite.pojo.slot;
import javainfinite.pojo.staffmember;
import javainfinite.pojo.student;
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
@WebServlet(urlPatterns = {"/cancelreserve"})
public class cancelreserve extends HttpServlet {

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
          
             if(request.getParameter("cancel")!=null){
            HttpSession session = request.getSession(true);
           String id = request.getSession().getAttribute("memId").toString();
           int c=0;
      officehoursDaoImpl officehoursDaoImpl = new officehoursDaoImpl(); 
      List<officehourss> officehours = officehoursDaoImpl.getOfficeHourByDate(request.getParameter("date"),id);
      
      slotDaoImpl slotDaoImpl = new slotDaoImpl();
       if(officehours.size() != 0){
           List<slot> slots = slotDaoImpl.showAllSlotsOfOfficeHours((String.valueOf(officehours.get(0).getId())));
           if(slots.size() != 0){
               for(slot slot : slots){
               if(slot.getReserved().equals("1")){
                   c++;
               String slotid = String.valueOf(slot.getSlotid());
               slot.setReserved("0");
               slotDaoImpl.updateSlot(slot);
               appointmentDaoImpl appointmentDaoImpl = new appointmentDaoImpl();
               List<appointment> appointments = appointmentDaoImpl.showAllAppointmentsOfSlotid(slotid);
               if(appointments.size() != 0){
               for(appointment appointment : appointments ){
                    staffmemberDAOImpl staffmemberDaoImpl = new staffmemberDAOImpl();
                    staffmember staffmember = staffmemberDaoImpl.getStaffMemberByID(id); 
                    appointmentDaoImpl.deleteAppointment(appointment);
                notificationDaoImpl  notificationDaoImpl = new  notificationDaoImpl();
                notificationn notification = new notificationn();
                notification.setId(appointment.getStudentid());
                notification.setMemberid(id);
                java.util.Date date2 = new java.util.Date(); 
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
                notification.setDate(formatter.format(date2));
                notification.setBody("Your Meeting was canceled at date " + appointment.getDate().toString()+" Form "+appointment.getStart()+" To "+appointment.getEnd());
               // notification.setBody("cancel meeting");
                notification.setToMember(staffmember.getEmail());
               student student = new student();
               studentDaoImpl studentDaoImpl = new studentDaoImpl();
               student = studentDaoImpl.getStudentByID(appointment.getStudentid());
               notification.setTo(student.getEmail());
               notification.setSent("yes");
               notificationDaoImpl.savenotification(notification);
                sendMailBean mailSender = new sendMailBean("meetingsystem2020@gmail.com",notification.getTo(),"Cancellation Meeting",notification.getBody());
                sendMailBean mailSender2 = new sendMailBean("meetingsystem2020@gmail.com",notification.getToMember(),"Cancellation Meeting",notification.getBody());
                   
                   
               
               
               } 

               }
               
               
               }
               
               
               
           } 
               
           if(c!=0){
               
               //out.print("Appointments canceld");
           
                   out.println("<script>");
                 out.println("alert('Appointments canceld');");
                 out.println("location='cancel_reserve.jsp';");
                 out.println("</script>");
           
           }    
               
           else{    
            // out.print("There no appointments in this date"); 
             
                   out.println("<script>");
                 out.println("alert('There no appointments in this date');");
                 out.println("location='cancel_reserve.jsp';");
                 out.println("</script>");
           }
           }
           
           
       
       
       }
       
       else{
       //out.print("There no date in this office hours");
       
                   out.println("<script>");
                 out.println("alert('There no date in this office hours');");
                 out.println("location='cancel_reserve.jsp';");
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
            Logger.getLogger(cancelreserve.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(cancelreserve.class.getName()).log(Level.SEVERE, null, ex);
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
