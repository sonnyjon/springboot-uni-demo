<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
	<title>Courses</title>
    <!-- Reference Bootstrap files -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<%@ include file="include/header.jsp" %>
	
    <section>
        <div class="container" style="padding-top: 30px">
            <h2>Course Maintenance</h2>
            <br>
            <h3>Add course for:</h3>
            <ul>
                <c:forEach var="college" items="${colleges}">
                    <c:url var="addUrl" value="${pageContext.request.contextPath}/admin/courses/add" >
                        <c:param name="collegeId" value="${college.id}" />
                    </c:url>
                <li><a href="${addUrl}">${college.title}</a></li>
                </c:forEach>
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
                        <th scope="col">Action</th>
                    </tr>
			    </thead>
			    <tbody>
    				<c:forEach var="course" items="${courses}">
	    				<c:url var="updateUrl" value="${pageContext.request.contextPath}/admin/courses/update">
		    				<c:param name="courseId" value="${course.id}" />
			    		</c:url>
				    	<c:url var="deleteUrl" value="${pageContext.request.contextPath}/admin/courses/delete">
					    	<c:param name="courseId" value="${course.id}" />
					    </c:url>
                    <tr>
                        <th scope="row">${course.title}</th>
                        <td>${course.major.title}</td>
                        <td>${course.major.college.title}</td>
                        <td>${course.teacher.fullName}</td>
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