<%-- 
    Document   : member
    Created on : Sep 15, 2020, 6:17:30 PM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style><%@include file="style/navcss.css" %></style>
        <style><%@include file="style/newfeedcss.css" %></style>
        <link href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />" rel="stylesheet">


        <title>New Feed</title>
    </head>
    <body onload="showNoti()" >

        <div id="navigator" style="width: 110vw">
            <a style="margin-left: 0px; margin-top: 0px" href="MainController?action=GetPage"><img src="https://scontent-xsp1-1.xx.fbcdn.net/v/t1.15752-9/119994951_1662131100614982_8941417840604751020_n.jpg?_nc_cat=105&_nc_sid=b96e70&_nc_ohc=7gxHS-AndPYAX_TMtB-&_nc_ht=scontent-xsp1-1.xx&oh=7065a135aefb31d6e3c74e88c9ca0de0&oe=5F8C92B6" width="100px" height="100px"/></a>


            <h2 id ="welcome">${sessionScope.DTO.fullName}</h2><img src="${sessionScope.DTO.image}" id="avatar"/>
            <form action="MainController" method="POST" style="display: inline">
                <h2 id="label-search"> Search Article <input type="text" style="font-size: 25px; width: 20em" placeholder="Input keywords that are inside any articles" name="txtSearch" value="${requestScope.SEARCH}" /></h2>

                &nbsp;&nbsp; <button name="action" class="nav-button" id="search-button" value="Search"><i class="fa fa-search"></i></button>
            </form>
            <div id="search-bar" style="display: inline">


                <form action="MainController" method="POST" style="display: inline">


                    <input class="nav-button" type="submit" value="Log out" name="action" />
                </form><button id ="notification" onclick="showList()" class="nav-button">
                    <i class="fa fa-bell"></i>


                </button><br/>
                <h2 class="fault-invalid"><font color='red'>${requestScope.EMPTY}</font><br/></h2><br/>









            </div>

        </div><br/><br/>
        <c:if test="${requestScope.UNREAD != null}">
            <div id="noti-signal" hidden="true">NotiHere</div>
                
            
        </c:if>
            
            <c:if test="${sessionScope.DTO.status eq 'new'}">
                <div id="verifyacc" hidden="true">Please Verify</div>
            </c:if>


        <div id="person-nav">
            <h1>Hello ${sessionScope.DTO.fullName}!</h1>
            <c:if test="${requestScope.POSTART == null}">
                <form action="MainController" method="POST">
                    <input type="hidden" name="isPost" value="Yes" />
                    <button name="action" class="nav-button" style="width: 300px; font-size: 25px; margin: 20px" value="WriteArticle">Post An Article</button>
                </form>
            </c:if><br/><br/>


            <c:if test="${requestScope.POSTART != null}">

                <div id="upload-post">
                    <form action="MainController" method="POST">
                        <h2 class="label">UPLOAD A POST</h2>
                        <input type="text" name="txtTitle" value="${requestScope.TITLE}" style="font-size: 25px; margin: 15px; width: 895px" placeholder="Input you title here (Up to 100 letters)" maxlength="100"/>
                        <br/><font color='red' style="font-size: 25px; margin-left: 15px">${requestScope.TERR}</font><br/>
                        <textarea name="txtPost" rows="5" cols="65" style="font-size: 25px; margin-left: 15px" maxlength="1000" placeholder="Input the content . . . (Up to 1000 letters)">${requestScope.CONT}</textarea>
                        <br/><font color='red' style="font-size: 25px; margin-left: 15px ">${requestScope.CERR}</font><br/>
                        <input type="text" name="txtImage" value="" style="font-size: 25px; margin: 15px; margin-bottom: 20px; width: 895px" placeholder="Input a link of a photo you want to upload (Optional)" maxlength="1500"/>



                        <button name="action" class="nav-button" style="width: 150px" value="Post">Post</button> 
                        <button name="action" class="nav-button" style="width: 150px" value="WriteArticle">Cancel</button>

                    </form>

                </div>



            </c:if><br/><br/></div>









        <ul id="noti-list">

            <c:if test="${sessionScope.NOTIFICATION != null}">

                <c:if test="${not empty sessionScope.NOTIFICATION}" var="isNotEmpty">
                    <c:forEach items="${sessionScope.NOTIFICATION}" var="noti">
                        <c:if test="${noti.status eq 'read'}" var="isRead">
                            <li> <form action="MainController" method="POST">

                                    <button class="nav-button" type="submit" value="See Detail" name="action" id="noti-button-read">
                                        <input type="hidden" name="articleID" value="${noti.articleId}" />
                                        <input type="hidden" name="notiID" value="${noti.id}" />
                                        <input type="hidden" name="notiStt" value="${noti.status}" />
                                        ${noti.content}<br/>
                                        ${noti.notiTime}

                                    </button>
                                </form>
                            </li>
                        </c:if>
                        <c:if test="${!isRead}">
                            <li> <form action="MainController" method="POST">

                                    <button class="nav-button" type="submit" value="See Detail" name="action" id="noti-button-unread">
                                        <input type="hidden" name="articleID" value="${noti.articleId}" />
                                        <input type="hidden" name="notiID" value="${noti.id}" />
                                        <input type="hidden" name="notiStt" value="${noti.status}" />
                                        ${noti.content}<br/>
                                        ${noti.notiTime}

                                    </button>
                                </form>
                            </li>
                        </c:if>

                    </c:forEach>
                </c:if>

                <c:if test="${!isNotEmpty}">
                    <h3>You have no notification!</h3>
                </c:if>
            </c:if>
        </ul>


        <c:if test="${requestScope.ARLIST != null}">
            <c:if test="${not empty requestScope.ARLIST}" var="isNotEmpty">
                <div id="newfeed-area" >

                    <c:forEach items="${requestScope.ARLIST}" var="article">
                        <form action="MainController" method="POST" style="display: inline-block">

                            <button id="see-detail" value="See Detail" name="action">

                                <img src="${article.userImg}" width="100px" height="100px" style="margin-left: 15px" />
                                <div style="margin: 5px; padding: 5px">
                                    <h5>${article.title} </h5>
                                    ${article.fullName} <br/><br/>
                                    ${article.uploadDate}
                                    <input type="hidden" name="Searching" value="${param.txtSearch}" />
                                    <input type="hidden" name="articleID" value="${article.id}"/>
                                </div>
                            </button>
                        </form>
                    </c:forEach></div>
            <center>
                <c:if test="${requestScope.ISSEARCH eq 'OK'}" var="isSearch">
                    <c:forEach begin="1" end="${requestScope.PAGENUM}" step="1" varStatus="num">
                        <a href="MainController?action=GetPage&page=${num.count}&txtSearch=${param.txtSearch}" style="font-size: 2em">${num.count}</a>&nbsp;&nbsp;
                    </c:forEach></c:if>
                <c:if test="${!isSearch}">
                    <c:forEach begin="1" end="${requestScope.PAGENUM}" step="1" varStatus="num">
                        <a href="MainController?action=GetPage&page=${num.count}" id="page-num" style="font-size: 2em">${num.count}</a>&nbsp;&nbsp;
                    </c:forEach></center></c:if>
            </center>


    </c:if>
    <c:if test="${!isNotEmpty}">
        <h2>Your Newfeed Is Empty !</h2>
    </c:if>
</c:if>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
    <%@include file="js/popupconfirmation.js" %>
</script>
</body>


</html>
