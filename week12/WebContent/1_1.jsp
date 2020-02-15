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

<body><c:set var="name2" value="${param.name}" />
<c:set var="a" value="홍길동"/>
선언하고 이름 출력 :${a}<br>
변경하고 이름 출력 :<c:out value="${name2 }" default="이름 없음"/><br>
<c:remove var= "name2"/>
삭제하고 이름 출력 : <c:out value="${name2 }" default="이름 없음"/>

</body>
</html>