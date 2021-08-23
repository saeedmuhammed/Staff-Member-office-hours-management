/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javainfinite.DAOImpl.officehoursDaoImpl;
import javainfinite.DAOImpl.slotDaoImpl;
import javainfinite.pojo.officehourss;
import javainfinite.pojo.slot;
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
@WebServlet(name = "OfficeHoursController", urlPatterns = {"/OfficeHoursController"})
public class OfficeHoursController extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            HttpSession session = request.getSession(true); 
            String memberid = (String) session.getAttribute("memId");
             
            if(request.getParameter("delete") != null){
              
               officehoursDaoImpl officehoursDaoImpl = new officehoursDaoImpl();
               List<officehourss> officehours = officehoursDaoImpl.getOfficeHourByID(request.getParameter("data"),memberid);
               
               if(officehours.size() == 1){
                   String officeid = String.valueOf(officehours.get(0).getId());
                   slotDaoImpl slotDaoImpl = new slotDaoImpl ();
                   List<slot> slots = slotDaoImpl.showAllSlotsOfOfficeHours(officeid);
                   int c=0;
                   slot slot2 = new slot();
                   for(slot slot : slots){
                       slot2=slot;
                       if(slot.getReserved().equals("1")){
                           c=1;
                           break;
                          //RequestDispatcher rd = request.getRequestDispatcher("mange_office.jsp");
                         // rd.forward(request, response);    
                          
                       }
                   }
                   if(c==0){
                   for(slot slot : slots){
                       slotDaoImpl.deleteslot(slot);
                   }
                  officehoursDaoImpl.deleteOfficeHour(officehours.get(0));
                  out.println("<script>");
                 out.println("alert('delete successfully!');");
                 out.println("location='deleteOffice.jsp';");
                 out.println("</script>");
                  //out.print("delete successfully");
                 }
                   else if (c==1){
                       String s= "you have reserved appointment From"+slot2.getFrom()+"To"+slot2.getTo()+" please change your range or delete the appointment";
                        
                        out.println("<script>");
                 out.println("alert('"+s+"');");
                 out.println("location='deleteOffice.jsp';");
                 out.println("</script>");
                         
                // response.sendRedirect("mange_office.jsp");  
                 
               }
               }
               else{ 
                  out.println("<script>");
                 out.println("alert('There is no office hours with this id!');");
                 out.println("location='deleteOffice.jsp';");
                 out.println("</script>");  
                //out.print("error"); 
               }
                
            }
           
            
              if(request.getParameter("addd")!=null){
                        officehoursDaoImpl officehoursDaoImpl = new officehoursDaoImpl();
                        
                        slotDaoImpl slotDaoImpl = new slotDaoImpl();
                        String From = request.getParameter("from");
                        String To = request.getParameter("to");
                        String date = request.getParameter("date");
                        String location = request.getParameter("location");
                        String onoroff =request.getParameter("onoroff");
                        String[] arrOfStr = From.split(":");
                        String[] arrOfStr2 = To.split(":");
                        String s= new String();
                        String s1 = new String();
                        if(arrOfStr.length==2){ s =":"+arrOfStr[1];}
                        if(arrOfStr2.length==2){ s1 =":"+arrOfStr2[1];}
                        
                        if(arrOfStr.length==1){s=":00";  }
                        if(arrOfStr2.length==1){s1=":00";  }
                        int to = Integer.parseInt(arrOfStr2[0]);
                        int from = Integer.parseInt(arrOfStr[0]);
                        java.util.Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(date); 
                        java.util.Date date2 = new java.util.Date(); 
                        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
                      
                        if (!date1.before(date2) ) {        //|| formatter.format(date1).equals(formatter.format(date2)) lw 3yzo Y3ml hours f nfs el youm
                    if(to > from && (from<25) && (to < 25)) {
                        
                        if(s.equals(s1)){
                            
                            List<officehourss> officehourss =officehoursDaoImpl.getOfficeHourByDate(date, memberid);
                            if(officehourss.size()==0){
                                officehourss officehours = new officehourss();
                                // out.println(memberid) ;
                                //out.println(date) ;
                                //out.println(From) ;
                                //out.println(To) ;
                                //out.println(location) ;
                                //out.println(onoroff) ;
                                
                                officehours.setMemberid(memberid);
                                officehours.setDate(date);
                                officehours.setFrom(String.valueOf(from)+s);
                                officehours.setTo(String.valueOf(to)+s1);
                                officehours.setLocation(location);
                                officehours.setOnoroff(onoroff);
                                officehoursDaoImpl.saveOfficeHours(officehours);
                                officehourss= officehoursDaoImpl.getOfficeHourByDate(date, memberid);
                                String officehourid=String.valueOf(officehourss.get(0).getId());
                                slot slot = new slot();
                                for(int i = from ; i<to;i++){
                                    
                                    slot.setFrom(String.valueOf(i)+s);
                                    slot.setTo(String.valueOf(i+1)+s1);
                                    slot.setOfficehoursid(officehourid);
                                    slot.setReserved("0");
                                    slotDaoImpl.saveSlot(slot);
                                    
                                }
                  out.println("<script>");
                 out.println("alert('Office hours added successfully');");
                 out.println("location='addOffice.jsp';");
                 out.println("</script>");
                               // out.print("Office hours added successfully");
                                
                            }
                            else{
                                 out.println("<script>");
                 out.println("alert('You have office hours in this day!');");
                 out.println("location='addOffice.jsp';");
                 out.println("</script>");
                                
                               // out.print("You have office hours in this day!");
                            }
                            
                        }
                        
                        else{
                                             out.println("<script>");
                 out.println("alert('please notice that slot is one hour!');");
                 out.println("location='addOffice.jsp';");
                 out.println("</script>");
                            
                            //out.print("please notice that slot is one hour!");
                            
                        }
                        
                    }
                    
                    else{
                  out.println("<script>");
                 out.println("alert('You are in another day!');");
                 out.println("location='addOffice.jsp';");
                 out.println("</script>");
                        
                        //out.print("You are in another day!");
                        
                    }
                }
                else{  
                  out.println("<script>");
                 out.println("alert('This date was passed!');");
                 out.println("location='addOffice.jsp';");
                 out.println("</script>");
                    
                   // out.print("This date was passed");
                }
             
                       }
            
            
            
            
            if(request.getParameter("Update") != null){
                
                officehoursDaoImpl officehoursDaoImpl = new officehoursDaoImpl();
                        
                        slotDaoImpl slotDaoImpl = new slotDaoImpl();
                        String From = request.getParameter("from");
                        String To = request.getParameter("to");
                        String date = request.getParameter("date");
                        String location = request.getParameter("location");
                        String onoroff =request.getParameter("onoroff");
                        List<slot> toadd = new ArrayList();
                        List<slot> todelete = new ArrayList();
                        List<slot> old = new ArrayList();
                        List<slot> neww = new ArrayList();
                        String[] arrOfStr = From.split(":");
                        String[] arrOfStr2 = To.split(":");
                        String s= new String();
                        String s1 = new String();
                        if(arrOfStr.length==2){ s =":"+arrOfStr[1];}
                        if(arrOfStr2.length==2){ s1 =":"+arrOfStr2[1];}
                        
                        if(arrOfStr.length==1){s=":00";  }
                        if(arrOfStr2.length==1){s1=":00";  }
                        int to = Integer.parseInt(arrOfStr2[0]);
                        int from = Integer.parseInt(arrOfStr[0]);
                        java.util.Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(date); 
                       java.util.Date date2 = new java.util.Date(); 
                        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 
                      
                        if (!date1.before(date2) || formatter.format(date1).equals(formatter.format(date2))) {        
                    if(to > from && (from<25) && (to < 25)) {
                        
                        if(s.equals(s1)){
                            
                            List<officehourss> officehourss =officehoursDaoImpl.getOfficeHourByDate(date, memberid);
                            if(officehourss.size()!=0){
                                
                                if(!officehourss.get(0).getLocation().equals(location) || !officehourss.get(0).getOnoroff().equals(onoroff) ){
                                
                                 officehourss officehours = new officehourss();
                                
                                officehours.setId(officehourss.get(0).getId());
                                officehours.setMemberid(memberid);
                                officehours.setDate(date);
                                officehours.setFrom(From);
                                officehours.setTo(To);
                                officehours.setLocation(location);
                                officehours.setOnoroff(onoroff);
                                officehoursDaoImpl.updateOfficeHours(officehours);
                                out.println("<script>");
                                
                                 out.println("alert('Update sccessfully!');");
                                out.println("location='updateOffice.jsp';");
                                out.println("</script>"); 
                                
                                }
                                
                                else{
                                
                                String officehourid=String.valueOf(officehourss.get(0).getId());
                                old=slotDaoImpl.showAllSlotsOfOfficeHours(officehourid);
                                
                                
                                for(int i = from ; i<to;i++){
                                    slot slot = new slot();
                                    slot.setFrom(String.valueOf(i)+s);
                                    slot.setTo(String.valueOf(i+1)+s1);
                                    slot.setOfficehoursid(officehourid);
                                    slot.setReserved("0");
                                    neww.add(slot);
                                    
                                }
                                
                                
                               
                                
                                int i=0;
                                int j=0;
                                while(true){
                                    if(j==neww.size() && i==old.size()){break;}

                                    if(i==old.size() && j< neww.size()){
                                       toadd.add(neww.get(j));
                                       j++;
                                    }
                                    else if(j==neww.size() && i<old.size()){

                                    todelete.add(old.get(i));
                                    i++;
                                    }

                                    else{

                                        if(old.get(i).getFrom().equals(neww.get(j).getFrom()) && old.get(i).getTo().equals(neww.get(j).getTo()) ){

                                        i++; j++;
                                        
                                        }

                                        else if (old.get(i).getFrom().equals(neww.get(j).getTo())){

                                            toadd.add(neww.get(j));
                                            j++;
                                        }
                                        else{

                                        todelete.add(old.get(i));
                                        i++;
                                        }




                                    }



                                } 
                                
                                  int c=0; 
                                  slot slot2= new slot();
                                for(int k=0;k<todelete.size();k++){
                                       slot2= todelete.get(k);
                                       //out.println(slot2.getFrom());
                                      // out.println(slot2.getTo());
                                    if(todelete.get(k).getReserved().equals("1")){
                                        c=1;
                                        break;
                              
                                    }
                                
                                
                                }
                                
                               if(c==0){ 
                                for(int z = 0 ; z<todelete.size();z++){
                                    slotDaoImpl.deleteslot(todelete.get(z));
                                    
                                }
                                
                                for(int x = 0 ; x<toadd.size();x++){
                                     
                                    slotDaoImpl.saveSlot(toadd.get(x));
                                    
                                }
                            
                                officehourss officehours = new officehourss();
                                officehours.setId(officehourss.get(0).getId());
                                officehours.setMemberid(memberid);
                                officehours.setDate(date);
                                officehours.setFrom(String.valueOf(from)+s);
                                officehours.setTo(String.valueOf(to)+s1);
                                officehours.setLocation(location);
                                officehours.setOnoroff(onoroff);
                                officehoursDaoImpl.updateOfficeHours(officehours);
                                 out.println("<script>");
                                
                                 out.println("alert('Update sccessfully!');");
                                out.println("location='updateOffice.jsp';");
                                out.println("</script>"); 
                                
                               // out.print("Updated sccessfully");
                                
                               }
                               else if (c==1){
                                String ss="you have reserved appointment From "+slot2.getFrom()+" To"+slot2.getTo()+" please change your range or delete the appointment";
                                
                            out.println("<script>");
                 out.println("alert('"+ss+"');");
                 out.println("location='updateOffice.jsp';");
                 out.println("</script>");     
                                     
                                    // RequestDispatcher rd = request.getRequestDispatcher("mange_office.jsp");
                                   //rd.forward(request, response);    

                               
                               } 
                            } 
                                
                            }
                            else{
                    out.println("<script>");
                 out.println("alert('Error to get office hour!');");
                 out.println("location='updateOffice.jsp';");
                 out.println("</script>");  
               
                                
                                //out.print("Error to get office hour!");
                            }
                            
                        }
                        
                        else{
                    out.println("<script>");
                 out.println("alert('please notice that slot is one hour!');");
                 out.println("location='updateOffice.jsp';");
                 out.println("</script>"); 
                            
                           // out.print("please notice that slot is one hour!");
                            
                        }
                        
                    }
                    
                    else{
                        
                           out.println("<script>");
                 out.println("alert('You are in another day!');");
                 out.println("location='updateOffice.jsp';");
                 out.println("</script>"); 
                        //out.print("You are in another day!");
                        
                    }
                }
                else{        
                    
                                     out.println("<script>");
                 out.println("alert('This date was passed!');");
                 out.println("location='updateOffice.jsp';");
                 out.println("</script>"); 
                            
                   // out.print("This date was passed");
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
        } catch (ParseException ex) {
            Logger.getLogger(OfficeHoursController.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            Logger.getLogger(OfficeHoursController.class.getName()).log(Level.SEVERE, null, ex);
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
