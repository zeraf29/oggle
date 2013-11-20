<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Oggle Login</title>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<script type="text/javascript" src="resources/js/jquery-2.0.2.js"></script> 
	<script type="text/javascript" src="resources/js/bootstrap.js"></script> 
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css" media="all" />

	<script>
		$(function() {
			$("#login").click(function(e){
				var id = $("#id").val();
				var pwd = $("#pwd").val();
				
				if(id == "" || pwd == "")	
					alert("Input Text");
				else {
					$.post( "login.do", { 	
							id: id, 
							pwd: pwd, 
						},
						function (data) {
							var obj = jQuery.parseJSON(data);
							alert(obj.msg);
							if(obj.user != null){
								location.replace("/Oggle/home.do"); 
							}
	                    }
					);
				}
			});
		});
	</script>
</head>
<body>
	<form method="post" action="/Oggle/login.do" id="uploadForm">
		<div class="control-group warning">
			<label class="control-label" for="inputWarning">ID</label>
			<div class="controls">
				<input type="text" id="id" name="id">
			</div>
		</div>
	 
		<div class="control-group info">
			<label class="control-label" for="inputInfo">Password</label>
			<div class="controls">
				<input type="text" id="pwd" name="pwd">
			</div>
		</div>
		
		<button id="login" type="button" class="btn btn-primary">Login</button>
	</form>
			
</body>
</html>