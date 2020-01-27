<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
	<title>Teachers</title>
    <!-- Reference Bootstrap files -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<%@ include file="include/header.jsp" %>
	
    <section>
        <div class="container" style="padding-top: 30px">
            <h2>Teachers</h2>
            <br>
            <ul>
                <li><a href="${pageContext.request.contextPath}/admin/teachers/register">Add Teacher</a></li>
            </ul>
            
			<table class="table table-striped">
			    <thead>
                    <tr>
                        <th scope="col">First Name</th>
                        <th scope="col">Last Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">College</th>
                        <th scope="col">URL</th>
                        <th scope="col">Action</th>
                    </tr>
			    </thead>
			    <tbody>
				<c:forEach var="teacher" items="${teachers}">
					<c:url var="updateUrl" value="${pageContext.request.contextPath}/admin/teachers/update">
						<c:param name="teacherId" value="${teacher.id}" />
					</c:url>
					<c:url var="deleteUrl" value="${pageContext.request.contextPath}/admin/teachers/delete">
						<c:param name="teacherId" value="${teacher.id}" />
					</c:url>
                    <tr>
                        <td>${teacher.firstName}</td>
                        <td>${teacher.lastName}</td>
                        <td>${teacher.login.email}</td>
                        <td>${teacher.college.title}</td>
                        <td>${teacher.url}</td>
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