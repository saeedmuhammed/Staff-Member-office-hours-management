<%-- 
    Document   : studenlogin
    Created on : Dec 25, 2020, 6:39:51 PM
    Author     : Saeed
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
<html>
    <head>
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
     <link rel="stylesheet" href="studentsignup/mystyle.css">
     
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>Signup</title>
        
  <script>
   function validate() {
       
        var id = document.getElementById("id").value;
         var letterNumber = /^[a-zA-Z]+$/;
         var letterNumber2 = /^[0-9]+$/;
         var name = document.getElementById("name").value;
         var email = document.getElementById("email").value;
         var year = document.getElementById("year").value;
         var addstudent = document.getElementById("addstudent").value;
         var sa = grecaptcha.getResponse()
          atpos = email.indexOf("@");
         dotpos = email.lastIndexOf(".");
         
         if (id === "") {
            alert( "Please provide your username!" );
            document.getElementById("id").focus() ;
            return false;
        }
        if(id.match(letterNumber)) {
             alert( "Username can't be letters only !" );
            document.getElementById("id").focus() ;
            return false;
            
            
        }
         if(id.match(letterNumber2)){
         alert( "Username can't be numbers only!" );
            document.getElementById("id").focus() ;
            return false;
        }
        
        
       
         if(name == "" ) {
            alert( "Please provide your name!" );
            document.getElementById("name").focus() ;
            return false;
         }
      
         if (atpos < 1 || ( dotpos - atpos < 2 ) || email== "" ){
            alert("Please enter your email ")
            document.getElementById("email").focus() ;
            return false;
         }
         
        
         if( year == "" || year > 4 || year < 1 ){
            alert( "Year Must be 1 or 2 or 3 or 4!" );
            document.getElementById("year").focus() ;
            return false;
         }
       
          var xmlhttp = new XMLHttpRequest();
            
            xmlhttp.open("GET","studentController?id="+id+"&addstudent="+addstudent+"&email="+email+"&name="+name+"&year="+year+"&g-recaptcha-response="+sa,true);
            xmlhttp.send();
            
            xmlhttp.onreadystatechange=function()
            {
                if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    //
              if(xmlhttp.responseText!=="done"){
                  alert(xmlhttp.responseText);
            //document.getElementById("servermsg").innerHTML=xmlhttp.responseText
        }
           else{
               alert("Signup Successfully Please check your email to get your password");
            window.location.href="studentlogin.jsp";
        }
           return false;
                 }
            }
         return true;
     
      }

     
    </script>
    </head>
    <body>
    
        <script src="https://www.google.com/recaptcha/api.js" async defer></script> 
<br><br><br>
    <%--
         <div id="add">
        <h1> Sign UP </h1>
        <form action="studentController" >
            <table>
                <tr>
                    <td> Username: </td>
                    <td><input type="text" name="id"></td>
                </tr>
                <tr>
                    <td> Name: </td>
                    <td><input type="text" name="name"></td>
                </tr>
                 <tr>
                    <td> Password: </td>
                    <td><input type="text" name="password"></td>
                </tr>
                <tr>
                    <td> Year: </td>
                    <td><input type="text" name="year"></td>
                </tr>
                <tr>
                    <td> Email: </td>
                    <td><input type="email" name="email"></td>
                </tr>
               <div class="g-recaptcha" data-sitekey="6Le4pxQaAAAAAJzO9BVkaN7zIfBh3iVZ13QKIVf_"></div>
  
                <tr>
                    <td><input type="submit" name="addstudent" value="signup"></td>
                 
                </tr>
            </table>
        </form>
        </div> --%>
  
    
    <section class="signup">
            <div class="container">
                <a href="home.jsp" style="text-decoration: none"> <div style="font-size: 50px">&#8630;</div></a>
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">Sign up</h2>
                        <form name="myForm"   class="register-form" id="register-form"  >
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="id" id="id"  placeholder="User Name"/>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="name" id="name" placeholder="Name"/>
                            </div>
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="email" placeholder="Email"/>
                            </div>
                          
                            <div class="form-group">
                                <label for="re-pass"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="text" name="year" id="year" placeholder="Year"/>
                            </div>
                              <div class="g-recaptcha" id="sa" data-sitekey="6Le4pxQaAAAAAJzO9BVkaN7zIfBh3iVZ13QKIVf_"></div>

                            <div class="form-group form-button">
                                <input type="button" onclick="validate();" name="addstudent" id="addstudent" class="form-submit" value="Register"/>
                            </div>
                        </form>
                    </div>
                    <div class="signup-image">
                        <figure><img src="images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="studentlogin.jsp" class="signup-image-link">I am already member</a>
                    </div>
                </div>
            </div>
        </section> 
    
    
    
    
    
    
    
    

    
    
    
    </body>
</html>
