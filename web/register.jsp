<%-- 
    Document   : register
    Created on : Sep 16, 2020, 8:57:06 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="UTF-8" />
        <script>
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>
        <title>Register</title>
        <style><%@include file="style/style.css" %></style>
    </head>
    <body>









        <section class="w3l-login-6">
            <div class="login-hny">
                <div class="form-content">
                    <div class="form-right">
                        <div class="overlay">
                            <div class="grid-info-form">
                                <h5>Java Web - Lab 1</h5>
                                <h3>WELCOME TO<br/> 
                                    AMONG SOCIAL!</h3>							
                                <a href="index.jsp" class="read-more-1 btn">Login Page</a>
                            </div>

                        </div>
                    </div>
                    <div class="form-left">
                        <div class="middle">
                            <h4>Register Page</h4>

                        </div>
                        <form action="MainController" method="POST" style="position: static"  class="signin-form">
                            <div class="form-input">
                                <label>Email</label>
                                <input type="text"  name="txtEmail" value="${requestScope.EMAIL}" placeholder="Please input the first part of your email"/><br/><br/><select style="background: #fff;
                                                                                                                                                                   outline: none;
                                                                                                                                                                   width: 100%;
                                                                                                                                                                   font-size: 17px;
                                                                                                                                                                   padding: 10px 15px;
                                                                                                                                                                   color:#090e0d;
                                                                                                                                                                   border: 2px solid #BECED0;" name="txtExtend">
                                    <option>@gmail.com</option>
                                    <option>@gmail.com.vn</option>
                                    <option>@fpt.edu.vn</option>
                                    <option>@yahoo.com</option>
                                    <option>@yahoo.com.vn</option>
                                </select><br/>
                                <font color='red'>${requestScope.EERR}</font><br/>
                            </div>

                            <div class="form-input">
                                <label>Password</label>
                                <input type="password" value="" name="txtPassword" style="height: 150"  placeholder="Please input password (8-20 letters)" />
                                <br/><font color='red'>${requestScope.PERR}</font><br/>
                            </div>

                            <div class="form-input">
                                <label>Full Name</label>
                                <input type="text"  name="txtName" value="${requestScope.FN}" placeholder="Please input your full name" style="height: 150" />
                                <br/><font color='red'>${requestScope.FERR}</font><br/>
                            </div>


                            <button name="action" value="Register" class="btn">Register</button>
                        </form>

                    </div>
                    <div class="copy-right text-center">
                        <h2 style="color: green">${requestScope.OK}</h2>
                    </div>
                </div>

            </div>
        </section>
    </body>
</html>
