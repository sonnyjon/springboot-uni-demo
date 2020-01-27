<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
	<title>Students</title>
    <!-- Reference Bootstrap files -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<%@ include file="include/header.jsp" %>

    <section>
        <div class="container" style="padding-top: 30px">
            <h2>Students</h2>
            <br>
            <ul>
    			<li><a href="${pageContext.request.contextPath}/admin/students/register">Add Student</a></li>
            </ul>
            
			<table class="table table-striped">
			    <thead>
                    <tr>
                        <th scope="col">First Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Major</th>
                        <th scope="col">Grade</th>
                        <th scope="col">Action</th>
                    </tr>
			    </thead>
			    <tbody>
				<c:forEach var="student" items="${students}">
					<c:url var="updateUrl" value="${pageContext.request.contextPath}/admin/students/update">
						<c:param name="studentId" value="${student.id}" />
					</c:url>
					<c:url var="deleteUrl" value="${pageContext.request.contextPath}/admin/students/delete">
						<c:param name="studentId" value="${student.id}" />
					</c:url>
                    <tr>
                        <td>${student.firstName}</td>
                        <td>${student.lastName}</td>
                        <td>${student.login.email}</td>
                        <td>${student.major.title}</td>
                        <td>${student.gradeLevel}</td>
                        <td>
                            <a href="${updateUrl}">Update</a> |						
                            <a href="${deleteUrl}">Delete</a>
                        </td>
                    </tr>
				</c:forEach>
			    </tbody>
			</table>
       
        </div>
    </section>

<%@ include file="include/footer-scripts.jsp" %>
</body>
</html>