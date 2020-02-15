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

<%
String a=request.getParameter("id");
out.print(a+" 님의 취미는"+"<br>");
String[]sports=request.getParameterValues("sports");
if(sports!=null){
for(int i=0;i<sports.length;i++){
out.print(sports[i]+" ");
 }

}%>

</body>
</html>