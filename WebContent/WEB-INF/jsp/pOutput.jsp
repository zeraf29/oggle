<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<body>
	<h2>Here is a simple CRUD using Spring MVC and MongoDB.</h2>

		<form action="/Oggle/insert.do" method="post">
			<input type="hidden" name="id">
			<label for="name">Person Name</label>
			<input type="text" id="name" name="name"/>
			<input type="submit" value="Submit"/>
		</form>
	<br/>
	
	${person.name}
	${person.id}
	
	<table border="1">
		<c:forEach var="person" items="${personList}">
			<tr>
				<td>${person.name}</td>
				<td>
					<input type="button" value="delete" 
						onclick="window.location='/Oggle/delete.do?id=${person.id}'"/>
				</td>
			</tr>
		</c:forEach>
	</table>	
</body>
</html>