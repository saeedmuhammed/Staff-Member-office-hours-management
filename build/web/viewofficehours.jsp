<%-- 
    Document   : viewofficehours
    Created on : Jan 1, 2021, 2:53:42 AM
    Author     : Saeed
--%>

<%@page import="javainfinite.pojo.notificationn"%>
<%@page import="javainfinite.DAOImpl.notificationDaoImpl"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javainfinite.DAOImpl.slotDaoImpl"%>
<%@page import="javainfinite.pojo.slot"%>
<%@page import="java.util.List"%>
<%@page import="javainfinite.DAOImpl.officehoursDaoImpl"%>
<%@page import="javainfinite.DAOImpl.staffmemberDAOImpl"%>
<%@page import="javainfinite.pojo.staffmember"%>
<%@page import="javainfinite.pojo.officehourss"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="viewofficehours/mystyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search for office hours of member</title>
        <script>
            function validate(form) {
                if (form.memberID.value === "") {
                    alert("Please provide member ID!");
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
                <br> <br><br>
                <div class="signup-form">
                    <h2 class="form-title">Search for Office Hours</h2>
                    <form onsubmit=" return validate(this);" action="viewofficehours.jsp" class="register-form" id="login-form">

                        <div class="row">
                            <div class="col-md-8"> 
                                <div class="form-group2">
                                    <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                    <input type="text" name="memberID" id="your_name" placeholder="Staff Member ID"/>
                                </div> </div>
                            <div class="col-md-4">  <div class="form-group form-button">
                                    <input type="submit" name="search" id="signin" class="form-submit" value="Search"/>
                                </div></div>
                        </div>



                    </form>

                </div>



                <% if (request.getParameter("search") != null && !request.getParameter("memberID").isEmpty()) {

                        officehourss officehour = new officehourss();
                        officehoursDaoImpl officehourDAOImpl = new officehoursDaoImpl();
                        staffmember staffmember = new staffmember();
                        staffmemberDAOImpl staffmemberDAOImpl = new staffmemberDAOImpl();
                        slot slot = new slot();
                        slotDaoImpl slotDaoImpl = new slotDaoImpl();

                        staffmember = staffmemberDAOImpl.getStaffMemberByID(request.getParameter("memberID"));
                        if (staffmember != null) {
                            List<officehourss> officehours = officehourDAOImpl.showAllOfficeHoursOfMember(request.getParameter("memberID"));

                %>      
                <div class="accordion accordion-flush" id="accordionFlushExample">      

                    <% for (int i = 0; i < officehours.size(); i++) { %>

                    <div class="accordion-item">
                        <h2 class="accordion-header" id="flush-headingOne">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                <%out.print(officehours.get(i).getDate());%>/


                                <%out.println(officehours.get(i).getLocation());%>/

                                <%out.println(officehours.get(i).getOnoroff());%>


                            </button>
                        </h2>
                        <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">  

                                <%  List<slot> slots = slotDaoImpl.showAllSlotsOfOfficeHours(Integer.toString(officehours.get(i).getId()));
                                    if (slots.size() != 0) {
                                        for (int j = 0; j < slots.size(); j++) {
                                            if (slots.get(j).getReserved().equals("0")) {%>


                                <div class="card" style="width: 18rem;">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item"> 
                                            <form action="makeappointment" class="register-form" id="login-form">
                                                <h4> From <%out.print(slots.get(j).getFrom());%> To  <%out.print(slots.get(j).getTo());  %> </h4>


                                                <div class="form-group1">
                                                    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                                    <input type="hidden" name="date" id="name" value="<%out.print(officehours.get(i).getDate());%>"/>
                                                </div>
                                                <div class="form-group1">
                                                    <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                                    <input type="hidden" name="slotid" id="name" value="<%out.print(slots.get(j).getSlotid());%>"/>
                                                </div>    

                                                <div class="form-group form-button2">
                                                    <input type="submit" name="appointment" id="signin" class="form-submit" value="Make Appointment"/>
                                                </div>
                                            </form></li>


                                    </ul>
                                </div>


                                <%

                                        }
                                    }
                                %>


                            </div>      
                        </div>

                    </div>











                    <%
                        } else {

                            out.print("There is no free slots");

                        }


                    %>


                    <% } %>

                </div>

                <% } else {%>


                <h5 style="color:red ; text-align: center ; margin-top: 50px;">There is no staff member with this ID</h5> 

                <%
                        }

                    }
                    session.setAttribute("memberId", request.getParameter("memberID"));
                %>            

                <br>



            </div>
        </section>       


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

    </body>
</html>
