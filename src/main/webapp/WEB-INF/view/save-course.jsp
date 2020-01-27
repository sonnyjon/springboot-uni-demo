<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
	<title>Add/Update Course</title>
    <!-- Reference Bootstrap files -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<%@ include file="include/header.jsp" %>

    <section>
        <div class="container" style="padding-top: 30px">
            <h2>Add/Update Course</h2>
            <br>
            <h4>College: ${college}</h4>
            <br>
		    <form:form action="${pageContext.request.contextPath}/admin/courses/save" modelAttribute="course" method="POST">
		    <form:hidden path="id"/>
                <div class="form-group">
                    <label for="courseTitle">Course Title:</label>
                    <form:input path="title" id="courseTitle" class="form-control"/>
                </div>
                <div class="form-group">
                    <label for="major">Major:</label>
                    <form:select path="major" 
                                id="major" 
                                class="form-control" 
                                items="${majors}" 
                                itemValue="id" 
                                itemLabel="title" />
                </div>
                <div class="form-group">
                    <label for="teacher">Teacher:</label>
                    <form:select path="teacher" 
                                id="teacher" 
                                class="form-control"
                                items="${teachers}" 
                                itemValue="id" 
                                itemLabel="fullName" />
                </div>
                <button type="submit" class="btn btn-primary">Save</button>
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/admin/courses" role="button">Cancel</a>
            </form:form>
        </div>
    </section>
	
<%@ include file="include/footer-scripts.jsp" %>
</body>
</html>