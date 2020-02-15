<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="javax.servlet.http.HttpSession"  %>
<!DOCTYPE html>
    <!-- 2015112120 임성두 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${param.id }님의 취미는<br>

${paramValues.sports[0] }
${paramValues.sports[1] }
${paramValues.sports[2] }
${paramValues.sports[3] }



</body>
</html>