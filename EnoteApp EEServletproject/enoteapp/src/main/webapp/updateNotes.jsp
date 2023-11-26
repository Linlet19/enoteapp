<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit notes</title>
<%@include file="common/allcss.jsp"%>
</head>
<body>

	<c:import url="common/homenav.jsp" />
	
	<div class="container-fluid p-0">
		<h1 class="text-center">Edit Your Notes</h1>

		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="notedetails" method="post" class="row g-3">

						 <c:if test="${not empty success and success }">
							<p class="text-success">Note is edited!</p>
						</c:if>

						<c:if test="${not empty success and not success }">
							<p class="text-danger">Note editing is failed!</p>
						</c:if>


						<input type="hidden" name="mode" value="UPDATE">
						<input type="hidden" name="id" value="${load.id }">
						
						
						 <div class="col-12">
                            <label>Title</label>

                            <div class="input-group">
                                <span class="input-group-text">
                                    T
                                </span>
                                <input type="text" name="title" value="${load.title }" class="form-control" placeholder="Title" required="required">
                            </div>
                        </div>
                        
                        
                         <div class="col-12">
							<textarea rows="12" name="content" value="" class="form-control" required="required">${load.content }</textarea>
                         
                        </div>
                        
                        <div class="container text-center">
							<button type="submit" class="btn btn-primary">Edit Notes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>
</html>