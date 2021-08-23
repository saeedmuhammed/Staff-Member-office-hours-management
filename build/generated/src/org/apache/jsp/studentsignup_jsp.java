package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class studentsignup_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write(" \n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("         <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1\" crossorigin=\"anonymous\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"style.css\">\n");
      out.write("     <link rel=\"stylesheet\" href=\"studentsignup/mystyle.css\">\n");
      out.write("     \n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("         <title>Signup</title>\n");
      out.write("        \n");
      out.write("  <script>\n");
      out.write("   function validate(form) {\n");
      out.write("         if (form.id.value === \"\") {\n");
      out.write("            alert( \"Please provide your username!\" );\n");
      out.write("            //document.myForm2.id.focus() ;\n");
      out.write("            return false;\n");
      out.write("        }\n");
      out.write("   \n");
      out.write("         if(form.name.value == \"\" ) {\n");
      out.write("            alert( \"Please provide your name!\" );\n");
      out.write("            //document.myForm.name.focus() ;\n");
      out.write("            return false;\n");
      out.write("         }\n");
      out.write("         var emailID = form.email.value;\n");
      out.write("         atpos = emailID.indexOf(\"@\");\n");
      out.write("         dotpos = emailID.lastIndexOf(\".\");\n");
      out.write("         \n");
      out.write("         if (atpos < 1 || ( dotpos - atpos < 2 ) || emailID= \" \" ){\n");
      out.write("            alert(\"Please enter correct email \")\n");
      out.write("            //document.myForm.email.focus() ;\n");
      out.write("            return false;\n");
      out.write("         }\n");
      out.write("          if( form.password.value == \"\" ) {\n");
      out.write("            alert( \"Please provide your password!\" );\n");
      out.write("            //document.myForm.password.focus() ;\n");
      out.write("            return false;\n");
      out.write("         }\n");
      out.write("        \n");
      out.write("         if( form.year.value ==\" \" ||form.year.value != \"1\" || form.year.value != \"2\" ||form.year.value != \"3\"||form.year.value != \"4\"  ) {\n");
      out.write("            alert( \"Please provide your year right!\" );\n");
      out.write("            //document.myForm.year.focus() ;\n");
      out.write("            return false;\n");
      out.write("         }\n");
      out.write("         return true;\n");
      out.write("     \n");
      out.write("      }\n");
      out.write("        \n");
      out.write("     \n");
      out.write("    </script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("    \n");
      out.write("        <!--<script src=\"https://www.google.com/recaptcha/api.js\" async defer></script> -->\n");
      out.write("<br><br><br>\n");
      out.write("    ");
      out.write("\n");
      out.write("    \n");
      out.write("    <form name=\"myForm2\" onsubmit= \"return saeed(this);\" class=\"register-form\" id=\"register-form\" >\n");
      out.write("        <input type=\"text\" name=\"idd\"  placeholder=\"User Name\"/>\n");
      out.write("         <input type=\"submit\" name=\"addstudent\" id=\"signup\" class=\"form-submit\" value=\"Register\"/>\n");
      out.write("    </form>\n");
      out.write("    \n");
      out.write("    <section class=\"signup\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"signup-content\">\n");
      out.write("                    <div class=\"signup-form\">\n");
      out.write("                        <h2 class=\"form-title\">Sign up</h2>\n");
      out.write("                        <form name=\"myForm\" class=\"register-form\" id=\"register-form\" action=\"studentController\" onsubmit=\"return validate(this);\">\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label for=\"name\"><i class=\"zmdi zmdi-account material-icons-name\"></i></label>\n");
      out.write("                                <input type=\"text\" name=\"id\"  placeholder=\"User Name\"/>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label for=\"name\"><i class=\"zmdi zmdi-account material-icons-name\"></i></label>\n");
      out.write("                                <input type=\"text\" name=\"name\" id=\"name\" placeholder=\"Name\"/>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label for=\"email\"><i class=\"zmdi zmdi-email\"></i></label>\n");
      out.write("                                <input type=\"email\" name=\"email\" id=\"email\" placeholder=\"Email\"/>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label for=\"pass\"><i class=\"zmdi zmdi-lock\"></i></label>\n");
      out.write("                                <input type=\"password\" name=\"password\" id=\"pass\" placeholder=\"Password\"/>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-group\">\n");
      out.write("                                <label for=\"re-pass\"><i class=\"zmdi zmdi-lock-outline\"></i></label>\n");
      out.write("                                <input type=\"text\" name=\"year\" id=\"re_pass\" placeholder=\"Year\"/>\n");
      out.write("                            </div>\n");
      out.write("                              <div class=\"g-recaptcha\" data-sitekey=\"6Le4pxQaAAAAAJzO9BVkaN7zIfBh3iVZ13QKIVf_\"></div>\n");
      out.write("\n");
      out.write("                            <div class=\"form-group form-button\">\n");
      out.write("                                <input type=\"submit\" name=\"addstudent\" id=\"signup\" class=\"form-submit\" value=\"Register\"/>\n");
      out.write("                            </div>\n");
      out.write("                        </form>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"signup-image\">\n");
      out.write("                        <figure><img src=\"images/signup-image.jpg\" alt=\"sing up image\"></figure>\n");
      out.write("                        <a href=\"studentlogin.jsp\" class=\"signup-image-link\">I am already member</a>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </section> \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("    \n");
      out.write("\n");
      out.write("    \n");
      out.write("    \n");
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
