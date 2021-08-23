<%-- 
    Document   : staffmembers
    Created on : Jan 1, 2021, 2:34:55 AM
    Author     : Saeed
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
        <link rel="stylesheet" href="staffmembers/mystyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search for staff member</title>
        <script>
            function validate(form) {
                if (form.staffid.value === "") {
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
                <div class="signup-content">

                    <div class="signup-form">
                        <h2 class="form-title">Search for staff member</h2>
                        <form onsubmit=" return validate(this);" action="staffmembers.jsp" class="register-form" id="login-form">

                            <div class="row">
                                <div class="col-md-8"> 
                                    <div class="form-group2">
                                        <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                        <input type="text" name="staffid" id="your_name" placeholder="Staff Member ID"/>
                                    </div> </div>
                                <div class="col-md-4">  <div class="form-group form-button">
                                        <input type="submit" name="search" id="signin" class="form-submit" value="Search"/>
                                    </div></div>
                            </div>



                        </form>

                    </div>





                </div>
                <%                        String staffID = request.getParameter("staffid");
                    if (request.getParameter("search") != null && !staffID.isEmpty()) {
                        staffmember staffmember = new staffmember();
                        staffmemberDAOImpl staffmemberDAOImpl = new staffmemberDAOImpl();

                        staffmember = staffmemberDAOImpl.getStaffMemberByID(staffID);
                            if (staffmember != null) {     %>

                <br>
                <ul class="list-group list-group-horizontal" style="margin-left:20px;">
                    <li class="list-group-item" style="width: 200px;"><h3>Name</h3></li>
                    <li class="list-group-item" style="width: 250px;"> <h3>Email</h3></li>
                    <li class="list-group-item" style="width: 200px;" > <h3> Phone</h3></li>
                    <li class="list-group-item" style="width: 200px;"> <h3>Role</h3></li>


                </ul>

                <ul class="list-group list-group-horizontal" style="margin-left:20px;">
                    <li class="list-group-item" style="width: 200px;"><h3><%out.print(staffmember.getName());%></h3></li>
                    <li class="list-group-item" style="width: 250px;"> <h3><%out.println(staffmember.getEmail());%></h3></li>
                    <li class="list-group-item" style="width: 200px;" > <h3> <%out.println(staffmember.getPhone());%> </h3></li>
                    <li class="list-group-item" style="width: 200px;"> <h3><%out.println(staffmember.getRole());%></h3></li>


                </ul>
                <br><br>        


                <%
            } else {%>

                <h5 style="color:red ; text-align: center ">There is no staff member with this ID</h5> <br>

                <%}
    }%> 

            </div>

        </div>
    </section>




















    <%--    
      
        <h1>Search for specific staff member</h1>
         <form action ="staffmembers.jsp" >
            <table>
                <tr>
                    <td> Subject: </td>
                    <td><input type="text" name="staffid"></td>
                </tr>
                 <tr>
                    <td><input type="submit" name="search" value="Search"></td>
                    
                 
                </tr>
            </table>
             </form>
                           
        <br> <br>
         <% if(request.getParameter("search")!=null){
                
                staffmember staffmember = new staffmember();
                staffmemberDAOImpl staffmemberDAOImpl = new staffmemberDAOImpl();
               

       String staffID = request.getParameter("staffid");%>
              
        Result Of Search :  
            <br>
      <% staffmember = staffmemberDAOImpl.getStaffMemberByID(staffID);
      if(staffmember != null){     %>
          Name: <%out.print(staffmember.getName());%>
                            <br>

          Email: <%out.println(staffmember.getEmail());%>
                       <br>

          Phone: <%out.println(staffmember.getPhone());%>          
           <br>

          Role:  <%out.println(staffmember.getRole());%>
                       <br>

           ---------------------------------------------------
                        <br>

            <%}
         
         else{out.print("There is no staff member with this id");
            
         
} }%> --%>
</body>
</html>
