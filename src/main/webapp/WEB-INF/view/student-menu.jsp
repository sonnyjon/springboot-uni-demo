<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>My Menu</title>
    <!-- Reference Bootstrap files -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<%@ include file="include/header.jsp" %>

    <section>
        <div class="container" style="padding-top: 30px">
            <h2>Student Menu</h2>
            <br>
            <ul>
			    <li><a href="${pageContext.request.contextPath}/student/${studentId}/courses">Register Course</a></li>
            </ul>			
        </div>
    </section>

    <section>    
        <div class="container" style="padding-top: 30px">
            <h3>Courses</h3>
            <br>
			<table class="table table-striped">
			    <thead>
                    <tr>
                        <th scope="col">Title</th>
                        <th scope="col">Major</th>
                        <th scope="col">College</th>
                        <th scope="col">Teacher</th>
                    </tr>
			    </thead>
			    <tbody>
				<c:forEach var="course" items="${courses}">
                    <tr>
                        <th scope="row">${course.title}</th>
                        <td>${course.major.title}</td>
                        <td>${course.major.college.title}</td>
                        <td>${course.teacher.fullName}</td>
                    </tr>
				</c:forEach>
			    </tbody>
			</table>
       
        </div>    
    </section>    
    	
<%@ include file="include/footer-scripts.jsp" %>
</body>
</html>