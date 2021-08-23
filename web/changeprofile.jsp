<%-- 
    Document   : changeprofile
    Created on : Dec 31, 2020, 6:41:16 AM
    Author     : Dell
--%>

<%@page import="javainfinite.pojo.notificationn"%>
<%@page import="java.util.List"%>
<%@page import="javainfinite.DAOImpl.notificationDaoImpl"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="changeprofile/mystyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Your Profile Information</title>
        <script>
            function validate() {
          var password = document.getElementById("password").value;
        
         var name = document.getElementById("name").value;
         var email = document.getElementById("email").value;
         var year = document.getElementById("year").value;
         var changeprofile = document.getElementById("changeprofile").value;
         
          atpos = email.indexOf("@");
         dotpos = email.lastIndexOf(".");
         
         if (password === "") {
            alert( "Please provide your username!" );
            document.getElementById("id").focus() ;
            return false;
        }
      
         if(name == "" ) {
            alert( "Please provide your name!" );
            document.getElementById("name").focus() ;
            return false;
         }
      
         if (atpos < 1 || ( dotpos - atpos < 2 ) || email== "" ){
            alert("Please enter your email ")
            document.getElementById("email").focus() ;
            return false;
         }
         
        
         if( year == "" || year > 4 || year < 1 ){
            alert( "Year Must be 1 or 2 or 3 or 4!" );
            document.getElementById("year").focus() ;
            return false;
         }
       
          var xmlhttp = new XMLHttpRequest();
            
            xmlhttp.open("GET","studentController?password="+password+"&changeprofile="+changeprofile+"&email="+email+"&name="+name+"&year="+year,true);
            xmlhttp.send();
            
            xmlhttp.onreadystatechange=function()
            {
                if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    //
              if(xmlhttp.responseText!=="done"){
                 // alert(xmlhttp.responseText);
            document.getElementById("servermsg").innerHTML=xmlhttp.responseText
        }
           else{
              //alert("Updated Sccessfully");
               document.getElementById("servermsg").innerHTML="Updated Sccessfully"
            //window.location.href="studentlogin.jsp";
        }
           return false;
                 }
            }
         return true;
     
      }

        </script>
    </head>
    <body>


        <br><br><br>
        <section class="signup">
            <div class="container">
                <!-- Start Nav -->
                <ul class="nav justify-content-center">

                    <li class="nav-item" style="margin-left: -18px; ">
                        <a class="nav-link"   href="studentNotify.jsp"><img src="notify.png" style="width: 35px;margin-bottom: 12px; " alt="notify" ></a>



                        <%

                            java.util.Date currentdate = new java.util.Date();
                            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                            int c = 0;
                            //java.util.Date currentdate = new java.util.Date(Calendar.getInstance().getTime().getTime());
                            notificationDaoImpl notificationDaoImpl = new notificationDaoImpl();
                            List<notificationn> notifications = notificationDaoImpl.showAllNotification();
                            String loginId = (String) session.getAttribute("id");
                            if (notifications.size() != 0) {
                                for (notificationn notification : notifications) {
                                    if (loginId.equals(notification.getStudentId())) {

                                        java.util.Date date = notification.getDate();
                                        if ((formatter.format(currentdate).equals(date) || date.compareTo(currentdate) < 0)) {
                                            if (!notification.getBody().contains("new")) {
                                                c++;
                                                String sent = notification.getSent();
                                                if (sent.equals("no")) {

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

          if (c != 0) {%>
                        <span class="badge" style="position: absolute;
                              top: 80px;
                              width: .1px;
                              right: 1167px;
                              padding: 3px 8px;
                              border-radius: 50%;
                              background: red;
                              text-align: center;
                              color: white;"><%=c%></span>

                        <%  }

                        %>   

                    </li>

                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="profilestudent.jsp">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="staffsubject.jsp">Object Staff</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="staffmembers.jsp">Search for staff member</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="viewofficehours.jsp">Office hours of staff member</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="cancelmeeting.jsp">Cancel meeting</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="sent_message_student.jsp">Messages</a>
                    </li>



                    <li class="nav-item">
                        <a class="nav-link" style="margin-left: 70px;" href="student_logout"><img src="logout.png" style="width: 25px;margin-top: 3px; " alt="Logout" ></a>

                    </li>




                </ul>
                <!-- End Nav --> 

 <h4 style="text-align: center ; color: red" id="servermsg" ></h4>
                <div class="signup-content">
                   
                    <div class="signup-form">
                        <h2 class="form-title">Change Your Profile</h2>
                        <form  class="register-form" id="register-form" >

                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="name" value="<% out.print((String) session.getAttribute("name"));%>"/>
                            </div>
                            <div class="form-group">
                                <label for="pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="password" id="password" value="<% out.print((String) session.getAttribute("password"));%>"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" value = "<% out.print((String) session.getAttribute("email"));%>"/>
                            </div>

                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"> </i></label>
                                <input type="text" name="year" id="year" value = "<% out.print((String) session.getAttribute("year"));%>"/>
                            </div>


                            <div class="form-group form-button">
                                <input type="button"  name="changeprofile" id="changeprofile" class="form-submit" onclick="validate();" value="Change profile"/>
                            </div>
                        </form>
                    </div>
                </div>



            </div>
        </section> 


        <%--
        <form action="studentController" >
            <table>
                
                <tr>
                    <td> Name: </td>
                    <td><input type="text" name="name" value="<% out.print((String)session.getAttribute("name"));%>"   ></td>
                </tr>
                 <tr>
                    <td> Password: </td>
                    <td><input type="text" name="password"></td>
                </tr>
                <tr>
                    <td> Year: </td>
                    <td><input type="text" name="year" value = "<% out.print((String)session.getAttribute("year"));%>"></td>
                </tr>
                <tr>
                    <td> Email: </td>
                    <td><input type="email" name="email" value = "<% out.print((String)session.getAttribute("email"));%>"></td>
                </tr>
   
                <tr>
                    <td><input type="submit" name="changeprofile" value="change profile"></td>
                 
                </tr>
            </table>
        </form> --%>
    </body>
</html>
