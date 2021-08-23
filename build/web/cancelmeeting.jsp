<%-- 
    Document   : cancelmeeting
    Created on : Jan 1, 2021, 6:18:24 PM
    Author     : Saeed
--%>

<%@page import="javainfinite.pojo.notificationn"%>
<%@page import="javainfinite.DAOImpl.notificationDaoImpl"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javainfinite.DAOImpl.staffmemberDAOImpl"%>
<%@page import="javainfinite.pojo.staffmember"%>
<%@page import="java.util.List"%>
<%@page import="javainfinite.DAOImpl.slotDaoImpl"%>
<%@page import="javainfinite.pojo.slot"%>
<%@page import="javainfinite.DAOImpl.appointmentDaoImpl"%>
<%@page import="javainfinite.pojo.appointment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="cancelmeeting/mystyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cancel your meeting</title>
        <script>
            function validate(form) {
                if (form.meetingId.value === "") {
                    alert("Please provide meeting ID!");
                    return false;
                }
                if (isNaN(form.meetingId.value)) {
                    alert("ID must be Number!");
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
                              right: 1175px;
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
                <br> <br><br>
                <div class="signup-form">
                    <h2 class="form-title">Cancel meeting</h2>
                    <form onsubmit="return validate(this)" action="cancelmeetingg" class="register-form" id="login-form">

                        <div class="row">
                            <div class="col-md-8"> 
                                <div class="form-group2">
                                    <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="meetingId" id="your_name" placeholder="Meeting ID"/>
                                </div> </div>
                            <div class="col-md-4">  <div class="form-group form-button">
                                    <input type="submit" name="cancelMeeting" id="signin" class="form-submit" value="Cancel"/>
                                </div></div>
                        </div>



                    </form>

                </div>
                <br><br>











                <%            String studentId = (String) session.getAttribute("id");

                    appointment appointment = new appointment();
                    appointmentDaoImpl appointmentDaoImpl = new appointmentDaoImpl();
                    slot slot = new slot();
                    staffmember staffmember = new staffmember();
                    staffmemberDAOImpl staffmemberDaoImpl = new staffmemberDAOImpl();
                    slotDaoImpl slotDaoImpl = new slotDaoImpl();

                    List<appointment> appointmentList = appointmentDaoImpl.showAllAppointmentsOfStudent(studentId);
            if (appointmentList.size() != 0) { %>
                <ul class="list-group list-group-horizontal">
                    <li class="list-group-item">Appointment ID</li>
                    <li class="list-group-item">With</li>
                    <li class="list-group-item">From</li>
                    <li class="list-group-item">To</li>
                    <li class="list-group-item" id="l25">Date</li>
                </ul> <%
                    java.util.Date currentDate = new java.util.Date();

                    for (int i = 0; i < appointmentList.size(); i++) {
                        staffmember = staffmemberDaoImpl.getStaffMemberByID(appointmentList.get(i).getMemberid());
                        if (!appointmentList.get(i).getDate().before(currentDate) || appointmentList.get(i).getDate().toString().equals(formatter.format(currentDate))) {

                %>


                <ul class="list-group list-group-horizontal">
                    <li class="list-group-item" id="l1"><%out.println(appointmentList.get(i).getId());%></li>
                    <li class="list-group-item" id="l2"><% out.println(staffmember.getName()); %> </li>
                    <li class="list-group-item" id="l3"><% out.println(appointmentList.get(i).getStart());%></li>
                    <li class="list-group-item" id="l4"> <%out.println(appointmentList.get(i).getEnd());%></li>
                    <li class="list-group-item" id="l5"><%out.println(appointmentList.get(i).getDate());%></li>
                </ul>






                <%

                        }

                    }


                %>
                <%--    <h1>Cancel meeting</h1>
        <form action ="cancelmeetingg" >
           <table>
               <tr>
                   <td> Meeting ID: </td>
                   <td><input type="text" name="meetingId"></td>
               </tr>
                <tr>
                   <td><input type="submit" name="cancelMeeting" value="Cancel"></td>
                   
                
               </tr>
           </table>
            </form>--%>


                <%           } else {
                %>
                <br><br>       <h3> You have no appointments </h3>
                <%         }


                %>
                <br><br>    

                </body>
                </html>
