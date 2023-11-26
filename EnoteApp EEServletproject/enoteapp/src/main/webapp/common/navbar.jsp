<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="jakarta.tags.functions" prefix="fn" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><i class="bi bi-journals"></i>ENotes App</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
       
      
      
      </ul>
      <form class="form-inline my-2 my-lg-0">
         <a href="login?mode=LOGIN_FORM" class="btn btn-light my-2 my-sm-0 mr-2" type="submit"><i class="bi bi-box-arrow-in-right"></i>Login</a>
         <a href="login?mode=REGISTER" class="btn btn-light my-2 my-sm-0" type="submit"><i class="bi bi-person-fill-add"></i>Register</a>
      </form>
    </div>
  </div>
</nav>