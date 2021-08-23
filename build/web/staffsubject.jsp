<%-- 
    Document   : staffsubject
    Created on : Dec 31, 2020, 11:15:12 AM
    Author     : Dell
--%>

<%@page import="javainfinite.pojo.notificationn"%>
<%@page import="javainfinite.DAOImpl.notificationDaoImpl"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="javainfinite.DAOImpl.subjectDaoImpl"%>
<%@page import="javainfinite.pojo.subject"%>
<%@page import="javainfinite.DAOImpl.staffmemberDAOImpl"%>
<%@page import="javainfinite.pojo.staffmember"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="staffsubject/mystyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search about subject</title>
        <script>
            function validate(form) {
                if (form.subject.value === "") {
                    alert("Please provide subject ID!");
                    form.id.focus();
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
                <div class="signup-content">

                    <div class="signup-form">
                        <h2 class="form-title">Know staff of subject</h2>
                        <form onsubmit=" return validate(this);" action="staffsubject.jsp" class="register-form" id="login-form">

                            <div class="row">
                                <div class="col-md-8"> 
                                    <div class="form-group2">
                                        <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                        <input type="text" name="subject" id="your_name" placeholder="Subject ID"/>
                                    </div> </div>
                                <div class="col-md-4">  <div class="form-group form-button">
                                        <input type="submit" name="search" id="signin" class="form-submit" value="Search"/>
                                    </div></div>
                            </div>



                        </form>

                    </div>





                </div>
                <% if (request.getParameter("search") != null && !request.getParameter("subject").isEmpty()) {

                        staffmember staffmember = new staffmember();
                        staffmemberDAOImpl staffmemberDAOImpl = new staffmemberDAOImpl();
                        subject subject = new subject();
                        subjectDaoImpl subjectDaoImpl = new subjectDaoImpl();

                        List< subject> sub = subjectDaoImpl.showAllSubject(request.getParameter("subject"));

                        ///out.println(sub.size());
                        if (sub.size() != 0) {

                                String IdSubject = request.getParameter("subject");%>

                <ul class="list-group list-group-horizontal" style="margin-left: 100px;">
                    <li class="list-group-item" style="width: 300px;"><h3>Name</h3></li>
                    <li class="list-group-item" style="width: 200px;"> <h3>Role</h3></li>
                    <li class="list-group-item" style="width: 200px;"> <h3>ID</h3></li>
                </ul>
                <% List<staffmember> staffs = staffmemberDAOImpl.showAllStaffMember(IdSubject);

          for (int i = 0; i < staffs.size(); i++) {%>
                <ul class="list-group list-group-horizontal" style="margin-left: 100px;">
                    <li class="list-group-item" style="width: 300px;"><h3><%out.print(staffs.get(i).getName());%></h3></li>
                    <li class="list-group-item" style="width: 200px;"> <h3><%out.println(staffs.get(i).getRole());%></h3></li>
                    <li class="list-group-item" style="width: 200px;"> <h3><%out.println(staffs.get(i).getId());%></h3></li>
                </ul>



                <%}
                } else {
                %>

                <h5 style="color:red ; text-align: center ">There is no subject with this ID</h5> <br>            

                <%}
    }%> 
                <br><br>
            </div>

        </div>
    </section>


















    <%--  <h1>Search in staff of each subject</h1>
       <form action ="staffsubject.jsp" >
          <table>
              <tr>
                  <td> Subject: </td>
                  <td><input type="text" name="subject"></td>
              </tr>
               <tr>
                  <td><input type="submit" name="search" value="Search"></td>
                  
               
              </tr>
          </table>
           </form> --%>

    <br> <br>






</body>
</html>
