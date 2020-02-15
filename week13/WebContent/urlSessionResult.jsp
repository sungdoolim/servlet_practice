<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 2015112120 임성두 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Session URL Rewriting Result</h1>
<%String a=request.getParameter("sid"); %>

세션 ID : <%=session.getId() %>
<br>ID : ${id }

</body>
</html>