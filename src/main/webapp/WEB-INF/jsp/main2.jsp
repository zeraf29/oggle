<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Oggle Main</title>
	<script>
	$(function() {
		var test = ${msg};
		alert(test);
	});
	</script>
</head>
<body>
	<br/>
	<br/>
	<a href="/Oggle/signup.do">Signup</a> <br/><br/>
	<a href="/Oggle/login.do">Login</a> <br/><br/>
	<a href="/Oggle/mongo.do">MongDB Test</a> <br/><br/>
	${id} ${msg} ${personList}
	${personList[0].name}
	${personList[1].name}
	${personList[2].name}
</body>
</html>