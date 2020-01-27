<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
	<title>Access Denied</title>
    <!-- Reference Bootstrap files -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>
<%@ include file="include/header.jsp" %>

	<section>
		<div class="container" style="padding-top: 30px">
			<h2>Access Denied - You are not authorized to access this resource.</h2>
			<hr>
			<a href="${pageContext.request.contextPath}/">Back to Home Page</a>
		</div>
	</section>

<%@ include file="include/footer-scripts.jsp" %>
</body>
</html>