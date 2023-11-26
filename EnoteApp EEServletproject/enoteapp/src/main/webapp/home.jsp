<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>

<title>Home</title>
<%@include file="common/allcss.jsp"%>
</head>
<body>


<div class="container-fluid p-0">
<c:import url="common/homenav.jsp" />
<div class="card py-5">
<div class="card-body text-center">
<img alt="" src="img/book.png" class="img-fluid mx-auto" style="max-width: 300px;">
<h1>Start Taking Notes</h1>
<a href="addNotes.jsp" class="btn btn-outline-primary">Start Here</a>

</div>

</div>
</div>


</body>
</html>