<%-- 
    Document   : studentNotify
    Created on : Jan 15, 2021, 5:51:36 AM
    Author     : Saeed
--%>

<%@page import="javainfinite.pojo.notificationn"%>
<%@page import="java.util.List"%>
<%@page import="javainfinite.DAOImpl.notificationDaoImpl"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
     <link rel="stylesheet" href="sendmessagestudent/mystylee.css">
    <link rel="stylesheet" href="style.css">
        <title>JSP Page</title>
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
        int c=0;
       //java.util.Date currentdate = new java.util.Date(Calendar.getInstance().getTime().getTime());
       notificationDaoImpl  notificationDaoImpl = new  notificationDaoImpl();
       List<notificationn> notifications = notificationDaoImpl.showAllNotification();
       String loginId=(String)session.getAttribute("id");
       if(notifications.size()!=0){
       for( notificationn  notification : notifications){
          if(loginId.equals(notification.getStudentId())){
           
          java.util.Date date =  notification.getDate();
           if((formatter.format(currentdate).equals(date) || date.compareTo(currentdate) < 0 )){
              if(!notification.getBody().contains("new")){ 
                    c++; 
               String sent =  notification.getSent();
               if(sent.equals("no")){
            
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
      
   if(c!=0){%>
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
   <!-- End Nav -->   <br> 
                    
            
   
  
        <%
        
       
       //java.util.Date currentdate = new java.util.Date(Calendar.getInstance().getTime().getTime());
     
       List<notificationn> notifications2 = notificationDaoImpl.showAllNotification();
      
       if(notifications.size()!=0){
       for(int i =notifications2.size()-1 ; i>=0 ; i--){
          if(loginId.equals(notifications2.get(i).getStudentId())){
        
              if(!notifications2.get(i).getBody().contains("new")){ 
                 
     
        %>
           
        <div class="alert alert-success" style="background-color: whitesmoke;" role="alert">
  
            <h4 class="alert-heading"><%out.print(notifications2.get(i).getBody());%></h4>
 
            <hr>
            </div>  
  
        
    
      
        <%
            
              }
          }
       
         
       }%>
<br><br>
        
<%}
       

    else {%>
              
     
       <h4 class="nomesg" style="text-align: center; color: red;">  There are no Notifications</h4> <br> <br><br>
          <%}

        
        %>
        
  
        
          
               
            </div>
        </section>
        
                
    
        
    </body>
</html>
