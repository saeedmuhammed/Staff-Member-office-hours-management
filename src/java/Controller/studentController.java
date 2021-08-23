/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.util.*;  
import javax.mail.*;  
import javax.mail.internet.*;  
import javax.activation.*;   
import java.io.IOException;
import java.io.PrintWriter;
import javainfinite.DAO.studentDao;
import javainfinite.DAOImpl.studentDaoImpl;
import javainfinite.pojo.student;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import capatcha.verify;
import com.mail.ejb.sendMailBean;
import java.util.logging.Level;
import java.util.logging.Logger;
import javainfinite.DAOImpl.staffmemberDAOImpl;
import javainfinite.DAOImpl.subjectDaoImpl;
import javainfinite.pojo.staffmember;
import javainfinite.pojo.subject;
import javax.ejb.EJB;
/**
 *
 * @author Saeed
 */
public class studentController extends HttpServlet {
        
               
     
        student student = new student();
        studentDaoImpl studentDaoImpl = new studentDaoImpl();
         verify s = new verify();
         

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
        HttpSession session = request.getSession(true);

        try (PrintWriter out = response.getWriter()) {
    
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String year = request.getParameter("year");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
          
            if(request.getParameter("addstudent")!=null){
            
            
            student = studentDaoImpl.getStudentByID(id);
            if(student==null){
                if(studentDaoImpl.getStudentByEmail(email)){
                //out.println("<script>");
                 //out.println("alert('This email is taken');");
                 //out.println("location='studentsignup.jsp';");
                 //out.println("</script>");
                out.print("This email is taken");
                
                }
                
                else{   
            
            String gRecaptchaResponse = request.getParameter("g-recaptcha-response");
            
            boolean verify = s.verify(gRecaptchaResponse);
           
             if(verify){   //successful signup 
                 
                 
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 6) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String randpassword = salt.toString();
        student student2 = new student();
            student2.setId(id);
            student2.setName(name);
            student2.setYear(year);
            student2.setEmail(email);
            student2.setPassword(randpassword);
        
        String msg="Your password is "+randpassword;
                 
                 
                 

                 studentDaoImpl.saveStudent(student2);
                  sendMailBean mailSender = new sendMailBean("se.seifzzzz@gmail.com",email,"Your Password",msg);         
                 //out.println("<script>");
                 //out.println("alert('Signup Successfuly');");
                 //out.println("location='studentsignup.jsp';");
                 //out.println("</script>");
                 out.print("done");
                 //RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
                 //rd.forward(request, response);
              }
              else{
                // out.println("<script>");
                // out.println("alert('Please verify yourself');");
                // out.println("location='studentsignup.jsp';");
                 //out.println("</script>");
                 out.print("Please verify yourself");
                 
                 System.out.println("erooorrr");}
              }
            }
            
            else{
                
                //out.println("<script>");
                 //out.println("alert('This username is taken');");
                 //out.println("location='studentsignup.jsp';");
                 //out.println("</script>");
                out.print("This username is taken");
                System.out.println("this on the sys");}
              
            }
            
            else if(request.getParameter("login")!=null){
                
                  student = studentDaoImpl.getStudentByID(id);
 
            if(student!=null){
                 String passworduser = student.getPassword();
                if(passworduser.equals(password)){
                        System.out.println("Login successfully"); 
                              session.setAttribute("id",id);
                              session.setAttribute("name",student.getName());
                              session.setAttribute("email",student.getEmail());
                              session.setAttribute("year",student.getYear());
                              session.setAttribute("password",student.getPassword());
                
                    
                 //   out.println("<script>");
                // out.println("alert('Login successfully');");
                 //out.println("location='profilestudent.jsp';");
                // out.println("</script>");
                out.print("done");
                              
                             // response.sendRedirect("profilestudent.jsp");
                     // RequestDispatcher rd = request.getRequestDispatcher("profilestudent.jsp");
                       //rd.forward(request, response);
                   }
                else{ 
                    
                 //out.println("<script>");
                 //out.println("alert('Wrong Password');");
                // out.println("location='studentlogin.jsp';");
                // out.println("</script>");
                    
                    out.print("Wrong Password");
                }
            }
            else{
            
               out.print("Wrong username");
            
            }
            }
            else if(request.getParameter("changeprofile")!=null){
                
            String username = (String)session.getAttribute("id");
            
            student = studentDaoImpl.getStudentByID(username);
            if(student!=null){
                    
                student.setId(username);
                student.setName(request.getParameter("name"));
                student.setEmail(request.getParameter("email"));
                student.setYear(request.getParameter("year"));
                student.setPassword(request.getParameter("password"));
                studentDaoImpl.updateStudent(student);
                session.setAttribute("id",student.getId());
                session.setAttribute("name",student.getName());
                session.setAttribute("email",student.getEmail());
                session.setAttribute("year",student.getYear());
                session.setAttribute("password",student.getPassword());
                  //out.println("<script>");
                // out.println("alert('Update successuflly');");
                 //out.println("location='profilestudent.jsp';");
                 //out.println("</script>");
                 out.print("done");
               // RequestDispatcher rd = request.getRequestDispatcher("profilestudent.jsp");
                //rd.forward(request, response);
               
               }
             }
       else if(request.getParameter("search")!=null){
                staffmember staffmember = new staffmember();
                staffmemberDAOImpl staffmemberDAOImpl = new staffmemberDAOImpl();
                subject subject = new subject();
                subjectDaoImpl subjectDaoImpl = new subjectDaoImpl();
 
      List< subject> sub = subjectDaoImpl.showAllSubject(request.getParameter("subject"));
 
        //out.print(sub.get(0).getId());
       if(sub.size() != 0){
           
       String IdSubject = request.getParameter("subject");
              //out.print(<br>);

        out.print("Result Of Search : "); 
            out.print("<br>");
       List<staffmember> staffs = staffmemberDAOImpl.showAllStaffMember(IdSubject);
            for (int i = 0;i< staffs.size();i++){
           out.println("Name: "+staffs.get(i).getName());
                            out.print("<br>");

           out.println("Email: "+staffs.get(i).getEmail());
                       out.print("<br>");

           out.println("Phone: "+staffs.get(i).getPhone());          
           out.print("<br>");

           out.println("Role: "+staffs.get(i).getRole());
                       out.print("<br>");

           out.println("---------------------------------------------------");
                        out.print("<br>");

            }
         }
         else{out.print("There is no subject by this name");} 

    }
           
   // out.print("sasas");
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
                Logger.getLogger(studentController.class.getName()).log(Level.SEVERE, null, ex);
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
                Logger.getLogger(studentController.class.getName()).log(Level.SEVERE, null, ex);
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
    
