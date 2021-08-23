package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javainfinite.pojo.notificationn;
import java.util.List;
import javainfinite.DAOImpl.notificationDaoImpl;
import java.text.SimpleDateFormat;

public final class profilestudent_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("             <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1\" crossorigin=\"anonymous\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"style.css\">\n");
      out.write("     <link rel=\"stylesheet\" href=\"profilestudent/mystyle.css\">\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Profile Page</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <br><br><br>\n");
      out.write("        <section class=\"signup\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <ul class=\"nav justify-content-center\">\n");
      out.write("                    <li class=\"nav-item\">\n");
      out.write("    <a class=\"nav-link active\" aria-current=\"page\" href=\"profilestudent.jsp\">Profile</a>\n");
      out.write("  </li>\n");
      out.write("    <li class=\"nav-item\">\n");
      out.write("      <a class=\"nav-link active\" aria-current=\"page\" href=\"staffsubject.jsp\">Object Staff</a>\n");
      out.write("    </li>\n");
      out.write("    <li class=\"nav-item\">\n");
      out.write("      <a class=\"nav-link\" href=\"staffmembers.jsp\">Search for staff member</a>\n");
      out.write("    </li>\n");
      out.write("    <li class=\"nav-item\">\n");
      out.write("      <a class=\"nav-link\" href=\"viewofficehours.jsp\">Office hours of staff member</a>\n");
      out.write("    </li>\n");
      out.write("     <li class=\"nav-item\">\n");
      out.write("      <a class=\"nav-link\" href=\"cancelmeeting.jsp\">Cancel meeting</a>\n");
      out.write("    </li>\n");
      out.write("    <li class=\"nav-item\">\n");
      out.write("      <a class=\"nav-link\" href=\"sent_message_student.jsp\">Messages</a>\n");
      out.write("    </li>\n");
      out.write("     <li class=\"nav-item\">\n");
      out.write("         <a class=\"nav-link\" style=\"margin-left: 70px;\" href=\"student_logout\"><img src=\"logout.png\" style=\"width: 25px;margin-top: 3px; \" alt=\"Logout\" ></a>\n");
      out.write("      \n");
      out.write("    </li>\n");
      out.write("    \n");
      out.write("      ");

       
        java.util.Date currentdate = new java.util.Date(); 
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");       
       //java.util.Date currentdate = new java.util.Date(Calendar.getInstance().getTime().getTime());
       notificationDaoImpl  notificationDaoImpl = new  notificationDaoImpl();
       List<notificationn> notifications = notificationDaoImpl.showAllNotification();
       String loginId=(String)session.getAttribute("id");
       if(notifications.size()!=0){
       for( notificationn  notification : notifications){
          if(loginId.equals(notification.getStudentId())){
           
          java.util.Date date =  notification.getDate();
           if((formatter.format(currentdate).equals(date) || date.compareTo(currentdate) < 0 )){
              if(!notification.getBody().contains("new")){ 
               out.print(notification.getBody());  
               String sent =  notification.getSent();
               if(sent.equals("no")){
            
                 //sendMailBean mailSender = new sendMailBean("se.seifzzzz@gmail.com",notification.getTo(),"Meeting Day",notification.getBody());
                // mailSender = new sendMailBean("se.seifzzzz@gmail.com",notification.getToMember(),"Meeting Day","You Have meeting day with"+notification.getBody());
                 //notification.setSent("yes");
                 //notificationDaoImpl.updatenotification(notification);
             }
              }
          }
       
          }
       }
       }
       
       else{
       
       out.print("you have no notifications");
       }  
    
      out.write("   \n");
      out.write("    \n");
      out.write("  \n");
      out.write("</ul>\n");
      out.write("                 <h1>Your profile Page</h1><br>\n");
      out.write("          \n");
      out.write("               \n");
      out.write("                  \n");
      out.write("                    ");

        String name = (String)session.getAttribute("name");
        String year = (String)session.getAttribute("year");
        String email = (String)session.getAttribute("email");
      out.write("\n");
      out.write("         \n");
      out.write("        <div class=\"row\">\n");
      out.write("  <div class=\"col-md-3\"> <img src=\"download (1).png\" class=\"logo\" alt=\"Logo\"></div>\n");
      out.write("  <div class=\"col-md-9\"> <br><br><h4> ");
out.println(name);
      out.write(" </h4><br>\n");
      out.write("                            <h4> ");
out.print(email); 
      out.write("</h4><br>\n");
      out.write("                            <h4> ");
out.print(" Year "+year);
      out.write(" </h4>\n");
      out.write("  </div>\n");
      out.write("</div>\n");
      out.write("       \n");
      out.write("        \n");
      out.write("       ");
      out.write("        \n");
      out.write("                \n");
      out.write("         \n");
      out.write("       \n");
      out.write("       <br>\n");
      out.write("\n");
      out.write("       <form action = \"changeprofile.jsp\">\n");
      out.write("           <div class=\"form-group form-button\">\n");
      out.write("                                <input type=\"submit\" name=\"changeprofile\" id=\"signin\" class=\"form-submit\" value=\"Update Your Data\"/>\n");
      out.write("                            </div>\n");
      out.write("            ");
      out.write("\n");
      out.write("         </form> \n");
      out.write("         <br><br>\n");
      out.write("       \n");
      out.write("               \n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("        \n");
      out.write("        ");
/*
        String name = (String)session.getAttribute("name");
        String year = (String)session.getAttribute("year");
        String email = (String)session.getAttribute("email");
        out.print("Your Name : "+name);*/
        
      out.write("\n");
      out.write("        <br>\n");
      out.write("        ");

        //out.print("Your Email : "+email);
        
      out.write("\n");
      out.write("        <br>\n");
      out.write("        ");

         //out.print("Your Year : "+year);
         
      out.write("\n");
      out.write("        <br>\n");
      out.write("        ");

         
      out.write("\n");
      out.write("        \n");
      out.write("        ");
      out.write("    \n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
