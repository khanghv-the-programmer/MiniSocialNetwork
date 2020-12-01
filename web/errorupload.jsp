<%-- 
    Document   : errorupload
    Created on : Sep 19, 2020, 4:48:23 PM
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
        <title>Error Page</title>
        <style><%@include file="style/style.css" %></style>
    </head>
    <body>
    <font color='red'>
         
        <font color='red'>
        
        
        
        <section class="w3l-login-6">
		<div class="login-hny">
			<div class="form-content">
				<div class="form-right">
					<div class="overlay">
						<div class="grid-info-form">
							<h5>Warningg!</h5>
							<h3>ERROR PAGE
                                                            </h3>							
							<a href="ArticleLoadingController" class="read-more-1 btn">GO BACK TO NEWFEED</a>
						</div>
					
					</div>
				</div>
				<div class="form-left">
					<div class="middle">
                                            <h4 style="color: red">ERROR</h4>
						
					</div>
					
					<h2>${requestScope.ERROR}</h2>
				</div>
				
                                    
					 
			</div>
			
		</div>
        
    </body>
</html>
