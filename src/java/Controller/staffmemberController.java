/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javainfinite.DAOImpl.staffmemberDAOImpl;
import javainfinite.pojo.staffmember;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dell
 */
@WebServlet(name = "staffmemberController", urlPatterns = {"/staffmemberController"})
public class staffmemberController extends HttpServlet {
         
    staffmember staffmember = new staffmember();
    staffmemberDAOImpl staffmemberDAOImpl = new staffmemberDAOImpl(); 

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            HttpSession session = request.getSession(true);
              
        try (PrintWriter out = response.getWriter()) {
              String id = request.getParameter("id");
              String password = request.getParameter("password");


            if(request.getParameter("staffmemberlogin")!=null){
               staffmember = staffmemberDAOImpl.getStaffMemberByID(id);

               if(staffmember != null){

                    String passworduser = staffmember.getPassword();
                                                    


                if(passworduser.equals(password)){

                              session.setAttribute("memId",id);
                              session.setAttribute("name",staffmember.getName());
                              session.setAttribute("email",staffmember.getEmail());
                              session.setAttribute("phone",staffmember.getPhone());
                              session.setAttribute("phone",staffmember.getRole());
                              session.setAttribute("subjectid",staffmember.getSubjectid());
                              session.setAttribute("password",staffmember.getPassword());
                              
                              
                          RequestDispatcher rd = request.getRequestDispatcher("viewMesgHome.jsp");
                          rd.forward(request, response);
                   }
                else{ 
                    
                 out.println("<script>");
                 out.println("alert('Wrong password');");
                 out.println("location='staffmemberlogin.jsp';");
                 out.println("</script>");
                
                }
               
               
               } 
               
               else{
               out.println("<script>");
                 out.println("alert('There is no member with this id');");
                 out.println("location='staffmemberlogin.jsp';");
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
