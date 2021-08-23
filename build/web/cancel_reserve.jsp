<%-- 
    Document   : cancel_reserve
    Created on : Jan 12, 2021, 3:23:24 PM
    Author     : Dell
--%>

<%@page import="javainfinite.pojo.notificationn"%>
<%@page import="javainfinite.DAOImpl.notificationDaoImpl"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="javainfinite.DAOImpl.appointmentDaoImpl"%>
<%@page import="javainfinite.pojo.appointment"%>
<%@page import="javainfinite.pojo.slot"%>
<%@page import="javainfinite.DAOImpl.slotDaoImpl"%>
<%@page import="javainfinite.DAOImpl.officehoursDaoImpl"%>
<%@page import="javainfinite.pojo.officehourss"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="view_reserve/mmystyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel Appointments In Date</title>

        <script>
            function validate(form) {
                if (form.date.value === "") {
                    alert("Please provide date!");
                    return false;
                }
                if (!isValidDate(form.date.value)) {
                    alert("Please provide date right in format yyyy-MM-dd!");
                    return false;

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

                    <div class="signup-form">
                        <h2 class="form-title">Cancel reservations </h2>
                        <form onsubmit="return validate(this);" action="cancelreserve" class="register-form" id="login-form">

                            <div class="row">
                                <div class="col-md-8"> 
                                    <div class="form-group2">
                                        <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                        <input type="textbox" name="date" id="your_name" placeholder="Date"/>
                                    </div> </div>
                                <div class="col-md-4">  <div class="form-group form-button">
                                        <input type="submit" name="cancel" id="signin" class="form-submit" value="cancel"/>
                                    </div></div>
                            </div>


                        </form>

                    </div>





                </div>



            </div>


        </section>



    </body> 
</html>
