<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.background{
width: 100%;
height: 665px;
background: pink;

}

</style>
<%@include file="common/allcss.jsp" %>
<title>Start Page</title>
</head>
<body>
<c:import url="common/navbar.jsp" />

<div class="container-fluid background">
<div class="text-center">
<h1>E Notes-Save Your Notes</h1>
<a href="login.jsp" class="btn btn-light"><i class="bi bi-box-arrow-in-right"></i>Login</a>
<a href="register.jsp" class="btn btn-light"><i class="bi bi-person-fill-add"></i>Register</a>
</div>
</div>

	<%@include file="common/footer.jsp" %>
</body>
</html>