<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
  <head>
    <title>OGGLE_oggleoggle</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="resources/css/bootstrap.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
    
    <script type="text/javascript" src="resources/js/jquery-2.0.2.js"></script> 
	<script type="text/javascript" src="resources/js/bootstrap.js"></script> 
	
    <script>
   
		$(function() {

			$('body').fadeIn(); 
			
			$('.carousel').carousel({
				  interval: 1500
				})

			$("#login").click(function(e){
				var email = $("#email").val();
				var pwd = $("#pwd").val();
				
				var reg_email=/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
				
				if(email == "" || pwd == "")	
					alert("Input Text");
				else if (email.search(reg_email) == -1)
					alert("Incorrect email");
				else {
					$.post( "login.do", { 	
							email: email, 
							pwd: pwd
						},
						function (data) {
							var obj = jQuery.parseJSON(data);
							alert(obj.msg);
							if(obj.email != null){
								location.replace("/Oggle/home.do"); 
							}
	                    }
					);
				}
			});
			
			$("#signup").click(function(e){
				
				var email = $("#sEmail").val();
				var pwd1 = $("#sPwd1").val();
				var pwd2 = $("#sPwd2").val();
				var name = $("#sName").val();
				
				var reg_email=/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
				
				if(email == "" || pwd1 == "" || pwd2 == "" || name == "" )	
					alert("Input Text");
				else if(pwd1 != pwd2)
					alert("Confirm Password");
				else if(pwd1.length < 5 || pwd2.length < 5)
					alert("ID & Password are too short\n(minimum is 6 characters)");
				else if (email.search(reg_email) == -1)
					alert("Incorrect email");
				else {

					$.post( "signup.do", {
							email: email,
							pwd1: pwd1, 
							pwd2: pwd2, 
							name: name
						},
						function (data) {
							var obj = jQuery.parseJSON(data);
							var msg = obj.msg;
							alert(msg);
							location.replace("/Oggle/main.do"); 
	                    }
					);
				}
			});
			
			$("#cancel").click(function() {  
				$("input").val("");
			});
			
		});
		
		$("intro_carousel").carousel('cycle');
	</script>
  </head>
  <body>
	<div id="intro_carousel" class="carousel slide" data-ride="carousel">
		<!-- Indicators -->
		<ol class="carousel-indicators">
			<li data-target="#intro_carousel" data-slide-to="0" class="active"></li>
			<li data-target="#intro_carousel" data-slide-to="1"></li>
			<li data-target="#intro_carousel" data-slide-to="2"></li>
		</ol>
	
		<!-- Wrapper for slides -->
		<div class="carousel-inner">
			<div class="item active">
				<div class="height_600px backGround_1"></div>
				<div class="carousel-caption">
					<h1>show me the money</h1>
				</div>
			</div>
			<div class="item">
				<div class="height_600px backGround_2"></div>
				<div class="carousel-caption">
					<h1>show me the money</h1>
				</div>
			</div>
			<div class="item">
				<div class="height_600px backGround_3"></div>
				<div class="carousel-caption">
					<h1>show me the money</h1>
				</div>
			</div>
		</div>
		<!-- /.carousel -->
</div>


	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form class="form-signin">
					<h1>OGGLE</h1>
					<div class="row">
						<div class="col-md-8"></div>
						
						<div class="col-md-4">
							<input type="text" id="email" class="form-control"
								placeholder="Email address" required autofocus> <input
								type="password" id="pwd" class="form-control"
								placeholder="Password" required>

							<div class="float_right">
								<button id="login" class="btn btn-mini btn-primary"
									type="button">Login</button>
								<button class="btn btn-mini btn-primary" type="button"
									data-toggle="modal" data-target="#myModal4">Signup</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!--LogIn Modal -->
	<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        <h4 class="modal-title" id="myModalLabel">SIGNUP</h4>
	      </div>
	      <div class="modal-body" id="#user_profile">
			  <p>E-mail</p>
		        <input type="text" id="sEmail" class="form-control" placeholder="Email address" required autofocus>
			  <p>Password</p>
		        <input type="password" id="sPwd1" class="form-control" placeholder="Password" required>
			  <p>confirm_Password</p>
		        <input type="password" id="sPwd2" class="form-control" placeholder="confirm_Password" required>
		      <p>User_name</p>
		        <input type="text" id="sName" class="form-control" placeholder="User_name" required autofocus>
	      </div>
	      <div class="modal-footer">
			<button type="button" class="btn btn-default" id="signup" >Signup</button>
			<button type="button" class="btn btn-default" data-dismiss="modal" id = "cancel">Cancel</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <!-- <script src="https://code.jquery.com/jquery.js"></script> -->
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <!-- <script src="resources/js/bootstrap.min.js"></script>-->
  </body>
</html>
