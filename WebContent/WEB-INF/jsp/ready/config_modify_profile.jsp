<!DOCTYPE html>
<html>
  <head>
    <title>OGGLE_oggleoggle</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Bootstrap -->
    <link href="resources/css/bootstrap.css" rel="stylesheet">
   <link href="resources/css/bootstrap-responsive.css" rel="stylesheet">


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
  </head>
   <body>
  
	<div class="container">
		 <p>E-mail</p>
	        <input type="text" class="form-control" placeholder="Email address" required autofocus>
		  <p>Password</p>
	        <input type="password" class="form-control" placeholder="Password" required>
		  <p>confirm_Password</p>
	        <input type="password" class="form-control" placeholder="confirm_Password" required>
	      <p>User_name</p>
	        <input type="text" class="form-control" placeholder="User_name" required>
	        
	       <button type="button" class="btn btn-default">Modify</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" id = "cancel">Cancel</button>
    </div> <!-- /container -->


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/js/bootstrap.min.js"></script>
	
	<script>
	$(document).ready(function(){
		$('body').fadeIn(); 
	});
	</script>
  </body>
</html>
