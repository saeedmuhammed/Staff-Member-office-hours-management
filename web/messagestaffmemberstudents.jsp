<%-- 
    Document   : messagestaffmemberstudent
    Created on : Jan 4, 2021, 10:40:14 AM
    Author     : Dell
--%>


<%@page import="javainfinite.pojo.notificationn"%>
<%@page import="javainfinite.DAOImpl.notificationDaoImpl"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="javainfinite.DAOImpl.messageDaoImpl"%>
<%@page import="javainfinite.pojo.message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Messages From Student</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="messagestaffmemberstudents/myystylee.css">
        <link rel="stylesheet" href="style.css">


    <body>
        <br>
        <br><br><br>
        <section class="signup" >
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
                              top: 139px;
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
                <br>



                <%            message message = new message();
                    messageDaoImpl messageDaoImpl = new messageDaoImpl();

                    List<message> messages = messageDaoImpl.showMessageToid((String) session.getAttribute("memId"));
                    if (messages != null) {
                        for (int i = messages.size() - 1; i >= 0; i--) {
                            // out.print("Student ID: " + messagee.getFromid());

                            //out.print("Body of Message: " + messagee.getData());
                %>

                <div class="alert alert-success" style="background-color: whitesmoke;" role="alert">
                    <h4 class="alert-heading"><%out.print("From : " + messages.get(i).getFromid());%></h4>
                    <p> <% out.print("Message : " + messages.get(i).getData());%></p>
                    <hr>


                    <form  action="replyToStudent.jsp"  id="usrform">

                        <input type="hidden" name="studentid" value="<%=messages.get(i).getFromid()%>">

                        <div class="form-group form-button" style="margin-left: 350px;">
                            <input type="submit" class="form-submit" name="reply" value="Reply">
                        </div>

                    </form>
                </div>  




                <%

            }%>
                <br><br>
                <%} else {%>

                <h4 class="nomesg"> There are no messages</h4> <br> <br><br>

                <%}

                %>





            </div>
        </section>







    </body>
</html>
