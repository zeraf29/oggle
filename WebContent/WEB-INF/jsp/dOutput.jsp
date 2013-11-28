<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<body>
	<table border="1">
		<tr>
			<td>id</td>
			<td>boost</td>
			<td>url</td>
			<td>title</td>
			<td>content</td>
		</tr>
		<c:forEach var="doc" items="${docList}">
			<tr>
				<td>id : ${doc.id}</td>
				<td>boost : ${doc.boost}</td>
				<td>url : ${doc.url}</td>
				<td>title : ${doc.title}</td>
				<td>content : ${doc.content}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>