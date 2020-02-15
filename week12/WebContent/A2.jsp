<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 2015112120 임성두 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
redirect 액션을 사용한 B2.jsp호출
param액션을 상징하는 변수의 값 설정

<c:set var="a1" value=" wp"/>
<c:set var="b1" value=" settlement"/>
<c:set var="c1" value=" Web Programming"/>
<c:set var="d1" value=" 송양의 교수님"/>
<c:redirect url="B2.jsp">
<c:param name="a1" value="${a1 }"/>
<c:param name="b1" value="${b1 }"/>
<c:param name="c1" value="${c1 }"/>
<c:param name="d1" value="${d1 }"/>
</c:redirect>
</body>
</html>