<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
	<title>Update Student</title>
    <!-- Reference Bootstrap files -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<%@ include file="include/header.jsp" %>

    <section>
        <div class="container" style="padding-top: 30px">
            <h2>Update Student</h2>
            <br>
            <form:form action="${pageContext.request.contextPath}/admin/students/update" modelAttribute="student" method="POST">
            <form:hidden path="id" />
                <div class="form-group">
                    <label for="firstName">First Name</label>
					<form:input path="firstName" id="firstName" class="form-control"/>
                </div>
                <div class="form-group">
                    <label for="lastName">Last Name</label>
					<form:input path="lastName" id="lastName" class="form-control"/>
                </div>
                <div class="form-group">
                    <label for="major">Major</label>
					<form:select path="major" id="major" class="form-control" items="${majors}" itemValue="id" itemLabel="title" />
                </div>
                <div class="form-group">
                    <label for="gradeLevel">Grade Level</label>
					<form:input type="number" path="gradeLevel" id="gradeLevel" class="form-control"/>
                </div>
                <div class="form-group">
                    <label><b>Email:</b></label> ${student.login.email}
                </div>
                <button type="submit" class="btn btn-primary">Save</button>
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/students" role="button">Cancel</a>
            </form:form>
        </div>
    </section>
    
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	

<%@ include file="include/footer-scripts.jsp" %>
</body>
</html>