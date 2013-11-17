<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Oggle Signup</title>
	
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<script type="text/javascript" src="resources/js/jquery-2.0.2.js"></script> 
	<script type="text/javascript" src="resources/js/bootstrap.js"></script> 
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css" media="all" />

	<script>
		$(function() {
			$("#signup").click(function(e){
				var id = $("#id").val();
				var pwd1 = $("#pwd1").val();
				var pwd2 = $("#pwd2").val();
				var name = $("#name").val();
				var email = $("#email").val();
				
				// 인자 email_address를 정규식 format 으로 검색
				var reg_email=/^[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[@]{1}[-A-Za-z0-9_]+[-A-Za-z0-9_.]*[.]{1}[A-Za-z]{2,5}$/;
				

								
				if(id == "" || pwd1 == "" || pwd2 == "" || name == "" ||  email == "" )	
					alert("Input Text");
				else if(pwd1 != pwd2)	
					alert("Confirm Password");
				else if(id.length < 5 || pwd1 < 5 || pwd2 < 5)
					alert("ID & Password are too short\n(minimum is 6 characters)");
				else if (email.search(reg_email) == -1)
					alert("Incorrect email");
				else {
					$.post( "signup.do", { 	
							id: id, 
							pwd1: pwd1, 
							pwd2: pwd2, 
							name: name, 
							email: email 
						},
						function (data) {
							var obj = jQuery.parseJSON(data);
							var msg = obj.email;
							msg += "로 인증 mail을 전송 하였습니다.\n인증 후 로그인 해주세요"; 
							alert(msg);
							location.replace("/Oggle/login.do"); 
	                    }
					);
				}
			});
		});
	</script>
</head>
<body>
	<form method="post" action="/Oggle/signup.do" id="uploadForm">
		<div class="control-group warning">
			<label class="control-label" for="inputWarning">ID</label>
			<div class="controls">
				<input type="text" id="id" name="id">
			</div>
		</div>
	 
		<div class="control-group info">
			<label class="control-label" for="inputInfo">Password</label>
			<div class="controls">
				<input type="text" id="pwd1" name="pwd1">
			</div>
		</div>
		
		<div class="control-group info">
			<label class="control-label" for="inputInfo">Password Confirm</label>
			<div class="controls">
				<input type="text" id="pwd2" name="pwd2">
			</div>
		</div>
	  
	  	<div class="control-group success">
			<label class="control-label" for="inputSuccess">Name</label>
			<div class="controls">
				<input type="text" id="name" name="name">
			</div>
		</div>
		
		<div class="control-group error">
			<label class="control-label" for="inputError">Email Address</label>
			<div class="controls">
				<input type="text" id="email" name="email">
			</div>
		</div>
		
		<button id="signup" type="button" class="btn btn-primary">Signup</button>
	</form>

</body>
</html>