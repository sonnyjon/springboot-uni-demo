<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Register Course</title>
    <!-- Reference Bootstrap files -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<%@ include file="include/header.jsp" %>

    <section>    
        <div class="container" style="padding-top: 30px">
            <h3>My Courses</h3>
            <br>
			<table class="table table-striped">
			    <thead>
                    <tr>
                        <th scope="col">Title</th>
                        <th scope="col">Major</th>
                        <th scope="col">College</th>
                        <th scope="col">Teacher</th>
                        <th scope="col"></th>
                    </tr>
			    </thead>
			    <tbody>
				<c:forEach var="course" items="${myCourses}">
					<c:url var="unregisterUrl" value="${pageContext.request.contextPath}/student/${student.id}/courses/u/${course.id}" />
                    <tr>
                        <th scope="row">${course.title}</th>
                        <td>${course.major.title}</td>
                        <td>${course.major.college.title}</td>
                        <td>${course.teacher.fullName}</td>
                        <td><a href="${unregisterUrl}">Unregister</a></td>
                    </tr>
				</c:forEach>
			    </tbody>
			</table>
       
        </div>    
    </section>        

    <section>    
        <div class="container" style="padding-top: 50px">
            <h3>Available Courses</h3>
            <br>
			<table class="table table-striped">
			    <thead>
                    <tr>
                        <th scope="col">Title</th>
                        <th scope="col">Major</th>
                        <th scope="col">College</th>
                        <th scope="col">Teacher</th>
                        <th scope="col"></th>
                    </tr>
			    </thead>
			    <tbody>
				<c:forEach var="course" items="${notMyCourses}">
					<c:url var="registerUrl" value="${pageContext.request.contextPath}/student/${student.id}/courses/r/${course.id}"/>
                    <tr>
                        <th scope="row">${course.title}</th>
                        <td>${course.major.title}</td>
                        <td>${course.major.college.title}</td>
                        <td>${course.teacher.fullName}</td>
                        <td><a href="${registerUrl}">Register</a></td>
                    </tr>
				</c:forEach>
			    </tbody>
			</table>
       
        </div>    
    </section>        
    	
<%@ include file="include/footer-scripts.jsp" %>
</body>
</html>