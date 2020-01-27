<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
	<title>Admin Menu Page</title>
    <!-- Reference Bootstrap files -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<%@ include file="include/header.jsp" %>

    <section>
        <div class="container" style="padding-top: 30px">
	        <h2>Admin Menu Page</h2>
            <br>
            <ul>
                <li><a href="${pageContext.request.contextPath}/admin/colleges">College Maintenance</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/majors">Major Maintenance</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/courses">Course Maintenance</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/teachers">Add/Update Teacher</a></li>
                <li><a href="${pageContext.request.contextPath}/admin/students">Add/Update Student</a></li>
            </ul>	
        </div>
    </section>
	
<%@ include file="include/footer-scripts.jsp" %>
</body>
</html>