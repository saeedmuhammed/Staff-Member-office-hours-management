<%-- 
    Document   : search_student
    Created on : Jan 4, 2021, 1:38:32 PM
    Author     : Dell
--%>

<%@page import="javainfinite.pojo.notificationn"%>
<%@page import="java.util.List"%>
<%@page import="javainfinite.DAOImpl.notificationDaoImpl"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javainfinite.DAOImpl.studentDaoImpl"%>
<%@page import="javainfinite.pojo.student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="staffsubject/mystyle.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Search For Student</title>
        <script>
            function validate(form) {
                if (form.id.value === "") {
                    alert("Please provide student ID!");
                    return false;
                }


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
                        <h2 class="form-title">Search for Student</h2>
                        <form onsubmit="return validate(this);" action="search_student.jsp" class="register-form" id="login-form">

                            <div class="row">
                                <div class="col-md-8"> 
                                    <div class="form-group2">
                                        <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                        <input type="text" name="id" id="id" placeholder="Student ID"/>
                                    </div> </div>
                                <div class="col-md-4">  <div class="form-group form-button">
                                        <input type="submit" name="search" id="signin" class="form-submit" value="Search"/>
                                    </div></div>
                            </div>



                        </form>

                    </div>





                </div>
                <% if (request.getParameter("search") != null && !request.getParameter("id").isEmpty()) {

                        student student = new student();
                        studentDaoImpl studentDaoImpl = new studentDaoImpl();
                        student = studentDaoImpl.getStudentByID(request.getParameter("id"));
                        if (student != null) {
                %>

                <ul class="list-group list-group-horizontal" style="margin-left: 8px;">
                    <li class="list-group-item" style="width: 400px;"><h3>Name</h3></li>
                    <li class="list-group-item" style="width: 400px;"> <h3>Email</h3></li>
                    <li class="list-group-item" style="width: 200px;"> <h3>Year</h3></li>
                </ul>

                <ul class="list-group list-group-horizontal" style="margin-left: 8px;">
                    <li class="list-group-item" style="width: 400px;"><h3><%out.print(student.getName());%></h3></li>
                    <li class="list-group-item" style="width: 400px;"> <h3><%out.println(student.getEmail());%></h3></li>
                    <li class="list-group-item" style="width: 200px;"> <h3><%out.println(student.getYear());%></h3></li>
                </ul>
                <br><br>        


                <%} else {
                %>

                <h5 style="color:red ; text-align: center ">There is no student with this ID</h5> <br>            

                <%}
    }%> 

            </div>

        </div>
    </section>


</body>  
</html>
