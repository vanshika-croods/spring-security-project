<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>User Dashboard</title>

<!-- Custom fonts for this template-->
<link href="/assests/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/assests/css/sb-admin-2.min.css" rel="stylesheet">

<!--These jQuery libraries for 
           chosen need to be included-->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.4.2/chosen.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css"
	rel="stylesheet" />
<link
	href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css">
<link rel='stylesheet'
	href='https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.min.css'></link>
<style>
.edit-btn i, .del-btn i {
	font-size: 14px !important;
}

.edit-btn, .del-btn {
	height: 30px;
	width: 30px;
	padding: 3px;
	line-height: 24px;
	text-align: center;
}

.edit-btn {
	margin-right: 5px;
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 1px solid #e3e6f0;
	border-radius: .35rem;
	margin: 12px;
	padding: 7px;
}
</style>

<!--These jQuery libraries for select2 
  
            need to be included-->


</head>

<body id="page-top">

	<jsp:include page="header.jsp"></jsp:include>
	<!-- Content Wrapper -->
	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div id="content">
			<jsp:include page="nav.jsp"></jsp:include>


			<!-- Begin Page Content -->
			<div class="container-fluid">

				<!-- Page Heading -->
				<h1 class="h3 mb-4 text-gray-800 text-center">View User Details</h1>
				<!--view all the details of the support ticket here using datatable -->

				<div class="main-content" style="min-height: 530px;">
					<section class="section">
						<div class="section-body">
							<div class="row mt-sm-4">
								<div class="col-12 col-md-12 col-lg-4">
									<div class="card author-box">
										<div class="card-body">
											<div class="author-box-center text-center">
												<img alt="image" src="/assests/img/user-1.png"
													class="rounded-circle author-box-picture " height="100px"
													width="100px">
												<div class="clearfix"></div>
												<div class="author-box-name">
													<a href="#">${userlist.firstName}</a> <a href="#">${userlist.lastName}</a>
												</div>
												<div class="author-box-job">Web Developer</div>
											</div>
											<div class="text-center">
												<div class="author-box-description">
													<p>Lorem ipsum dolor sit amet, consectetur adipisicing
														elit. Pariatur voluptatum alias molestias minus quod
														dignissimos.</p>
												</div>
												<div class="mb-2 mt-3">
													<div class="text-small font-weight-bold">Follow Hasan
														On</div>
												</div>
												<a href="#" class="btn btn-social-icon mr-1 btn-facebook">
													<i class="fab fa-facebook-f"></i>
												</a> <a href="#" class="btn btn-social-icon mr-1 btn-twitter">
													<i class="fab fa-twitter"></i>
												</a> <a href="#" class="btn btn-social-icon mr-1 btn-github">
													<i class="fab fa-github"></i>
												</a> <a href="#" class="btn btn-social-icon mr-1 btn-instagram">
													<i class="fab fa-instagram"></i>
												</a>
												<div class="w-100 d-sm-none"></div>
											</div>
										</div>
									</div>
									<div class="card">
										<div class="card-header">
											<h4>Personal Details</h4>
										</div>
										<div class="card-body">
											<div class="py-4">
												<p class="clearfix">
													<span class="float-left"> FirstName</span> <span
														class="float-right text-muted">
														${userlist.firstName} </span>
												</p>
												<p class="clearfix">
													<span class="float-left"> LastName </span> <span
														class="float-right text-muted">
														${userlist.lastName} </span>
												</p>
												<p class="clearfix">
													<span class="float-left"> UserName</span> <span
														class="float-right text-muted">
														${userlist.userName} </span>
												</p>
												<p class="clearfix">
													<span class="float-left"> Facebook </span> <span
														class="float-right text-muted"> <a href="#">John
															Deo</a>
													</span>
												</p>
												<p class="clearfix">
													<span class="float-left"> Twitter </span> <span
														class="float-right text-muted"> <a href="#">@johndeo</a>
													</span>
												</p>
											</div>
										</div>

									</div>

								</div>
								<div class="col-12 col-md-12 col-lg-8">
									<div class="card">
										<div class="padding-20">
											<ul class="nav nav-tabs" id="myTab2" role="tablist">

												<li class="nav-item"><a class="nav-link active"
													id="profile-tab2" data-toggle="tab" href="#settings"
													role="tab" aria-selected="true">Setting</a></li>
											</ul>

											<div class="tab-pane fade active show" id="settings"
												role="tabpanel" aria-labelledby="profile-tab2">
												<form method="POST" action="saveDetails"
													class="needs-validation">
													<div class="card-header">
														<h4>Edit Profile</h4>
													</div>
													<div class="card-body">
														<div class="row">
															<div class="form-group col-md-6 col-12">
																<label>First Name</label> <input type="text"
																	class="form-control" name="firstName"
																	value="${userlist.firstName}">
																<div class="invalid-feedback">Please fill in the
																	first name</div>
															</div>
															<input type="hidden" value="${userlist.userId}"
																name="userId">
															<div class="form-group col-md-6 col-12">
																<label>Last Name</label> <input type="text"
																	class="form-control" name="lastName"
																	value="${userlist.lastName}">
																<div class="invalid-feedback">Please fill in the
																	last name</div>
															</div>
														</div>
														<div class="row">
															<div class="form-group col-md-7 col-12">
																<label>UserName</label> <input type="text" readonly="readonly"
																	class="form-control" name="userName" value="${userlist.userName}">
																<div class="invalid-feedback">Please fill in the
																	UserName</div>
															</div>
															<%-- <div class="form-group col-md-5 col-12">
																<label>Password</label> <input type="password" name="password"
																	class="form-control" value="${userlist.password}">
															</div> --%>
														</div>
													
	
													</div>

													
											</div>
											<div class="card-footer text-right">
												<button class="btn btn-primary">Save Changes</button>
											</div>
											</form>
										</div>

									</div>
								</div>

							</div>

						</div>
				</div>
			</div>
		</div>
		</section>



		<!-- End of Main Content -->
		<!-- start of Bootstrap Modal -->


		<!-- end of bootstrap modal -->
		<!-- Footer -->
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- End of Footer -->

	</div>
	<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">Ã</span>
					</button>
				</div>
				<div class="modal-body">Select "Logout" below if you are ready
					to end your current session.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">Cancel</button>
					<a class="btn btn-primary" href="login.html">Logout</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/assests/vendor/jquery/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script
		src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
	<script src="/assests/js/jquery.spring-friendly.js"></script>

	<script src="/assests/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/assests/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/assests/js/sb-admin-2.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.1/js/select2.min.js">
		
	</script>
	<script src="https://kit.fontawesome.com/9d7f96e3ec.js"
		crossorigin="anonymous"></script>

	<script src="/assests/dropzone-5.7.0/dist/dropzone.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script>


</body>

</html>