<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
		<h3>${user.email}</h3> <br/>
		
		  <p>Password</p>
	        <input type="password" id="pwd1" class="form-control" placeholder="Password" required>
		  <p>confirm_Password</p>
	        <input type="password" id="pwd2" class="form-control" placeholder="confirm_Password" required>
	      <p>User_name</p>
	        <input type="text" id="name" class="form-control" placeholder="User_name" required>
	        <br/>
	        
	       <button type="button" id="update" class="btn btn-default">Update</button>
          <button type="button" id="cancel" class="btn btn-default" data-dismiss="modal" id = "cancel">Cancel</button>
    </div> <!-- /container -->


	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="resources/js/bootstrap.min.js"></script>
	
	<script>
	$(document).ready(function(){
		
		var name = "${user.name}";
		
		$("#name").val(name);
		
		$("#update").click(function(e){
			
			var pwd1 = $("#pwd1").val();
			var pwd2 = $("#pwd2").val();
			var name = $("#name").val();
			
			if(pwd1 == "" || pwd2 == "" || name == "" )	
				alert("Input Text");
			else if(pwd1 != pwd2)
				alert("Confirm Password");
			else if(pwd1.length < 5 || pwd2.length < 5)
				alert("ID & Password are too short\n(minimum is 6 characters)");
			else {
				$.post( "updateProfile.do", {
						pwd1: pwd1, 
						name: name
					},
					function (data) {
						var obj = jQuery.parseJSON(data);
						var msg = obj.msg;
						alert(msg);
						location.replace("/Oggle/home.do"); 
						$("input").val("");
						$("#name").val(name);
                    }
				);
			}
		});
		
		$("#cancel").click(function(e){
			$("input").val("");
			$("#name").val(name);
		});
		
		
	});
	</script>
  </body>
</html>
