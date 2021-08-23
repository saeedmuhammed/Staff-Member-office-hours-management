<%-- 
    Document   : viewOffice
    Created on : Jan 14, 2021, 7:36:51 AM
    Author     : Saeed
--%>

<%@page import="javainfinite.pojo.notificationn"%>
<%@page import="javainfinite.DAOImpl.notificationDaoImpl"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javainfinite.pojo.officehourss"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="javainfinite.DAOImpl.officehoursDaoImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="staffsubject/mystyle.css">
        <title>View Office Hours</title>
        <script>
            function validate(form) {
                if (form.data.value === "" && form.ma.value !== "all") {
                    alert("Please provide data to search!");
                    return false;
                }
                if (form.ma.value === "date") {
                    if (!isValidDate(form.data.value)) {
                        alert("Please provide date right in format yyyy-MM-dd!");
                        return false;

                    }


                }
                if (form.ma.value === "fromm") {
                    if (!isValidTime(form.data.value)) {
                        alert("Please provide time right in format HH:MM!");
                        return false;

                    }


                }
                 if (form.ma.value === "too") {
                    if (!isValidTime(form.data.value)) {
                        alert("Please provide time right in format HH:MM!");
                        return false;

                    }


                }






                return true;

            }
            function isValidTime(time){
                   if (!/^\d{1,2}\:\d{2}$/.test(time))
                    return false;
                
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
                        <h2 class="form-title" style="margin-left: 60px;">View office hours</h2>
                        <br> <br>
                        <form onsubmit="return validate(this);"  action="viewOffice.jsp" class="register-form" id="login-form">
                            <h5> Search by</h5>  
                            <select   class="select2 form-control" style="width: 260px;" name="ma" id="op">

                                <option value="all">All</option>
                                <option value="date">Date</option>
                                <option value="fromm">From</option>
                                <option value="too">To</option>
                                <option value="location">Location</option>
                                <option value="type">On or Off</option>
                            </select>

                            <div class="form-group2">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="data" id="data" placeholder="Data"/>
                            </div> 

                            <div class="form-group form-button" style="margin-left: 150px;margin-top: 20px;">
                                <input type="submit" name="view" id="signin" class="form-submit" value="view" />
                            </div>




                        </form>

                    </div>





                </div>
















                <%   if (request.getParameter("view") != null) {
                        String memberid = (String) session.getAttribute("memId");
                        String col = request.getParameter("ma");
                        officehoursDaoImpl officehoursDaoImpl = new officehoursDaoImpl();
                        //out.print(memberid+" "+col+" "+ request.getParameter("data"));
                        List<officehourss> officehours = new ArrayList();
                        if (col.equals("all")) {
                            officehours = officehoursDaoImpl.showAllOfficeHoursOfMember(memberid);
                        } else {
                            officehours = officehoursDaoImpl.showAllOfficeHours(memberid, col, request.getParameter("data"));
                        }
                        if (officehours.size() != 0) {
                %>

                <ul class="list-group list-group-horizontal" style="margin-left: 5px;">
                    <li class="list-group-item" style="width: 150px;"><h4>OfficeHour ID</h4></li>
                    <li class="list-group-item" style="width: 150px;"> <h4>Date</h4></li>
                    <li class="list-group-item" style="width: 150px;"> <h4>From</h4></li>
                    <li class="list-group-item" style="width: 150px;"> <h4>To</h4></li>
                    <li class="list-group-item" style="width: 150px;"> <h4>Location</h4></li>
                    <li class="list-group-item" style="width: 150px;"> <h4>Type</h4></li>
                </ul>


                <%
                    for (officehourss office : officehours) {
                %>

                <ul class="list-group list-group-horizontal" style="margin-left: 5px;">
                    <li class="list-group-item" style="width: 150px;"><h4> <%=office.getId()%></h4></li>
                    <li class="list-group-item" style="width: 150px;"> <h4><%=office.getDate()%></h4></li>
                    <li class="list-group-item" style="width: 150px;"> <h4><%=office.getFrom()%></h4></li>
                    <li class="list-group-item" style="width: 150px;"> <h4><%=office.getTo()%></h4></li>
                    <li class="list-group-item" style="width: 150px;"> <h4><%=office.getLocation()%></h4></li>
                    <li class="list-group-item" style="width: 150px;"> <h4><%=office.getOnoroff()%></h4></li>
                </ul>

                <%
                      }
                  } else {%>


                <h5 style="color:red ; text-align: center ">There no office hours by this data</h5> <br>  

                <%}
    }%>

                <br><br>

            </div>


        </section>


    </body>



</html>
