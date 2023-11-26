<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/allcss.jsp"%>
<title>Login Page</title>
</head>
<body>

	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">

				<div class="card mt-4">
					<div class="card-header text-center text-white bg-custom">

						<h4>
							<i class="bi bi-box-arrow-in-right"></i> Login
						</h4>
					</div>
					<div class="card-body">
					<form action="login" method="post">
					 <c:if test="${not empty success and not success }">
                        	<p class="text-danger"> username or password is incorrect</p>
                        </c:if>
                        
                        <input type="hidden" name="mode" value="LOGIN">		
							<div class="form-group">
								<label>Enter Username</label>
								<input type="text" name="username"  class="form-control"
									id="exampleInputPassword1" placeholder="Username">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password</label>
								<input type="password" name="password"  class="form-control" id="exampleInputPassword1"  placeholder="Password">
							</div>
							<p></p>
							<button type="submit" class="btn btn-primary btn-block">Log in</button>
						</form>
						<hr class="mt-4">
                    <div class="col-12">
                        <p class="text-center mb-0">Have not account yet? <a href="user">Register</a></p>
                    </div>
					</div>
				</div>
			</div>
		</div>

	</div>
	<c:import url="common/footer.jsp" />
</body>
</html>