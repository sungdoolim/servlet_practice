<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% Cookie[] cookies = request.getCookies(); %>
이름: <%= getCookieValue(cookies, "NAME") %> <BR> 
성별: <%= getCookieValue(cookies, "GENDER") %> <BR> 
나이: <%= getCookieValue(cookies, "AGE") %>

<%!
private String getCookieValue(Cookie[] cookies, String name) {
	String value = null; if (cookies == null) return null; for (Cookie cookie : cookies) { 
		if (cookie.getName().equals(name)) return cookie.getValue(); } return null;
}
%>

</body>
</html>