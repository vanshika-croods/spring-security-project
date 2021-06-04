<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<link href="/assests/formvalidation/formValidation.min.css"
	rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" 
	rel="stylesheet">

<title>Hello, world!</title>
</head>
<body data-submit="#selector" data-cancel="#cancel_sales">
	<h1 class="text-center">Student Registration</h1>
	<button type="button" class="mr-sm-5 btn btn-primary"
		style="float: right; margin-right: 100px;" data-bs-toggle="modal"
		data-bs-target="#exampleModal" data-bs-whatever="@mdo">Click
		here</button>
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Student Form</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="registerstudent" method="POST" id="Modalform">
						<div class="mb-3 form-group">
							<label for="first-name" class="col-form-label">FirstName:</label>
							<input type="text" class="form-control" id="firstName"
								name="firstName">
						</div>
						<div class="mb-3 form-group">
							<label for="message-text" class="col-form-label">LastName:</label>
							<input type="text" class="form-control" id="lastName"
								name="lastName">
						</div>
						<div class="mb-3 form-group">
							<label for="message-text" class="col-form-label">Email:</label> <input
								type="email" class="form-control" id="email" name="email">
						</div>
						<div class="mb-3 form-group">
							<label for="message-text" class="col-form-label">Password:</label>
							<input type="text" class="form-control" id="password"
								name="password">
						</div>
						<div class="mb-3 form-group">
							<label for="message-text" class="col-form-label">Mobile
								No:</label> <input type="text" class="form-control" id="mobileNo"
								name="mobileNo">
						</div>
						<div class="mb-3 form-group">
							<label for="message-text" class="col-form-label">Age:</label> <input
								type="text" class="form-control" id="age" name="age">
						</div>
					<button type="submit" class="btn btn-primary" id="selector">Submit</button>

					</form>
				</div>

			</div>
		</div>
	</div>

	<div class="container mt-5">
		<form action="submitstudent" method="POST" id="myform">
			<div class="row">
				<div class="col form-group">
					<label for="exampleInputFirstname1" class="form-label">First
						Name</label> <input type="text" class="form-control"
						placeholder="First name" aria-label="First name" name="firstName"
						id="firstName">
				</div>
				<div class="col form-group">
					<label for="exampleInputLastname1" class="form-label">Last
						Name</label> <input type="text" class="form-control"
						placeholder="Last name" aria-label="Last name" id="lastName"
						name="lastName">
				</div>
			</div>
			<div class="mb-3 form-group">
				<label for="exampleInputEmail1" class="form-label">Email
					address</label> <input type="email" class="form-control"
					id="exampleInputEmail1" aria-describedby="emailHelp" name="email"
					id="email">
				<div id="emailHelp" class="form-text">We'll never share your
					email with anyone else.</div>
			</div>
			<div class="mb-3 form-group">
				<label for="exampleInputPassword1" class="form-label">Password</label>
				<input type="password" class="form-control"
					id="exampleInputPassword1" name="password" id="password">
			</div>
			<div class="mb-3 form-check form-group">
				<input type="checkbox" class="form-check-input" id="exampleCheck1">
				<label class="form-check-label" for="exampleCheck1">Check me
					out</label>
			</div>
			<button type="submit" class="btn btn-primary" id="selector">Submit</button>
		</form>
	</div>

	<!-- Optional JavaScript; choose one of the two! -->

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="/assests/vendor/jquery/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
	<script src="/assests/formvalidation/formValidation.min.js"></script>
	<script src="/assests/formvalidation/framework/bootstrap.min.js"></script>


	<!-- Option 2: Separate Popper and Bootstrap JS -->
	<!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    -->
	<script type="text/javascript">
		/* $("#myform").formValidation({
			framework : 'bootstrap',
			live : 'disabled',
			excluded : ":disabled",
			icon : null,
			fields : {
				firstName : {
					validators : {
						notEmpty : {
							message : 'The Name is required. '
						}
					}
				},
				lastName : {
					validators : {
						notEmpty : {
							message : 'The Name is required. '
						}
					}
				},
				email : {
					validators : {
						notEmpty : {
							message : 'The Email is required. '
						}
					}
				}
			}
		}).on('success.form.fv', function(e) {
			e.preventDefault();
		 *///e.preventDefault();//stop the from action methods
		//	 $("#savevideocategory").attr("disabled",true);
		//console.log($('#myform').val());
		/* toastr["success"]("Record Inserted....");
		 *//* $.post("/student/save", 
					{
					 formName: $('#myform').val(),
					}, function( data,status ) 
					{
					toastr["success"]("Record Inserted....");
					 
					location.reload(true);
					
					});*/
		/* });
		 */
		/* $(document).ready(function() {
		//$("#myform").formValidation({});
		//----------Designation------------

		});
		 */

		$(document).ready(function() {
			$("#Modalform").formValidation({
				framework : 'bootstrap',
				live : 'disabled',
				excluded : "disabled",
				icon : null,
				fields : {
					firstName:{
						validators:{
							notEmpty:{
								message:'FirstName is Required'
							}
						}
					},
				lastName:{
					validators:{
						notEmpty:{
							message:'LastName is required'
						}
					}
				},
				age:{
					validators:{
						notEmpty:{
							message:'The age is required'
						},
						between:{
							min:18,
							max:25,
							message:'Age must be in between 18 to 25'
						}
					}
				},
				email:{
					validators:{
						notEmpty:{
							message:'The email is required'
						},
						emailAddress:{
							message:'The value is not a valid email Address'
						}
					}
				},
				
/* 				password:{
					validators:{
						notEmpty:{
							message:'The password is required'
						},
						stringLength:{
							min:8,
							message:'The password must be 8 character long'
						},
						different:{
							message:'The email and password should not be same as each other',
							compare:function(){
						        var em = $.trim($('input:email[name=email]').val());
						        return em;
							}
 
						}

					}
				}, */
				mobileNo:{
					validators:{
						stringLength:{
							min:10,
							message:'The MobileNumber should be 10 character long'
						}
					}
				}
			},
			}).on('success.form.fv',function(e){
				e.preventDefault();
				console.log($('#exampleModal').val());
				$.post("/saveregister",{
					exampleModal:$('#exampleModal').val(),
				
				},
				function(data,status){
					toastr["success"]("Record Inserted....");
					$("#exampleModal").modal('toggle');
					location.reload(true);
				});
				
			});
		});
	</script>
	<!-- .on('success.form.fv', function(e) {
		e.preventDefault();
		 //e.preventDefault();//stop the from action methods
		//	 $("#savevideocategory").attr("disabled",true);
		 
		 //console.log($('#myform').val());
		toastr["success"]("Record Inserted....");
		 /* $.post("/student/save", 
		 {
			 formName: $('#myform').val(),
		 }, function( data,status ) 
		 {
			toastr["success"]("Record Inserted....");
			 
			location.reload(true);
			
		 });
		  */
	}); -->
</body>
</html>