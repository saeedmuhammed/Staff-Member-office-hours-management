<%-- 
    Document   : updateOffice
    Created on : Jan 14, 2021, 7:36:14 AM
    Author     : Saeed
--%>

<%@page import="javainfinite.pojo.notificationn"%>
<%@page import="javainfinite.DAOImpl.notificationDaoImpl"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="javainfinite.pojo.officehourss"%>
<%@page import="java.util.List"%>
<%@page import="javainfinite.DAOImpl.officehoursDaoImpl"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
     <link rel="stylesheet" href="staffsubject/mystyle.css">
        <title>Update Office Hours</title>
            <script>
   function validate(form) {
         if (form.data.value === "") {
            alert( "Please provide office hour ID!" );
            return false;
        }
       
 
         return true;

      }
      function isValidTime(time){
                   if (!/^\d{1,2}\:\d{2}$/.test(time))
                    return false;
                
                return true;
            }
  
   function validate2(form) {
         if (form.date.value === "") {
            alert( "Please provide date!" );
            return false;
        }
         if (form.from.value === "") {
            alert( "Please provide from!" );
            return false;
        }
       
        if (form.to.value === "") {
            alert( "Please provide to!" );
            return false;
        }
        if(!isValidTime(form.from.value)){
                    alert("Please provide time right in format HH:MM!");
                        return false;
 
                    
                }
                 if(!isValidTime(form.to.value)){
                    alert("Please provide time right in format HH:MM!");
                        return false;
 
                    
                }
       
        if (form.location.value === "") {
            alert( "Please provide location!" );
            return false;
        }
       
        if (form.onoroff.value === "") {
            alert( "Please provide onoroff!" );
            return false;
        }
        var type=form.onoroff.value.toLowerCase();
         if ( type !== "offline" && type !== "online") {
                    alert("Please provide online or offline!");
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
        int c=0;
       //java.util.Date currentdate = new java.util.Date(Calendar.getInstance().getTime().getTime());
       notificationDaoImpl  notificationDaoImpl = new  notificationDaoImpl();
       List<notificationn> notifications = notificationDaoImpl.showAllNotification();
       String loginId=(String)session.getAttribute("memId");
       if(notifications.size()!=0){
       for( notificationn  notification : notifications){
           
          if(loginId.equals(notification.getMemberid())){
          java.util.Date date =  notification.getDate();
           if((formatter.format(currentdate).equals(date) || date.compareTo(currentdate) < 0 )){
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

 if(c!=0){%>
    <span class="badge" style="position: absolute;
  top: 118px;
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
             
                <div class="signup-content">
                    
                       <div class="signup-form">
                        <h2 class="form-title">Update Office Hours</h2>
                        <form onsubmit=" return validate(this);"  class="register-form" id="login-form">
                            
                             <div class="row">
  <div class="col-md-8"> 
                            <div class="form-group2">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="data" id="your_name" placeholder="OfficeHour ID"/>
                            </div> </div>
  <div class="col-md-4">  <div class="form-group form-button">
                                <input type="submit" name="up" id="signin" class="form-submit" value="Enter"/>
                            </div></div>
</div>
                           
                           
                           
                        </form>
                       
                    </div>
                    
                  </div>   
                    
                <%
                 
               if(request.getParameter("up") != null){
                   
                String memberid = (String) session.getAttribute("memId");
               officehoursDaoImpl officehoursDaoImpl = new officehoursDaoImpl();
               List<officehourss> officehours = officehoursDaoImpl.getOfficeHourByID(request.getParameter("data"),memberid);
               
               if(officehours.size() == 1){
                %>
                    
                    
                    
                    
                    <div class="signup-content">     
                    
                <div class="signup-form">
                        
                        <form onsubmit="return validate2(this);" action="OfficeHoursController" class="register-form" id="login-form">
                      
                             <div class="form-group2">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="hidden" name="date" id="your_name" placeholder="OfficeHour ID" value="<%out.print(officehours.get(0).getDate());%>" />
                            </div> 
                                
                            <div class="form-group2">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                From <input type="text" name="from" id="your_name" placeholder="From"  value="<%out.print(officehours.get(0).getFrom());%>"/>
                            </div> 
                            <div class="form-group2">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                               To  <input type="text" name="to" id="your_name" placeholder="To"  value="<%out.print(officehours.get(0).getTo());%>"/>
                            </div> 
                            <div class="form-group2">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                               Location <input type="text" name="location" id="your_name" placeholder="Location" value="<%out.print(officehours.get(0).getLocation());%>"/>
                            </div> 
                              
                            <div class="form-group2">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                Type <input type="text" name="onoroff" id="your_name" placeholder="Type"  value="<%out.print(officehours.get(0).getOnoroff());%>"/>
                            </div> 
                            
                            
                            <div class="form-group form-button" style="margin-left: 150px;margin-top: 20px;">
                                <input type="submit" name="Update" id="signin" class="form-submit" value="Update" />
                            </div>

                           
                           
                           
                        </form>
                       
                    </div>      
                    
                    
                    
                    
                    
                    
                    
                    
       </div>
        
        
        
        
        
        
        
                  
                  
              <%} 

else{%>

           
<h5 style="color:red ; text-align: center ">There no office hours by this ID</h5> <br>  
            
            <%}
    
    } %>    
        
    
    
    
    
      
    
               
   
                
</div>
               
         
        </section>          
                
                
                
                </body>
</html>
