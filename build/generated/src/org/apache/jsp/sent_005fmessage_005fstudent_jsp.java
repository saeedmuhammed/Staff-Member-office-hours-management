package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import javainfinite.DAOImpl.staffmemberDAOImpl;
import javainfinite.pojo.staffmember;
import javainfinite.pojo.message;
import java.util.List;
import javainfinite.DAOImpl.messageDaoImpl;

public final class sent_005fmessage_005fstudent_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1\" crossorigin=\"anonymous\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"style.css\">\n");
      out.write("     <link rel=\"stylesheet\" href=\"sendmessagestudent/mystyle.css\">\n");
      out.write(" \n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>View Message</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        \n");
      out.write("        <br>\n");
      out.write("            <br><br><br>\n");
      out.write("         <section class=\"signup\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                \n");
      out.write("    <ul class=\"nav justify-content-center\">\n");
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
      out.write("     <li class=\"nav-item\">\n");
      out.write("      <a class=\"nav-link\" href=\"sent_message_student.jsp\">Messages</a>\n");
      out.write("    </li>\n");
      out.write("     <li class=\"nav-item\">\n");
      out.write("         <a class=\"nav-link\" style=\"margin-left: 70px;\" href=\"student_logout\"><img src=\"logout.png\" style=\"width: 25px;margin-top: 3px; \" alt=\"Logout\" ></a>\n");
      out.write("      \n");
      out.write("    </li>\n");
      out.write("  \n");
      out.write("                 </ul>  <br> \n");
      out.write("                    \n");
      out.write("                  <form    class=\"register-form\" id=\"login-form\">\n");
      out.write("                       \n");
      out.write("                        <div class=\"form-group form-button\">\n");
      out.write("                            <a  href=\"student_sent_message.jsp\" id=\"send\" class=\"form-submit send\"> Send Message </a>\n");
      out.write("                            </div>\n");
      out.write("\n");
      out.write("                           \n");
      out.write("                           \n");
      out.write("                           \n");
      out.write("                        </form>\n");
      out.write("     <br>\n");
      out.write("  \n");
      out.write("        ");

        
        messageDaoImpl messageDaoImpl = new messageDaoImpl();
        List<message> messages = messageDaoImpl.showMessageToid((String)session.getAttribute("id"));
        staffmember staffmember = new staffmember();
        staffmemberDAOImpl staffmemberDaoImpl = new staffmemberDAOImpl(); 
        if(!messages.isEmpty()){
            
        for(message message : messages){
        
        staffmember=staffmemberDaoImpl.getStaffMemberByID(message.getFromid());
        
      out.write("\n");
      out.write("           \n");
      out.write("        <div class=\"alert alert-success\" style=\"background-color: whitesmoke;\" role=\"alert\">\n");
      out.write("  <h4 class=\"alert-heading\">");
out.print("From : "+ staffmember.getName());
      out.write("</h4>\n");
      out.write("  <p> ");
 out.print("Message : "+ message.getData());
      out.write("</p>\n");
      out.write("  <hr>\n");
      out.write("  </div>  \n");
      out.write("  \n");
      out.write("        \n");
      out.write("    \n");
      out.write("      \n");
      out.write("        ");

       
        }
      out.write("\n");
      out.write("<br><br>\n");
      out.write("        ");
}
       else{
      out.write("\n");
      out.write("              \n");
      out.write("       <h4 class=\"nomesg\"> There are no messages</h4> <br> <br><br>\n");
      out.write("       \n");
      out.write("          ");
}

        
        
      out.write("\n");
      out.write("        \n");
      out.write("  \n");
      out.write("        \n");
      out.write("          \n");
      out.write("               \n");
      out.write("            </div>\n");
      out.write("        </section>\n");
      out.write("        \n");
      out.write("                \n");
      out.write("        \n");
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
