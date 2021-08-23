<%-- 
    Document   : student_message
    Created on : Jan 4, 2021, 2:31:43 AM
    Author     : Dell
--%>

<%@page import="javainfinite.pojo.notificationn"%>
<%@page import="java.util.List"%>
<%@page import="javainfinite.DAOImpl.notificationDaoImpl"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javainfinite.DAOImpl.messageDaoImpl"%>
<%@page import="javainfinite.pojo.message"%>
<%@page import="javainfinite.DAOImpl.staffmemberDAOImpl"%>
<%@page import="javainfinite.pojo.staffmember"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="studentsend/mystyle.css">


        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Send Message</title>
        <script>
            function validate(form) {
                if (form.id.value === "") {
                    alert("Please provide member ID!");
                    return false;
                }
                if (form.message.value === "") {
                    alert("Please write message!");
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
                              right: 1167px;
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
                <div class="signup-content">

                    <div class="signup-form">
                        <h2 class="form-title">Message staff member</h2>
                        <form id="myform" onsubmit="return validate(this)" action="messageController" class="register-form" id="login-form">


                            <div class="form-group2">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="id" id="your_name" placeholder="Staff Member ID"/>
                            </div> <br>
                            <textarea  rows="4" cols="55" name ="message" id="message" form="myform"></textarea>

                            <div class="form-group form-button">
                                <input type="submit" name="sendmessage" id="signin" class="form-submit send" value="Send"/>
                            </div>




                        </form>
                        <br>


                    </div>





                </div>



            </div>
        </section>




        <%--   
          <form action="" id ="usrform" >
                         Staff Member ID: 
                       <input type="text" name="id">
                      <input type="submit" name="sendmessage" value="Send">
           </form>
           <br>
            <textarea  rows="4" cols="50" name="message" form="usrform"></textarea>
           </body>
            <br>
            <br>--%>

    </body>
</html>
