<%-- 
    Document   : view_reservre
    Created on : Jan 7, 2021, 10:34:35 AM
    Author     : Dell
--%>

<%@page import="javainfinite.pojo.notificationn"%>
<%@page import="javainfinite.DAOImpl.notificationDaoImpl"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javainfinite.pojo.appointment"%>
<%@page import="java.util.List"%>
<%@page import="javainfinite.DAOImpl.appointmentDaoImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="view_reserve/mmystyle.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View history of reservations</title>

        <script>
            function validate(form) {
                if (form.data.value === "" && form.ma.value !== "all" ) {
                    alert("Please provide data!");
                    return false;
                }

  if (form.ma.value === "date") {
                    if (!isValidDate(form.data.value)) {
                        alert("Please provide date right in format yyyy-MM-dd!");
                        return false;

                    }


                }

                return true;

            }
  function isValidDate(dateString)
            {
                // First check for the pattern
                if (!/^\d{4}\-\d{2}\-\d{2}$/.test(dateString))
                    return false;

                // Parse the date parts to integers
                var parts = dateString.split("-");
                var day = parseInt(parts[2], 10);
                var month = parseInt(parts[1], 10);
                var year = parseInt(parts[0], 10);

                // Check the ranges of month and year
                if (year < 1000 || year > 3000 || month == 0 || month > 12)
                    return false;

                var monthLength = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

                // Adjust for leap years
                if (year % 400 == 0 || (year % 100 != 0 && year % 4 == 0))
                    monthLength[1] = 29;

                // Check the range of the day
                return day > 0 && day <= monthLength[month - 1];
            }
            ;

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
                        <h2 class="form-title">History of reservations</h2>
                        <form onsubmit="return validate(this);" action="view_reservre.jsp" class="register-form" id="login-form">

                            <h5>Search By</h5>
                            <select class="select2 form-control" style="width: 260px;" name="ma">
                                <option value="all">All</option>
                                <option value="studentid">Student ID</option>
                                <option value="slotid">Slot ID</option>
                                <option value="start">Start</option>
                                <option value="endd">End</option>
                                <option value="date">Date</option>

                            </select>           


                            <div class="row">
                                <div class="col-md-8"> 
                                    <div class="form-group2">
                                        <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                        <input type="textbox" name="data" id="your_name" placeholder=""/>
                                    </div> </div>
                                <div class="col-md-4">  <div class="form-group form-button">
                                        <input type="submit" name="view" id="signin" class="form-submit" value="Search"/>
                                    </div></div>
                            </div>



                        </form>

                    </div>





                </div>
                <% if (request.getParameter("view") != null ) {

                        String col = request.getParameter("ma");
                        String data = request.getParameter("data");
                        String iduser = (String) session.getAttribute("memId");
                        java.util.Date currentDate = new java.util.Date();
                        
                        appointmentDaoImpl appointmentDaoImpl = new appointmentDaoImpl();
                        List<appointment> appointments = new ArrayList();
                        if (col.equals("all")) {
                            appointments = appointmentDaoImpl.showAllAppointmentsOfMember(iduser);
                        } else {
                          
                            appointments = appointmentDaoImpl.showAllAppointments(col, data, iduser);
                        }
                        if (appointments.size() != 0) {

                %>

                <ul class="list-group list-group-horizontal" style="margin-left: 60px;">
                    <li class="list-group-item" style="width: 150px;"><h4>Meeting ID</h4></li>
                    <li class="list-group-item" style="width: 150px;"> <h4>Student ID</h4></li>
                    <li class="list-group-item" style="width: 150px;"> <h4>Date</h4></li>
                    <li class="list-group-item" style="width: 150px;"> <h4>From</h4></li>
                    <li class="list-group-item" style="width: 150px;"> <h4>To</h4></li>
                </ul>
                <%          for (appointment appointment : appointments) {
                        if (appointment.getDate().before(currentDate) && (!appointment.getDate().toString().equals(formatter.format(currentDate))) ) {
                %>
                <ul class="list-group list-group-horizontal" style="margin-left: 60px;">
                    <li class="list-group-item" style="width: 150px;"><h4><%out.print(appointment.getId());%></h4></li>
                    <li class="list-group-item" style="width: 150px;"> <h4><%out.println(appointment.getStudentid());%></h4></li>
                    <li class="list-group-item" style="width: 150px;"> <h4><%out.println(appointment.getDate());%></h4></li>
                    <li class="list-group-item" style="width: 150px;"> <h4><%out.println(appointment.getStart());%></h4></li>
                    <li class="list-group-item" style="width: 150px;"> <h4><%out.println(appointment.getEnd());%></h4></li>
                </ul>
                <br><br>        


                <%
                        }
                    }

                } else {
                %>

                <h5 style="color:red ; text-align: center ">There is no reservations</h5> <br>            

                <%}
    }%> 

            </div>

        </div>
    </section>



</body>

</html>
