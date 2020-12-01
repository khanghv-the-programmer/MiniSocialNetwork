<%-- 
    Document   : detail
    Created on : Sep 18, 2020, 6:00:51 PM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${requestScope.ARTICLE.fullName}'s Post</title>
        <style  type="text/css">
            <%@include file="style/navcss.css" %>
        </style>
        <style  type="text/css">
            <%@include file="style/detailcss.css" %>
        </style>
        <link href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />" rel="stylesheet">
    </head>


    <body>
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

        </div><br/><br/><br/><br/>

        <a href="MainController?action=GetPage"  id="previous">&laquo; Go Back</a> 
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
        </ul><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
        <c:if test="${requestScope.ARTICLE.status eq 'deleted'}" var="isDeleted">
        <center>
            <h1>This Article is no longer available ...</h1>
            <img src="https://pbs.twimg.com/media/DfmpVDIV4AERMth.jpg"/>
        </center>
    </c:if>
    <c:if test="${!isDeleted}">
        <c:if test="${sessionScope.DTO.role eq 'member'}">
            <div id="full">
                <div id="detail">
                    <div id="post">
                        <div id ="user-detail">
                            <img src="${requestScope.ARTICLE.userImg}" width="100px" height="100px" style=" border: black solid" />

                            <h4>${requestScope.ARTICLE.fullName} <br/><br/>
                                ${requestScope.ARTICLE.uploadDate}</h4>
                                <c:if test="${sessionScope.DTO.email eq requestScope.ARTICLE.username}">
                                <form action="MainController" method="POST" id="delete-form">
                                    <input type="hidden" name="articleID" value="${requestScope.ARTICLE.id}"/>
                                    <input type="hidden"  name="action" value="Delete"/>
                                    <button id="delete-button" type="submit"><i class="fa fa-trash"></i></button>
                                </form>


                            </c:if>

                        </div>
                        <div id="article-detail" >
                            <h3>${requestScope.ARTICLE.title}</h3>
                            <p>
                                ${requestScope.ARTICLE.description}
                            </p>
                            <div id="picture">
                                <c:if test="${not empty requestScope.ARTICLE.image}">
                                    <center>
                                        <img src="${requestScope.ARTICLE.image}" width="600px" height="600px" style="padding: 20px; border: black solid"/></center>
                                    </c:if>
                            </div>
                        </div>

                        <div id="reaction">
                            <form action="MainController" method="POST">
                                <input type="hidden" name="articleID" value="${requestScope.ARTICLE.id}" />
                                <h3 style="margin: 5px">
                                    <button class="nav-button" style="margin: 5px; padding: 5px; font-size: 1em; width: 200px; background-color: green"  value="like" name="action"><font color="white">${requestScope.LIKES} Like(s)     </font> 
                                        <input type="hidden" name="ownerID" value="${requestScope.ARTICLE.username}"/>
                                    </button> || <button name="action" class="nav-button" value="dislike" style="background-color: red;margin: 5px; padding: 5px; font-size: 1em; width: 200px; position: relative"> <font color="white">${requestScope.DISLIKES} Dislike(s)    </font> 
                                        <input type="hidden" name="ownerID" value="${requestScope.ARTICLE.username}"/>
                                    </button>
                                </h3>
                            </form>

                        </div>


                        <div onclick="popUpLike()" class="popup" style="margin-left: 55px; width: 200px"><font color="green">Who Like this?</font>
                            <span class="popuptext" id="myPopup">
                                <c:if test="${requestScope.LIKEP != null}">
                                    <c:if test="${not empty requestScope.LIKEP}" var="isNotEmpty">
                                        <c:forEach items="${requestScope.LIKEP}" var="likep">

                                            ${likep.fullName}<br/>

                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${!isNotEmpty}">
                                        No One!
                                    </c:if>


                                </c:if>
                            </span>
                        </div>
                        </button>   <div onclick="popUpDislike()" class="popup" style="margin-left: 55px; width: 200px"><font color="red">Who Dislike this?</font>
                            <span class="popuptext" id="myPopup1"> <c:if test="${requestScope.DISLIKEP != null}">
                                    <c:if test="${not empty requestScope.DISLIKEP}" var="isNotEmpty">
                                        <c:forEach items="${requestScope.DISLIKEP}" var="dislikep">

                                            ${dislikep.fullName}<br/>

                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${!isNotEmpty}">
                                        No One!
                                    </c:if>


                                </c:if>
                            </span></div>
                        <h3 style="margin: 5px">${requestScope.REACTION}</h3>
                    </div>
                    <p id="label">
                    <h2>Comments:</h2>
                    </p>
                    <div id="comment-list" >


                        <form action="MainController" method="POST">
                            <div id="comment-writer">
                                <form action="MainController" method="POST">
                                    <h2 style="width: 300px; border: black double; padding: 4px; padding-left: 25px; margin-left: 15px; margin-bottom: 40px">POST A COMMENT</h2>
                                    <c:if test="${requestScope.COMMENTLIST != null}">
                                        <c:if test="${not empty requestScope.COMMENTLIST}">
                                            <c:forEach items="${requestScope.COMMENTLIST}" var="comment">
                                                <input type="hidden" name="userEmails" value="${comment.email}" />

                                            </c:forEach>
                                        </c:if>
                                    </c:if>
                                    <input type="hidden" name="articleID" value="${requestScope.ARTICLE.id}"/>
                                    <input type="hidden" name="ownerID" value="${requestScope.ARTICLE.username}"/>
                                    <input type="hidden" name="ownerName" value="${requestScope.ARTICLE.fullName}"/>
                                    <textarea name="txtComment" rows="5" cols="65" style="font-size: 25px; margin-left: 15px" maxlength="1000" placeholder="Input your comment . . . (Up to 1000 letters)"></textarea>
                                    <br/><font color='red' style="font-size: 25px; margin-left: 15px ">${requestScope.CERR}</font><br/>
                                    <input type="hidden" name="articleID" value="${requestScope.ARTICLE.id}" />



                                    <button name="action" class="nav-button" style="width: 300px; font-size: 25px; margin-left: 15px" value="Comment">Upload Comment</button> 

                                </form>

                            </div>
                        </form>

                        <c:if test="${requestScope.COMMENTLIST != null}">
                            <c:if test="${not empty requestScope.COMMENTLIST}" var="isNotEmpty">
                                <c:forEach items="${requestScope.COMMENTLIST}" var="comment">
                                    <div class="comment">
                                        <div id="commentor">
                                            <img src="${comment.userImg}" width="50px" height="50px" style=" border: black solid" />
                                            <h4>${comment.fullName} <br/><br/>
                                                ${comment.uploadDate}</h4>
                                                <c:if test="${sessionScope.DTO.email eq comment.email}">
                                                <form action="MainController" method="POST" class="delete-comment-form">
                                                    <input type="hidden" name="commentID" value="${comment.commentID}"/>
                                                    <input type="hidden" name="articleID" value="${requestScope.ARTICLE.id}"/>
                                                    <input type="hidden" name="ownerID" value="${requestScope.ARTICLE.username}"/>
                                                    <input type="hidden"  name="action" value="Delete Comment"/>
                                                    <button class="delete-comment-button" type="submit"><i class="fa fa-trash"></i></button>
                                                </form>
                                            </c:if>
                                            <p style="font-size: 18px">
                                                ${comment.content}
                                            </p>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${!isNotEmpty}">
                                <h2>This post doesn't have any comments, be the first person to comment!</h2>
                            </c:if>
                        </c:if>

                    </div>
                </div>
            </div>
        </c:if>















        <c:if test="${sessionScope.DTO.role eq 'admin'}">


            <div id="full">
                <div id="detail">
                    <div id="post" style="border: black solid; padding: 10px">
                        <div id ="user-detail">
                            <img src="${requestScope.ARTICLE.userImg}" width="100px" height="100px" style=" border: black solid" />

                            <h4>${requestScope.ARTICLE.fullName} <br/><br/>
                                ${requestScope.ARTICLE.uploadDate}</h4>

                            <form action="MainController" method="POST" id="delete-form">
                                <input type="hidden" name="articleID" value="${requestScope.ARTICLE.id}"/>
                                <input type="hidden"  name="action" value="Delete"/>
                                <input type="hidden" name="articleID" value="${requestScope.ARTICLE.id}"/>
                                <input type="hidden" name="ownerID" value="${requestScope.ARTICLE.username}"/>
                                <button id="delete-button" type="submit"><i class="fa fa-trash"></i></button>
                            </form>


                        </div>
                        <div id="article-detail">
                            <h3>${requestScope.ARTICLE.title}</h3>
                            <p>
                                ${requestScope.ARTICLE.description}
                            </p>
                            <div id="picture">
                                <c:if test="${not empty requestScope.ARTICLE.image}">
                                    <center>
                                        <img src="${requestScope.ARTICLE.image}" width="600px" height="600px" style="padding: 20px; border: black solid"/></center>
                                    </c:if>
                            </div>
                        </div>

                        <div id="reaction" >
                            <form action="MainController" method="POST">
                                <input type="hidden" name="articleID" value="${requestScope.ARTICLE.id}" />
                                <h3 style="margin: 5px">
                                    <button style="margin: 5px; padding: 5px; font-size: 1em; width: 200px" value="like" name="action" disabled="true"><font color="green">${requestScope.LIKES} Likes     </font> </button> || <button name="action" disabled="true" value="dislike" style="margin: 5px; padding: 5px; font-size: 1em; width: 200px; position: relative"> <font color="red">${requestScope.DISLIKES} Dislikes    </font> </button>
                                </h3>
                            </form>
                        </div>
                        <div onclick="popUpLike()" class="popup" style="margin-left: 55px; width: 200px"><font color="green">Who Like this?</font>
                            <span class="popuptext" id="myPopup">
                                <c:if test="${requestScope.LIKEP != null}">
                                    <c:if test="${not empty requestScope.LIKEP}" var="isNotEmpty">
                                        <c:forEach items="${requestScope.LIKEP}" var="likep">

                                            ${likep.fullName}<br/>

                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${!isNotEmpty}">
                                        No One!
                                    </c:if>


                                </c:if>
                            </span>
                        </div>
                        </button>   <div onclick="popUpDislike()" class="popup" style="margin-left: 55px; width: 200px"><font color="red">Who Dislike this?</font>
                            <span class="popuptext" id="myPopup1"> <c:if test="${requestScope.DISLIKEP != null}">
                                    <c:if test="${not empty requestScope.DISLIKEP}" var="isNotEmpty">
                                        <c:forEach items="${requestScope.DISLIKEP}" var="dislikep">

                                            ${dislikep.fullName}<br/>

                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${!isNotEmpty}">
                                        No One!
                                    </c:if>


                                </c:if>
                            </span></div>
                        <h3 style="margin: 5px">${requestScope.REACTION}</h3>
                    </div>
                    <p id="label">
                    <h2>Comments:</h2>
                    </p>
                    <div id="comment-list">
                        <c:if test="${requestScope.COMMENTLIST != null}">
                            <c:if test="${not empty requestScope.COMMENTLIST}" var="isNotEmpty">
                                <c:forEach items="${requestScope.COMMENTLIST}" var="comment">
                                    <div class="comment">
                                        <div id="commentor">
                                            <img src="${comment.userImg}" width="50px" height="50px" style=" border: black solid" />
                                            <h4>${comment.fullName} <br/><br/>
                                                ${comment.uploadDate}</h4>
                                            <form action="MainController" method="POST" class="delete-comment-form">
                                                <input type="hidden" name="commentID" value="${comment.commentID}"/>
                                                <input type="hidden" name="articleID" value="${requestScope.ARTICLE.id}"/>
                                                <input type="hidden" name="ownerID" value="${comment.email}"/>
                                                <input type="hidden"  name="action" value="Delete Comment"/>
                                                <button class="delete-comment-button" type="submit"><i class="fa fa-trash"></i></button>
                                            </form>
                                            <p style="font-size: 18px">
                                                ${comment.content}
                                            </p>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:if>
                            <c:if test="${!isNotEmpty}">
                                <h2>This post doesn't have any comments, be the first person to comment!</h2>
                            </c:if>
                        </c:if>

                    </div>
                </div>
            </div>
        </c:if>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
        <script>
            <%@include file="js/popupconfirmation.js" %>
        </script>
    </c:if>
</body>
</html>
