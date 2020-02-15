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
<h1>Session URL Rewriting Test<br></h1>
<% session.setAttribute("id",request.getParameter("id"));
String url = response.encodeURL("./urlSession.html");
out.print("세션 ID: "+session.getId()+"<br>");
//String url2 = response.encodeURL("http://localhost:8282/week13/urlSession.html");
//out.print("세션 ID: "+url2+"<br>");



%>
id:<%=session.getAttribute("id") %>
<br>
<a href="urlSessionResult.jsp?<%=url%>">test1</a>

<a href="urlSessionResult.jsp">test2</a>
</body>
</html>