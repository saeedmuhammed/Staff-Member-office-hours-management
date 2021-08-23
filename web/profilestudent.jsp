<%-- 
    Document   : profilestudent
    Created on : Dec 31, 2020, 6:31:52 AM
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
        <link rel="stylesheet" href="profilestudent/mystyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile Page</title>
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
                <h1>Your profile Page</h1><br>



                <%                        String name = (String) session.getAttribute("name");
                        String year = (String) session.getAttribute("year");
                        String email = (String) session.getAttribute("email");%>

                <div class="row">
                    <div class="col-md-3"> <img src="download (1).png" class="logo" alt="Logo"></div>
                    <div class="col-md-9"> <br><br><h4> <%out.println(name);%> </h4><br>
                        <h4> <%out.print(email); %></h4><br>
                        <h4> <%out.print(" Year " + year);%> </h4>
                    </div>
                </div>


                <%-- If You want to change you information click in this button 
                  <form action = "changeprofile.jsp">
                      <input type="submit" name="changeprofile" value="Enter">
                  </form>    
                --%>        



                <br>

                <form action = "changeprofile.jsp">
                    <div class="form-group form-button">
                        <input type="submit" name="changeprofile" id="signin" class="form-submit" value="Update Your Data"/>
                    </div>
                    <%-- <input type="submit" name="changeprofile" value="Enter">--%>
                </form> 
                <br><br>


            </div>
        </section>

        <%/*
        String name = (String)session.getAttribute("name");
        String year = (String)session.getAttribute("year");
        String email = (String)session.getAttribute("email");
        out.print("Your Name : "+name);*/
        %>
        <br>
        <%
            //out.print("Your Email : "+email);
        %>
        <br>
        <%
            //out.print("Your Year : "+year);
        %>
        <br>
        <%
        %>

        <%-- If You want to change you information click in this button 
         <form action = "changeprofile.jsp">
             <input type="submit" name="changeprofile" value="Enter">
         </form> --%>    
    </body>
</html>
