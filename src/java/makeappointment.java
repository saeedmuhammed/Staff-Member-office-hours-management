/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mail.ejb.sendMailBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
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
@WebServlet(urlPatterns = {"/makeappointment"})
public class makeappointment extends HttpServlet {

    appointment appointment = new appointment();
    appointmentDaoImpl appointmentDaoImpl = new appointmentDaoImpl();
    slot slot = new slot();
    slot slott = new slot();
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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String memberID = request.getSession().getAttribute("memberId").toString();
            String studentID = request.getSession().getAttribute("id").toString();
            String date = request.getParameter("date");
            String slotID = request.getParameter("slotid");
            //Date sqldate=  java.sql.Date.valueOf(date);

            List<appointment> appointments = appointmentDaoImpl.showAllAppointmentsOfStudent(studentID);
            slot = slotDaoImpl.getSlotByID(Integer.parseInt(slotID));
            int c = 0;
            for (appointment appointment : appointments) {

                slott = slotDaoImpl.getSlotByID(Integer.parseInt(appointment.getSlotid()));
                if (appointment.getDate().toString().equals(date) && (slot.getFrom().equals(slott.getFrom()) && (slot.getTo().equals(slott.getTo())))) {
                    c = 1;

                }
            }

            if (c == 1) {

                out.println("<script>");
                out.println("alert('You have appointment at this time and date');");
                out.println("location='viewofficehours.jsp';");
                out.println("</script>");
            } else if (c == 0) {

                slot.setReserved("1");
                slotDaoImpl.updateSlot(slot);

                appointment.setMemberid(memberID);
                appointment.setStudentid(studentID);
                appointment.setStart(slot.getFrom());
                appointment.setEnd(slot.getTo());
                appointment.setDate(date);
                appointment.setSlotid(slotID);

                appointmentDaoImpl.saveAppointment(appointment);

                notificationn notification = new notificationn();
                notificationDaoImpl notificationDoaImpl = new notificationDaoImpl();

                notification.setDate(date);
                notification.setMemberid(memberID);
                notification.setStudentid(studentID);

                student student = new student();
                studentDaoImpl studentDaoImpl = new studentDaoImpl();
                student = studentDaoImpl.getStudentByID(studentID);
                if (student != null) {
                    notification.setTo(student.getEmail());
                }
                staffmemberDAOImpl staffmemberDAOImpl = new staffmemberDAOImpl();
                staffmember staffmember = staffmemberDAOImpl.getStaffMemberByID(memberID);
                if (staffmember != null) {
                    notification.setToMember(staffmember.getEmail());
                }
                String body = "You Have today meeting Started At: (" + slot.getFrom() + ") Ended At: (" + slot.getTo() + ") With Member  " + staffmember.getName();
                notification.setBody(body);
                notification.setSent("no");

                notificationDoaImpl.savenotification(notification);

                notificationn notification2 = new notificationn();
                java.util.Date date2 = new java.util.Date();
                SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                notification.setDate(formatter.format(date2));
                notification.setMemberid(memberID);
                notification.setStudentid(studentID);

                String body2 = "You have new meeting Started At: (" + slot.getFrom() + ") Ended At: (" + slot.getTo() + ") With Stundet " + studentID + " at date :  " + date;
                notification.setBody(body2);
                notification.setSent("yes");

                notificationDoaImpl.savenotification(notification);
                sendMailBean mailSender = new sendMailBean("meetingsystem2020@gmail.com", staffmember.getEmail(), body2);

                out.println("<script>");
                out.println("alert('Appointment done successfully');");
                out.println("location='viewofficehours.jsp';");
                out.println("</script>");
                //RequestDispatcher rd = request.getRequestDispatcher("viewofficehours.jsp");
                //            rd.forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
