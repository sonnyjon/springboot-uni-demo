<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
	<title>SJ University Home</title>
    <!-- Reference Bootstrap files -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<%@ include file="include/header.jsp" %>

    <section>
        <div class="container" style="padding-top: 30px">
            <h4>Menu</h4>
            <security:authorize access="hasRole('ADMIN')">
                <p><a href="${pageContext.request.contextPath}/admin">Admin Menu</a></p>
            </security:authorize>
            
            <security:authorize access="hasRole('STUDENT')">
	            <p><a href="${pageContext.request.contextPath}/student">Student Menu</a></p>
	        </security:authorize>
        </div>
    </section>

<%@ include file="include/footer-scripts.jsp" %>
</body>
</html>