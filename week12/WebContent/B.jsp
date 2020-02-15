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
<h3>String 배열</h3>
<ul>
<c:forEach var="v" begin="0" end="2">
<li><c:out value="${a[v] }"/></li>
</c:forEach>

</ul>
<h3>ArrayList 배열</h3>
<ul>
<c:forEach var="v" begin="0" end="2">
<li><c:out value="${b[v] }"/></li>
</c:forEach>

</ul>
</body>
</html>