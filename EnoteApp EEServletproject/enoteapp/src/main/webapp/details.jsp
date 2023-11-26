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
<title>Details page</title>
</head>
<body>
	<c:import url="common/homenav.jsp" />

	<div class="container-fluid bg-light text-center">

		<section id="details" class="mt5">
			<h2>More Details</h2>
			<div class="container-lg align-items-center justify-content-center">



				<div class="">
					<div class="card mb-3 center">
						<div class="card-body text-center">
							<c:url var="updateLink" value="notedetails">
								<c:param name="mode" value="LOAD"></c:param>
								<c:param name="id" value="${singleNote.id }"></c:param>
							</c:url>

							<c:url var="deleteLink" value="notedetails">
								<c:param name="mode" value="DELETE"></c:param>
								<c:param name="id" value="${singleNote.id }"></c:param>
							</c:url>
							<div class="card mb-3 justify-content-center align-items-center">
								<h3 class="card-title">${singleNote.title }</h3>
								<p class="card-text">${singleNote.content }</p>
								<p>
									<b class="text-success">Published Date: ${singleNote.date }
									</b></br> <b class="text-primary"></b>
								</p>
								<p>
									<b class="text-primary">Published By: ${user.name } </b></br> <b
										class="text-primary"></b>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container text-center mt-2">
				<a href="${updateLink }" class="btn btn-danger">Edit</a> <a
					href="${deleteLink }" class="btn btn-primary">Delete</a>
			</div>
		</section>

	</div>





</body>
</html>