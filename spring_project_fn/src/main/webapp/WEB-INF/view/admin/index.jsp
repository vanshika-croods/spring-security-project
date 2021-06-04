<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Admin Dashboard</title>

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
				<h1 class="h3 mb-4 text-gray-800 text-center">View Support</h1>
				<!--view all the details of the support ticket here using datatable -->

				<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>Sr. No</th>
							<th>FirstName</th>
							<th>LastName</th>
							<th>UserName</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>

					</tbody>
				</table>


			</div>

			<!-- End of Main Content -->
			<!-- start of Bootstrap Modal -->

			<div class="modal fade" id="editmodal" tabindex="-1"
				aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">User Info</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="user/saveDetails" method="POST">
							<div class="mb-3">
									<label for="recipient-name" class="col-form-label">FirstName:</label> <input type="text" class="form-control"
										id="firstName" name="firstName">
								</div>
								
								<div class="mb-3">
									<label for="recipient-name" class="col-form-label">LastName:</label> <input type="text" class="form-control"
										id="lastName" name="lastName">
								</div>
								<div class="mb-3">
									<label for="message-text" class="col-form-label">UserName:</label>
									<textarea class="form-control" id="userName"
										name="userName"></textarea>
								</div>
								<input type="hidden" id="userId" name="userId">
								<div class="modal-footer">
									<button type="submit" value="submit"
										class="form-submit btn-primary">Submit</button>
								</div>
							</form>

						</div>

					</div>

				</div>
			</div>
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
						<span aria-hidden="true">×</span>
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

	<script>
	$(document).ready(function(){
		
		$('table#example').DataTable(
		{
			responsive: true,
            pageLength: 10,
            serverSide: true,
            searching: true,
            processing: !0,
            "lengthMenu": [[10, 25, 50,100, -1], [10, 25, 50,100, "All"]],
            
		  ajax: 
		  {
    		'contentType': 'application/json',
    		'url': '/data/users',
    		'type': 'POST',
    		'data': function(d) 
    		{
      			return JSON.stringify(d);
    		}
  		},
  		 columns :[
             {
             data : 'userId'
             },
            {
                 data : 'firstName'
             },
             {
                 data : 'lastName'
             },
              
            {
                 data : 'userName'
            },
             
             {
             data : 'userId'
             }],
          columnDefs: [{
        	  
                  targets: 0,
                  title: "userId",
                  orderable: !1,
                  render: function (a, e, t, n) 
                  {
                     return n.row + n.settings._iDisplayStart + 1;
                  }
              
          },
          {
        	  
              targets: 1,
              orderable: !1,
              render: function (a, e, t, n) 
              {
            	 if(t.firstName!=null){
            		 return t.firstName;	 
            	 }
            	 else{
            		 return "-";
            	 }
                 
              }
          
      },
      {
    	  
          targets: 2,
          orderable: !1,
          render: function (a, e, t, n) 
          {
        	  if(t.lastName!=null){
        		  return t.lastName;	 
         	 }
         	 else{
         		 return "-";
         	 }
             
          }
      
  	},
  {
	  
      targets: 3,
      orderable: !1,
      render: function (a, e, t, n) 
      {
    	  if(t.userName!=null){
    		  return t.userName;	 
     	 }
     	 else{
     		 return "-";
     	 }
         
      }
  
	},
	{
  	  	targets: 4,
        title: "Actions",
        orderable: !1,
        class: "text-center",
        render: function (a, e, t, n) 
        {
      	 
           var action;
           action='<button type="button" class="btn btn-primary edit-btn" onclick="edituser(' +t.userId+ ')" data-toggle="modal" data-target="#editmodal" data-whatever="@mdo" ><i class="fas fa-user-edit"></i></button>'+
           '<a onclick="deleteUserDetail('+t.userId+')"  class="btn btn-danger del-btn"  href="JavaScript:Void(0);"><i class="fa fa-trash-alt"></i>';
           
           return action;
           
          /*  action += '\n<a href="/manufacturing/' + t.type + '/' + t.manufacturingId + '/edit" class="m-portlet__nav-link btn m-btn m-btn--hover-info m-btn--icon m-btn--icon-only m-btn--pill" title="Edit"> <i class="fa fa-edit"></i></a>\n'
     		 action += '\n<button  onclick="deleteManufacturing(' + t.manufacturingId + ',`' + t.type + '`)"> <i class="fa fa-trash"></i></button>\n'
*/          
		}
    
    }],
  })
 })
 
	function deleteUserDetail(userId) {
        console.log("deleteeeeeeeeeeesdesfsdf")
        var u = '/admin'+'/userdelete/' + userId + '/delete';
        swal({
            title: "Are you sure?",
            text: "You won't be able to revert this!",
            type: "warning",
            showCancelButton: !0,
            confirmButtonText: "Yes, delete it!"
        }).then(function (e) {
            if (e.value) {
                
                   e.value && u != '' ? window.location.href = u : console.error("CROODS: data-url undefined ")
               }

        })
    }
	
	function edituser(userId){
		$.ajax({
			type:"GET",
			url:'/admin'+'/edituser/'+userId,
			success:function(data){
				//alert("data here");
				$("#userId").val(data.userId);
				$("#firstName").val(data.firstName);
				$("#lastName").val(data.lastName);
				$("#userName").val(data.userName);
			}
		})
	}
 

	</script>

</body>

</html>