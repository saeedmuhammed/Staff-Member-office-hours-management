<%-- 
    Document   : home
    Created on : Dec 25, 2020, 6:36:09 PM
    Author     : Saeed
--%>

<%@page import="javainfinite.pojo.notificationn"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.mail.ejb.sendMailBean"%>

<%@page import="java.util.List"%>
<%@page import="javainfinite.DAOImpl.notificationDaoImpl"%>
<%@page import="java.util.Calendar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
            <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="style.css">
     <link rel="stylesheet" href="home/mystyle.css">

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
        
         <%
       
        java.util.Date currentdate = new java.util.Date(); 
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");       
       //java.util.Date currentdate = new java.util.Date(Calendar.getInstance().getTime().getTime());
       notificationDaoImpl  notificationDaoImpl = new  notificationDaoImpl();
       List<notificationn> notifications = notificationDaoImpl.showAllNotification();
       
       for( notificationn  notification : notifications){
             // mailSender = new sendMailBean("se.seifzzzz@gmail.com",notification.getToMember(),"Meeting","You Have meeting with"+notification.getstudentId());
                 //notification.setSent("yes");
                 //notificationDaoImpl.updatenotification(notification);
         
          java.util.Date date =  notification.getDate();
           if((formatter.format(currentdate).equals(date) || date.compareTo(currentdate) < 0 )){
                 String sent =  notification.getSent();
               if(sent.equals("no")){
            
                 sendMailBean mailSender = new sendMailBean("meetingsystem2020@gmail.com",notification.getTo(),"Meeting Day",notification.getBody());
                 sendMailBean mailSender2 = new sendMailBean("meetingsystem2020@gmail.com",notification.getToMember(),"Meeting Day",notification.getBody());
                 //notification.setSent("yes");
                 //notificationDaoImpl.updatenotification(notification);
             }
          }
       
       
       }
    %>   
        <br><br><br>
         <section class="signup">
            <div class="container">
                <br>
                <h2 style="text-align: center">Welcome to our meeting system</h2> 
                <div class="signup-content">
                        
  <div class="card" style="width: 18rem;">
      <a href="studentsignup.jsp"> <img src="download (1).jpg" class="card-img-top" alt="..."> </a>
  
</div>
  <div class="card" style="width: 18rem;">
      <a href="staffmemberlogin.jsp"> <img src="download.jpg" class="card-img-top" alt="..."> </a>
  
</div>
                </div>
            </div>
        </section>
        
    
        
        
    </body>
</html>
