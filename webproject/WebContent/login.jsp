<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<table border=1 align="center">
<tr><td><a href="BoardServlet?s=logout">로그아웃</a></td>
<td><a href="#">사용자 정보 수정</a></td>
<td><a href="#">수강신청 입력</a></td>
<td><a href="#">수강신청 삭제</a></td>
<td><a href="#">수강신청 조회</a></td></tr>

</table>
<a href="index2.jsp">home</a>
<form action="/webproject/BoardServlet" method="post">

<table border="1"align="center">
<tr><th colspan="2">아이디와 패스워드를 입력하세요</th></tr>
<tr><td>아이디 : </td><td><input type="text" name="id"></td></tr>
<tr><td>패스워드 : </td><td><input type="password" name="pw"></td></tr>
<tr><td colspan="2" align="center"><input type="submit" value="login" name="submit">&nbsp;&nbsp;&nbsp;<input type="reset" value="취소"></td></tr>
</table>




</form>

</body>
</html>