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

q4_sub.jsp 의 출력 내용은 request 요청으로 q4_main.jsp의 내용을 출력(이건 직접 적은 겁니다.)<br>
이전 페이지의 파일명: <%=request.getParameter("url") %><br>
q4_main.jsp 에서 넘어온 메시지: <%=request.getParameter("news") %>


</body>
</html>