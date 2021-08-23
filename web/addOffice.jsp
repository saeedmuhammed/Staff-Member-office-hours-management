<%-- 
    Document   : addOffice
    Created on : Jan 14, 2021, 7:36:00 AM
    Author     : Saeed
--%>

<%@page import="javainfinite.pojo.notificationn"%>
<%@page import="java.util.List"%>
<%@page import="javainfinite.DAOImpl.notificationDaoImpl"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="staffsubject/mystyle.css">

        <title>Add Office Hours</title>
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
                if (form.from.value === "") {
                    alert("Please provide from!");
                    return false;
                }
                if (form.to.value === "") {
                    alert("Please provide to!");
                    return false;
                }
                if (form.location.value === "") {
                    alert("Please provide location!");
                    return false;
                }
                if (form.onoroff.value === "") {
                    alert("Please provide online or offline!");
                    return false;
                }
              var type=form.onoroff.value.toLowerCase();
         if ( type !== "offline" && type !== "online") {
                    alert("Please provide online or offline!");
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
                        <h2 class="form-title" style="margin-left: 60px;">Add office hours</h2>
                        <form onsubmit="return validate(this);" action="OfficeHoursController" class="register-form" id="login-form">

                            <div class="form-group2">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="date" id="your_name" placeholder="Date"/>
                            </div> 
                            <div class="form-group2">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="from" id="your_name" placeholder="From"/>
                            </div> 
                            <div class="form-group2">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="to" id="your_name" placeholder="To"/>
                            </div> 

                            <div class="form-group2">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="location" id="your_name" placeholder="Location"/>
                            </div> 

                            <div class="form-group2">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="onoroff" id="your_name" placeholder="Oneline or Offline"/>
                            </div> 




                            <div class="form-group form-button" style="margin-left: 150px;margin-top: 20px;">
                                <input type="submit" name="addd" id="signin" class="form-submit" value="Add" />
                            </div>




                        </form>

                    </div>





                </div>

            </div>


        </section>












    </body>
</html>
