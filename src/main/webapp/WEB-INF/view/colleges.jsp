<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
	<title>College Maintenance</title>
    <!-- Reference Bootstrap files -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<%@ include file="include/header.jsp" %>

    <section>
        <div class="container" style="padding-top: 30px">
            <h2>College Maintenance</h2>
            <div style="padding-top: 30px">
		        <form:form action="${pageContext.request.contextPath}/admin/colleges/save" modelAttribute="college" method="POST">
			        <form:hidden path="id"/>
                    <div class="input-group mb-3">
                        <form:input path="title" class="form-control" placeholder="College Title" aria-label="College Title" aria-describedby="button-addon2" />
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="submit" id="button-addon2">Save</button>
                        </div>
                    </div>
		        </form:form>
            </div>
        </div>
    </section>

    <section>
        <div class="container" style="padding-top: 30px">
        
			<table class="table table-striped">
			    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">College</th>
                        <th scope="col">Action</th>
                    </tr>
			    </thead>
			    <tbody>
                    <c:forEach var="college" items="${colleges}">
                    <c:url var="updateUrl" value="${pageContext.request.contextPath}/admin/colleges/update">
                        <c:param name="collegeId" value="${college.id}" />
                    </c:url>
                    <c:url var="deleteUrl" value="${pageContext.request.contextPath}/admin/colleges/delete">
                        <c:param name="collegeId" value="${college.id}" />
                    </c:url>
                    <tr>
                        <th scope="row">${college.id}</th>
                        <td>${college.title}</td>
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