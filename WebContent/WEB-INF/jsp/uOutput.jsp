<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<body>
	<table border="1">
		<tr>
			<td>email</td>
			<td>tag1</td>
			<td>tag2</td>
			<td>tag3</td>
			<td>watchedList</td>
			<td>likeList</td>
		</tr>
		<c:forEach var="userTag" items="${utList}">
			<tr>
				<td>${userTag.email}</td>
				<td>${userTag.tag1}</td>
				<td>${userTag.tag2}</td>
				<td>${userTag.tag3}</td>
				<td>${userTag.watchedList}</td>
				<td>${userTag.likeList}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>