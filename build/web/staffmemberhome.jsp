<%-- 
    Document   : staffmemberhome
    Created on : Jan 4, 2021, 10:35:19 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
         <h1>Home</h1>
           Welcome Staff Member 
            <% 
          String name = (String)session.getAttribute("name");
          out.print(name);
          
          %>
          <br>
           <a href="profilestaffmember.jsp">Profile</a>
           <br>
           <a href="messagestaffmemberstudents.jsp">View and reply to student's messages</a>
           <br>
           <a href="sentmessage_staff_home.jsp">Message specific student or other staff members.</a>
           <br>
           <a href="message_subjectteam.jsp">Message subject team</a>
           <br>
           <a href="search_student.jsp">Search about student</a>
           <br>
           <a href="reserve_specific_hours.jsp">View reservation on a specific office hours slot.</a>
           <br>
           <a href="view_reservre.jsp">View history of reservations</a>
            <br>
           <a href="cancel_reserve.jsp">Cancel slot reservations</a>
           
           
    </body>
</html>
