<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 2015112120임성두 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>q4_main.jsp 의 내용<br>
<center><h3>jsp의 forward 와 param태그 활용</h3></center>
<jsp:forward page="q4_sub.jsp">
<jsp:param name="url" value="q4_main.jsp"/>
<jsp:param name="news" value="Good Luck"/>
</jsp:forward>

</body>
</html>