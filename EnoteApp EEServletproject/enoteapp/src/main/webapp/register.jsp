<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib uri="jakarta.tags.functions" prefix="fn"%>
<%@ taglib uri="jakarta.tags.fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="common/allcss.jsp"%>
<title>Register Page</title>
</head>
<body>

<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">

				<div class="card mt-4">
					<div class="card-header text-center text-white bg-custom">

						<h4>
							<i class="bi bi-person-fill-add bi-3x"></i> Registration
						</h4>
					</div>
					<div class="card-body">
					
					<form action="user" method="post">
					 
					  <c:if test="${not empty success and success }">
                        	<p class="text-success"> Account is registered!<a href="login.jsp"><i class="bi bi-box-arrow-in-right"></i></a></p>
                        </c:if>
                        	
                        <c:if test="${not empty success and not success }">
                        	<p class="text-danger"> Account registration is failed!</p>
                        </c:if>
                        
						 <input type="hidden" name="mode" value="REGISTER">
							<div class="form-group">
								<label>Enter Full Name</label> 
								<input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" name="name">
								</div>
							<div class="form-group">
								<label>Enter Nickname</label> 
								<input type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" name="nickname">
								</div>	
							<div class="form-group">
								<label>Enter Email</label>
								<input type="email" class="form-control"
									id="exampleInputPassword1" name="email">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Enter Password</label>
								<input type="password" class="form-control" id="exampleInputPassword1" name="password">
							</div>
							<p></p>
							<button type="submit" class="btn btn-primary badge-pill btn-block">Register</button>
						</form>
						  <hr class="mt-4">
                    		<div class="col-12">
                        <p class="text-center mb-0">Already have an account? <a href="login">Login</a></p>
                    </div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="common/footer.jsp" />
</body>
</html>