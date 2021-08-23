<%-- 
    Document   : mange_office
    Created on : Jan 13, 2021, 4:08:24 PM
    Author     : Dell
--%>

<%@page import="javainfinite.pojo.notificationn"%>
<%@page import="javainfinite.DAOImpl.notificationDaoImpl"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javainfinite.pojo.slot"%>
<%@page import="javainfinite.DAOImpl.slotDaoImpl"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="javainfinite.DAOImpl.officehoursDaoImpl"%>
<%@page import="javainfinite.pojo.officehourss"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="style.css">

        <title>Mange Office Hours</title>
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
                              right: 818px;
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
                <div class="signup-content">
                    <div class="container" style="margin-left: 70px;">
                    <div class="row">
                        <div class="col-md-3" style="margin-bottom: 40px;"><div class="card" style="width: 18rem;">
                        <a href="addOffice.jsp"> <img src="add.png" class="card-img-top" alt="..."> </a>
                               
                    </div></div>
                        <div class="col-md-3"></div>
                        <div class="col-md-3"><div class="card" style="width: 18rem;">
                        <a href="updateOffice.jsp"> <img src="update.png" class="card-img-top" alt="..."> </a>

                            </div></div> 
                        <div class="col-md-3">   </div>
                        
                     </div>  
                          <div class="row">
                        <div class="col-md-3"><div class="card" style="width: 18rem;">
                        <a href="viewOffice.jsp"> <img src="view.png" class="card-img-top" alt="..."> </a></div></div>
                        <div class="col-md-3">
                     </div>
                        <div class="col-md-3"><div class="card" style="width: 18rem;">
                        <a href="deleteOffice.jsp"> <img src="delete.png" class="card-img-top" alt="..."> </a>

                    </div></div>
                        <div class="col-md-3"></div>
                        
                     </div>   
                   
                    
                    
                    
                 

                    </div>
                    
                </div>
            </div>
        </section>




    </body>
</html>
