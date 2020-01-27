<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
	<title>Major Maintenance</title>
    <!-- Reference Bootstrap files -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<%@ include file="include/header.jsp" %>

    <section>
        <div class="container" style="padding-top: 30px">
            <h2>Major Maintenance</h2>
            <div style="padding-top: 30px">
		        <form:form action="${pageContext.request.contextPath}/admin/majors/save" modelAttribute="major" method="POST">
			    <form:hidden path="id"/>
                    <div class="input-group mb-3">
                        <form:input path="title" class="form-control" placeholder="Major Title" aria-label="Major Title" aria-describedby="button-addon2"/>
                        <form:select path="college" items="${colleges}" itemValue="id" itemLabel="title"
                                    class="custom-select" />
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
                        <th scope="col">Major</th>
                        <th scope="col">College</th>
                        <th scope="col">Action</th>
                    </tr>
			    </thead>
			    <tbody>
                    <c:forEach var="major" items="${majors}">
                    <c:url var="updateUrl" value="${pageContext.request.contextPath}/admin/majors/update">
                        <c:param name="majorId" value="${major.id}" />
                    </c:url>
                    <c:url var="deleteUrl" value="${pageContext.request.contextPath}/admin/majors/delete">
                        <c:param name="majorId" value="${major.id}" />
                    </c:url>
                    <tr>
                        <th scope="row">${major.title}</th>
                        <td>${major.college.title}</td>
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