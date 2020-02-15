<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="javax.servlet.http.HttpSession"  %>
        <%@page import="java.util.*" %>
<!DOCTYPE html>
    <!-- 2015112120 임성두 -->
<%
Cookie cookie =new Cookie("name","hong");
cookie.setMaxAge(2*60);
response.addCookie(cookie);
%>

<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
<h3> . 으로 접근</h3>
쿠키 값(.) : ${cookie.name.value } <br>
유지시간(.) : ${cookie.name.maxAge }<br>
쿠키(.) : ${cookie.name}<br><br>	

<h3> [] 으로 접근</h3>
쿠키 값([]) : ${ cookie["name"]["value"]  } <br>
유지시간([]) : ${cookie["name"]["maxAge"] }   <br>
쿠키([]) :   ${ cookie["name"]} <br><br>



</body>
</html>