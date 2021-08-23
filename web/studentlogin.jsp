<%-- 
    Document   : studentlogin
    Created on : Dec 31, 2020, 3:56:46 AM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
           <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
     <link rel="stylesheet" href="studentlogin/mystyle.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
          <script>
   function validate() {
       
         var id = document.getElementById("id").value;
         var password = document.getElementById("password").value;
         var login = document.getElementById("login").value;
       
         if (id === "") {
            alert( "Please provide your username!" );
            document.getElementById("id").focus() ;
            return false;
        }
   
          if(password== "" ) {
            alert( "Please provide your password!" );
            document.getElementById("password").focus() ;
           return false;
         }
            var xmlhttp = new XMLHttpRequest();
            
            xmlhttp.open("GET","studentController?id="+id+"&password="+password+"&login="+login,true);
            xmlhttp.send();
            
            xmlhttp.onreadystatechange=function()
            {
                if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    //alert(xmlhttp.responseText);
              if(xmlhttp.responseText!=="done"){
            document.getElementById("servermsg").innerHTML=xmlhttp.responseText
        }
           else{
               alert("Login Successfully");
            window.location.href="profilestudent.jsp";
        }
           return false;
                 }
            }
        
        
       return true;
     
      }
        
     
    </script>
    </head>
    <body>
    <%--
         <form action="studentController" >
            <table>
                <tr>
                    <td> Username: </td>
                    <td><input type="text" name="id"></td>
                </tr>
                <tr>
                    <td> Password: </td>
                    <td><input type="text" name="password"></td>
                </tr>
            
                <tr>
                    <td><input type="submit" name="login" value="Login"></td>
                 
                </tr>
            </table>
        </form>
        --%>
        <br><br><br>
         <section class="sign-in">
            <div class="container">
                <a href="studentsignup.jsp" style="text-decoration: none"> <div style="font-size: 50px">&#8630;</div></a>
                <div class="signin-content">
                    
                    <div class="signin-image">
                        <figure><img src="images/signin-image.jpg" alt="sing up image"></figure>
                        <a href="studentsignup.jsp" class="signup-image-link">Create an account</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Sign in</h2>
                        <form    class="register-form" id="login-form">
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="id" id="id" placeholder="User Name"/>
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="password" id="password" placeholder="Password"/>
                            </div>
                            <div class="form-group">
                                <input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
                            </div>
                            <div class="form-group form-button">
                                <input type="button" onclick="validate();" name="login" id="login" class="form-submit" value="Log in"/>
                            </div>
                        </form>
                        
                        
                        <h1 id="servermsg" style="color:red;margin-top: 48px;"></h1>
                        
                    </div>
                </div>
            </div>
        </section>
        <br><br><br> 
    </body>
</html>
