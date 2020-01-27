<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
	<title>Update Teacher</title>
    <!-- Reference Bootstrap files -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<%@ include file="include/header.jsp" %>

    <section>
        <div class="container" style="padding-top: 30px">
            <h2>Update Teacher</h2>
            <br>
            <form:form action="${pageContext.request.contextPath}/admin/teachers/update" modelAttribute="teacher" method="POST">
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
                    <label for="college">College</label>
                    <form:select path="college" id="college" class="form-control" items="${colleges}" itemValue="id" itemLabel="title" />
                </div>
                <div class="form-group">
                    <label for="url">URL</label>
                    <form:input path="url" id="password" class="form-control"/>
                </div>
                <div class="form-group">
                    <label><b>Email:</b></label> ${teacher.login.email}
                </div>
                <button type="submit" class="btn btn-primary">Save</button>
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/teachers" role="button">Cancel</a>
            </form:form>
        </div>
    </section>

<%@ include file="include/footer-scripts.jsp" %>
</body>
</html>