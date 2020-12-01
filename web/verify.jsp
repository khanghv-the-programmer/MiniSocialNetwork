<%-- 
    Document   : index
    Created on : Sep 15, 2020, 5:20:25 PM
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
        <title>Verify Account</title>
        <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
        <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">



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
                                    AMONG SOCIAL!<br/></h3>

                                <a href="index.jsp" class="read-more-1 btn">Go back</a>
                                <h4>If you didn't get the verificode</h4>
                                <a href="MainController?action=Send&5141912=${requestScope.LIAME}" class="read-more-1 btn">Send Again!</a>
                            </div>

                        </div>
                    </div>
                    <div class="form-left">
                        <div class="middle">
                            <h4>Verify Account</h4>

                        </div>
                        <form action="MainController" method="POST" style="position: static"  class="signin-form">


                            <div class="form-input">
                                <label>Verify Code</label>
                                <input type="hidden" name="5141912" value="${requestScope.LIAME}" />
                                <input type="password" placeholder="Input your verify code in email" value="" name="txtCode" style="height: 50px" />
                                <br/><font color='red'>${requestScope.VERR}</font><br/>
                            </div>


                            <button name="action" value="Verify" class="btn">Verify Code</button>
                        </form>

                        <h2 style="color: green">${requestScope.OK}</h2>


                    </div>




                </div>

            </div>
        </section>
    </body>
</html>
