<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <!-- 2015112120 임성두 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body><div align="center">
<form action="/12week/beanServlet">
<h1 align="center">게 시 판</h1><br>
글쓴이 : <input type="text" name="name"><br>
메일 주소 : <input type="text" name="email"><br>
글 제 목: <input type="text" name="title"><br>
아이디: <input type="text" name="id"><br>
글 내 용 :<textarea name="content"></textarea><br>
패스워드 : <input type="text" name="pw"><br>
<input type="hidden" name="v" value="d">
<input type="submit" value="등록하기">
<input type="reset" value="다시쓰기"><br>
</form>
<a href="/12week/beanServlet?v=list"><u>게시글 목록 보기</u></a></div>
</body>
</html>