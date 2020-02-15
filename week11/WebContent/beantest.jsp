<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<jsp:useBean id="testb" class="week11.testBean"/>

<%
testb.setId("2015");
testb.setPassword("de");
%>
<%=testb.getId() %>
<%=testb.getPassword() %>


</body>
</html>