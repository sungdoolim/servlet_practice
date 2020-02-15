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

<h3>표현 언어의 사용예제 2 -파라미터 값 처리</h3>
<form action ="q3_r.jsp">
이름 <input type="text" name="name" value="">
<input type="submit" value="확인">
</form>
<br>
이름은 (getParameter):<%=request.getParameter("name") %>   입니다<br>
이름은(param) :  ${param.name }입니다.






</body>
</html>