<%-- 
    Document   : sentmessage_staff_home
    Created on : Jan 4, 2021, 11:48:19 AM
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
        <link rel="stylesheet" href="studentlogin/mystyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Send Message Home</title>
    </head>
    <body>


        <br><br><br>
        <section class="signup">
            <div class="container">
                <!-- Start nav-->       
                <ul class="nav justify-content-center">

                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="viewMesgHome.jsp">Messages</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="sentmessage_staff_home.jsp">Send message</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="search_student.jsp">Search for student</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="reserve_specific_hours.jsp">View a specific slot</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="mange_office.jsp">Manage office hours</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="view_reservre.jsp">History of reservations</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="cancel_reserve.jsp">Cancel slots</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link"   href="memberNotify.jsp"><img src="notify.png" style="width: 35px;margin-bottom: 12px; " alt="notify" ></a>

                        <%

                            java.util.Date currentdate = new java.util.Date();
                            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                            int c = 0;
                            //java.util.Date currentdate = new java.util.Date(Calendar.getInstance().getTime().getTime());
                            notificationDaoImpl notificationDaoImpl = new notificationDaoImpl();
                            List<notificationn> notifications = notificationDaoImpl.showAllNotification();
                            String loginId = (String) session.getAttribute("memId");
                            if (notifications.size() != 0) {
                                for (notificationn notification : notifications) {

                                    if (loginId.equals(notification.getMemberid())) {
                                        java.util.Date date = notification.getDate();
                                        if ((formatter.format(currentdate).equals(date) || date.compareTo(currentdate) < 0)) {
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

         if (c != 0) {%>
                        <span class="badge" style="position: absolute;
                              top: 118px;
                              width: .1px;
                              right: 810px;
                              padding: 3px 8px;
                              border-radius: 50%;
                              background: red;
                              text-align: center;
                              color: white;"><%=c%></span>

                        <%  }

                        %>   

                    </li> 
                    <li class="nav-item">
                        <a class="nav-link" style="margin-left: 70px;" href="student_logout"><img src="logout.png" style="width: 25px;margin-top: 3px; " alt="Logout" ></a>

                    </li>

                </ul>  
                <!-- End nav-->

                <br><br><br>
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <div class="col">
                        <div class="card h-100">
                            <img src="img1.jpg" class="card-img-top" alt="...">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align:center; ">Message specific student</h5>
                                <a class="btn btn-primary" style="margin-left: 70px;" href="sentmessage_staff_student.jsp" role="button">Send Message</a>

                            </div>

                        </div>
                    </div>
                    <div class="col">
                        <div class="card h-100">
                            <img src="img2.jpg" class="card-img-top" style="height: 270px;" alt="...">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align:center; ">Message specific member</h5>
                                <a class="btn btn-primary" style="margin-left: 70px;" href="sentmessage_staff_staff.jsp" role="button">Send Message</a>
                            </div>

                        </div>
                    </div>
                    <div class="col">
                        <div class="card h-100">
                            <img src="img3.jpg" class="card-img-top"  alt="...">
                            <div class="card-body">
                                <h5 class="card-title" style="text-align:center; ">Message subject team</h5>

                                <a class="btn btn-primary" style="margin-left: 70px;" href="message_subjectteam.jsp" role="button">Send Message</a>
                            </div>

                        </div>
                    </div>
                </div>
                <br><br><br>   

            </div>
        </section>












    </body>
</html>
