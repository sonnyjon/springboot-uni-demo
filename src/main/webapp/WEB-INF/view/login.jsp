<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>	
	<title>Login Page</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<!-- Reference Bootstrap files -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body style="background: #335379;">
    <section>
        <div class="container" align="center" style="margin-top: 50px;">
            <span style="color:white"><h1>SJ University</h1></span>
        </div>
    </section>

    <section>
        <div class="container">        
		    <div id="loginbox" class="mainbox col-md-6 offset-md-3" style="padding-top: 30px">
			
			    <div class="card">
					<h4 class="card-header">Log In</h4>
				    <div class="card-body" style="padding-top: 30px">
                        <!-- Login Form -->
                        <form action="${pageContext.request.contextPath}/authenticateUser" method="POST" class="form-horizontal">
                            <!-- Place for messages: error, alert etc ... -->
                            <div class="form-group">
                                <div class="col-xs-15">
                                    <div>
                                    <!-- Check for login error -->
                                    <c:if test="${param.error != null}">																				            
                                        <div class="alert alert-danger col-xs-offset-1 col-xs-10">
                                            Invalid email and password.
                                        </div>
                                    </c:if>									
                                    <!-- Check for logout -->		            
                                    <c:if test="${param.logout != null}">																				            
                                        <div class="alert alert-success col-xs-offset-1 col-xs-10">
                                            You have been logged out.
                                        </div>
                                    </c:if>								   
                                    </div>
                                </div>
                            </div>
                            <!-- User name -->
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> 						
                                <input type="text" name="username" placeholder="email" class="form-control">
                            </div>
                            <!-- Password -->
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span> 							
                                <input type="password" name="password" placeholder="password" class="form-control" >
                            </div>
                            <!-- Login/Submit Button -->
                            <div style="margin-top: 10px" class="form-group">						
                                <div class="col-sm-6 controls">
                                    <button type="submit" class="btn btn-primary">Login</button>
                                </div>
                            </div>						
                            <!-- I'm manually adding tokens -->
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        </form>
				    </div>
			    </div>

		    </div>                   
        </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>