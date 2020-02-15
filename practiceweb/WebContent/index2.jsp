<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hi this is test website</title>
<style>div{text-align: center;
    align-content: center;
    margin: 200px;}</style>
</head>
<body>

<table border=1 align="center">
<tr><td><a href="BoardServlet?s=logout">로그아웃</a></td>
<td><a href="info.jsp">사용자 정보 수정</a></td>
<td><a href="try.jsp">수강신청 입력</a></td>
<td><a href="delete.jsp">수강신청 삭제</a></td>
<td><a href="check.jsp">수강신청 조회</a></td></tr>

</table><div>
<%=(String)session.getAttribute("id") %> 
 님 환영합니다.</div>
</body>
</html>