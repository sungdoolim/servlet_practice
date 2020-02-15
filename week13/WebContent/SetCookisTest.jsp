<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="javax.servlet.http.HttpSession.*" %>
    <!-- 2015112120 임성두 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%Cookie[] cookies=request.getCookies();
if(cookies==null){
%>

쿠키를 설정합니다.
<%

}else{
out.print("쿠키가 설정되어 있습니다 <br> 기존 쿠키를 삭제 합니다.");
}
String id =request.getParameter("id");
String pw=request.getParameter("pw");
response.addCookie(new Cookie("id",id));
response.addCookie(new Cookie("pw",pw));

%><br>
 
<a href="GetCookisTest.jsp">쿠키 가져오기</a>

</body>
</html>