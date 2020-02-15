<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*" %>
        <%@ page import="week12.bean" %>
                <!-- 2015112120 임성두 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
%>
<jsp:useBean id="bean" scope="request" class="week12.bean"/>
<%=bean.getMail() %>
<h1>작성한 글이 등록되었습니다</h1>
<a href="3.jsp">home</a>
<a href="/12week/beanServlet?v=list"><u>게시글 목록 보기</u></a>
</body>
</html>