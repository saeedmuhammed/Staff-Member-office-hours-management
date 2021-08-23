<%-- 
    Document   : studentpage
    Created on : Dec 31, 2020, 6:04:11 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page Student: </title>
       
    </head>
    <body>
        <h1>Home</h1>
           Welcome Student 
            <% 
          String name = (String)session.getAttribute("id");
          out.print(name);
          
          %>
          <br>
           <a href="profilestudent.jsp">Profile</a>
           <br>
           <a href="staffsubject.jsp">Search in staff of each subject</a>
           <br>
           <a href="staffmembers.jsp">Search for specific staff member</a>
           <br>
           <a href="viewofficehours.jsp">View the office hours schedule for the staff member.</a>
           <br>
           <a href="cancelmeeting.jsp"> Cancel a meeting reservation</a>
           <br>
           <a href=""> Messages</a>
           <br>
           
           


           
          

    </body>
</html>
