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
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="notedetails?mode=SHOW_FORM"><i class="bi bi-house"></i>Home<span class="sr-only">(current)</span></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="addNotes.jsp"><i class="bi bi-file-plus"></i>Add Notes</a>
        </li>
     	 <li class="nav-item">
          <a class="nav-link" href="notedetails?mode=SHOW"><i class="bi bi-journal-bookmark"></i></i>Show Notes</a>
        </li>
      
      
      </ul>
        
      <form class="form-inline my-2 my-lg-0">
         <a href="" class="btn btn-light my-2 my-sm-0 mr-2" data-bs-toggle="modal" data-bs-target="#exampleModal" type="submit">${user.nickname }</a>
         <a href="index.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i class="bi bi-person-fill-add"></i>Logout</a>
      </form>
    </div>
  </div>
</nav>

<!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">User Profile</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">

		<div class="container text-center">
				<table class="table">
					<tbody>
						<tr>
							<th>Nickname</th>
							<td>${user.nickname }</td>
						</tr>
						
						<tr>
							<th>Full Name</th>
							<td>${user.name }</td>
						</tr>
						
						<tr>
							<th>Email</th>
							<td>${user.email }</td>
						</tr>
					</tbody>
				</table>
		</div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      
      </div>
    </div>
  </div>
</div>