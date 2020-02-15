<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 2015112120 임성두 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<%!
String id;String Password;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getPassword() {
	return Password;
}
public void setPassword(String password) {
	Password = password;
}
%>
<%setId("OKJSP");setPassword("OKPassword"); %>
ID:<%=getId() %><br>
Password:<%=getPassword() %>

</body>
</html>