<%-- 
    Document   : reserve_specific_hours
    Created on : Jan 7, 2021, 9:51:09 AM
    Author     : Dell
--%>

<%@page import="javainfinite.pojo.notificationn"%>
<%@page import="javainfinite.DAOImpl.notificationDaoImpl"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="javainfinite.DAOImpl.appointmentDaoImpl"%>
<%@page import="javainfinite.DAOImpl.slotDaoImpl"%>
<%@page import="javainfinite.pojo.appointment"%>
<%@page import="javainfinite.pojo.slot"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="reserve_specific_hours/styleemy.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Search about appointment on specific slot</title>
        <script>
            function validate(form) {

                if (form.from.value === "") {
                    alert("Please write slot from!");
                    return false;
                }

                if (form.to.value === "") {
                    alert("Please write slot to!");
                    return false;
                }
                
                if(!isValidTime(form.from.value)){
                    alert("Please provide time right in format HH:MM!");
                        return false;
 
                    
                }
                 if(!isValidTime(form.to.value)){
                    alert("Please provide time right in format HH:MM!");
                        return false;
 
                    
                }

                return true;

            }
             function isValidTime(time){
                   if (!/^\d{1,2}\:\d{2}$/.test(time))
                    return false;
                
                return true;
            }


        </script>


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
                <div class="signup-content">

                    <div class="signup-form">
                        <h2 class="form-title">View reservation in slot</h2>
                        <form onsubmit="return validate(this);" action="reserve_specific_hours.jsp" class="register-form" id="login-form">

                            <div class="row">

                                <div class="form-group2">
                                    <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="from" id="your_name" placeholder="From"/>
                                </div> 
                                <div class="form-group2">
                                    <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="to" id="your_name" placeholder="To"/>
                                </div> 
                                <div class="form-group form-button">
                                    <input type="submit" name="search" id="signin" class="form-submit" value="Search"/>
                                </div>
                            </div>



                        </form>

                    </div>





                </div>
                <% if (request.getParameter("search") != null && !request.getParameter("from").isEmpty() && !request.getParameter("to").isEmpty()) {

                        slotDaoImpl slotDaoImpl = new slotDaoImpl();
                        appointmentDaoImpl appointmentDaoImpl = new appointmentDaoImpl();
                        List<slot> slots = slotDaoImpl.showSlotInScepificTime(request.getParameter("from"), request.getParameter("to"));

                        if (slots != null) {

                %>

                <ul class="list-group list-group-horizontal" style="margin-left: 140px;">
                    <li class="list-group-item" style="width: 200px;"><h3>Meeting ID</h3></li>
                    <li class="list-group-item" style="width: 200px;"> <h3>Student ID</h3></li>
                    <li class="list-group-item" style="width: 200px;"> <h3>Date</h3></li>
                </ul>
                <%          for (slot slot : slots) {

                        String slotid = String.valueOf(slot.getSlotid());
                        List<appointment> appointments = appointmentDaoImpl.showAllAppointmentsOfSlotid(slotid);
                        for (appointment appointment : appointments) {
                            if (appointment.getMemberid().equals((String) session.getAttribute("memId"))) {
                %>
                <ul class="list-group list-group-horizontal" style="margin-left: 140px;">
                    <li class="list-group-item" style="width: 200px;"><h3><%out.print(appointment.getId());%></h3></li>
                    <li class="list-group-item" style="width: 200px;"> <h3><%out.println(appointment.getStudentid());%></h3></li>
                    <li class="list-group-item" style="width: 200px;"> <h3><%out.println(appointment.getDate());%></h3></li>
                </ul>
                <br><br>        



                <%
                            }

                        }
                    }

                } else {
                %>

                <h5 style="color:red ; text-align: center ">There is no  reservations in this slot</h5> <br>            

                <% }

                    }%> 
                <br><br>
            </div>

        </div>
    </section>



</html>
