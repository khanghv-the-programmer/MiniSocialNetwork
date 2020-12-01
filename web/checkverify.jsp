<%-- 
    Document   : checkverify
    Created on : Sep 28, 2020, 2:14:14 PM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Check Verify</title>
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
                                <h3>Check Verify Account</h3>

                                <a href="index.jsp" class="read-more-1 btn">Go back</a>
                                <c:if test="${requestScope.NOTVER != null}">
                                    <a href="MainController?action=Send&5141912=${requestScope.LIAME}" class="read-more-1 btn">Verify your account</a>
                                </c:if>
                            </div>

                        </div>
                    </div>
                    <div class="form-left">
                        <div class="middle">
                            <h4>Check Verify</h4>

                        </div>
                        <form action="MainController" method="POST" style="position: static"  class="signin-form">


                            <div class="form-input">
                                <label>Verify Code</label>
                                
                                <input type="text" placeholder="Input your Email!" value="" name="txtEmail" style="height: 50px" />
                                <br/><font color='red'>${requestScope.EERR}</font><br/>
                                <br/><font color='red'>${requestScope.ERRR}</font><br/>
                            </div>


                            <button name="action" value="Check Verify" class="btn">Check Verify</button>
                        </form>

                        <h2 style="color: green">${requestScope.VER}</h2>
                        <h2 style="color: blue">${requestScope.NOTVER}</h2>
                        


                    </div>




                </div>

            </div>
        </section>
    </body>
</html>
