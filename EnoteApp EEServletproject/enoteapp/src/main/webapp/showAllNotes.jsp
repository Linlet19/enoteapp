<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="common/allcss.jsp"%>
<title>Show All Notes</title>
</head>
<body>
<c:import url="common/homenav.jsp" />
	<section id="card-holder">
		
		<div class="container">
	<h2 class="text-center">All Notes:</h2>
	
	<div class="row">
		
		<c:forEach var="note" items="${allNotes }">
		<c:url var="detailsLink" value="notedetails">
			<c:param name="mode" value="SINGLE"></c:param>
			<c:param name="id" value="${note.id }"></c:param>
		</c:url> 
		
	
		<div class="card mt-3">
		
			<div class="card-body p-4">
				<h5 class="card-title">${note.title }</h5>
				<p>${ fn:length(note.content) gt 100 ? fn:substring(note.content,0,100) : note.content } <b class="text-secondary">...see more in MoreDetails</b></p>
				<p>
				
				</p>
				<p>
					<b class="text-success">Published Date: ${note.date } </b></br>
					<b class="text-primary">Published By: ${user.name }</b>
				</p>
				
				<div class="container text-center mt-2">
					<a href="${detailsLink }" class="btn btn-info">MoreDetails</a>
				</div>	
			</div>
		
		</div>
		</c:forEach>
	</div>
	
	</div>
	</section>
</body>
</html>