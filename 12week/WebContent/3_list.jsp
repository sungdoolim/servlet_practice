<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ page import="java.sql.*" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
                    <!-- 2015112120 임성두 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
<%int k=0; %>
<h1>게시글 목록</h1>
<jsp:useBean id="bean0" scope="request" class="week12.bean"></jsp:useBean>
<table border="1">
<tr><td><%=k+=1 %>&nbsp;</td><td><a href="3_content.jsp?name=${bean0.getName() }">${bean0.getName() }&nbsp;</a></td><td>${bean0.getTitle()}&nbsp;</td><td>${bean0.getMail()}&nbsp;</td></tr>
<br>
<jsp:useBean id="bean1" scope="request" class="week12.bean">
</jsp:useBean><tr><td><%=k+=1 %>&nbsp;</td><td><a href="3_content.jsp?name=${bean1.getName() }">${bean1.getName() }&nbsp;</a></td><td>${bean1.getTitle()}&nbsp;</td><td>${bean1.getMail()}&nbsp;</td></tr>
<br>
<jsp:useBean id="bean2" scope="request" class="week12.bean">
</jsp:useBean><tr><td><%=k+=1 %>&nbsp;</td><td><a href="3_content.jsp?name=${bean2.getName() }">${bean2.getName() }&nbsp;</a></td><td>${bean2.getTitle()}&nbsp;</td><td>${bean2.getMail()}&nbsp;</td></tr>
<br>
<jsp:useBean id="bean3" scope="request" class="week12.bean">
</jsp:useBean><tr><td><%=k+=1 %>&nbsp;</td><td><a href="3_content.jsp?name=${bean3.getName() }">${bean3.getName() }&nbsp;</a></td><td>${bean3.getTitle()}&nbsp;</td><td>${bean3.getMail()}&nbsp;</td></tr>
<br>
<jsp:useBean id="bean4" scope="request" class="week12.bean">
</jsp:useBean><tr><td><%=k+=1 %>&nbsp;</td><td><a href="3_content.jsp?name=${bean4.getName() }">${bean4.getName() }&nbsp;</a></td><td>${bean4.getTitle()}</td><td>${bean4.getMail()}</td></tr>
<br>
</table>

<a href="3.jsp">home</a>
<a href="/12week/beanServlet?v=list"><u>게시글 목록 보기</u></a></div>
</body>
</html>