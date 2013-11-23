<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>OGGLE_oggleoggle</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-responsive.css" rel="stylesheet">


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body>

	<div>
		<div class="page-header">
			<div>
				<h2>
					Friends List
					<div class="pull-right">
						<button class="btn" type="button" id = "Modify_btn">Modify</button>
						<button class="btn btn-primary" type="button" data-toggle="modal" data-target="#add_friend">
							<span class="glyphicon glyphicon-plus">ADD</span>
						</button>
					</div>
				</h2>
			</div>
		</div>
		<div class="f_List">
			<!-- division for customized List -->
			<div class="row">
				<div class="col-md-6">
					<div class="well">test1</div>
				</div>
				<div class="col-md-6">
					<div class="well">test2</div>
				</div>
				<div class="col-md-6">
					<div class="well">test3</div>
				</div>
				<div class="col-md-6">
					<div class="well">test4</div>
				</div>
			</div>
		</div>


		<div class="modal fade" id="add_friend" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">SIGN-UP</h4>
					</div>
					<div class="modal-body" id="#user_profile">
						<p>E-mail</p>
						<input type="text" class="form-control"	placeholder="Email address" required autofocus>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default">Add_Friend</button>
						<button type="button" class="btn btn-default" data-dismiss="modal" id="cancel">Cancel</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

	</div>

	<script>
	$("#cancel").click(function() {  
		$("input").val("");
	});
	

	$("#Modify_btn").click(function() {  
		if($(".f_List .btn").length == 0){
			$(".well").append("<button type='button' class='btn btn-default pull-right'>Delete</button>");
			}
		else{
			$(".f_List .btn").remove();
		}
	
	});
	
	$(".well").delegate(".btn","click", function() { 
		$(this).parent().parent().remove();
	});
	
	
	</script>
</body>
</html>
