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
<%Cookie []cookies=request.getCookies(); if(cookies==null){
out.print("쿠키 읽어 오는 예제 쿠키를 설정해야 합니다.");
}else{
%>


쿠키 읽어 오는 예제 쿠키가 설정 되어있습니다.<br>
Name : <%=getCookieValue(cookies,"id") %><br>
Value : <%=getCookieValue(cookies,"pw")%><br>
<%for(int i=0;i<cookies.length;i++){ %>
Name : <%=cookies[0].getName() %><br>
Value : <%=cookies[0].getValue() %><br>
Domain : <%=cookies[0].getDomain() %><br>
MaxAge : <%=cookies[0].getMaxAge() %><br>
Path : <%=cookies[0].getPath() %><br>
Secure : <%=cookies[0].getSecure() %><br>
Comment : <%=cookies[0].getComment() %><br>
Version : <%=cookies[0].getVersion() %><br><br>


<%} %>






<%} %>
<a href="SetCookisTest.html">쿠키 설정</a>

<%!
private String getCookieValue(Cookie[] cookies, String name) {
	String value = null; if (cookies == null) return null; for (Cookie cookie : cookies) { 
		if (cookie.getName().equals(name)) 
			return cookie.getValue(); 
		} return null;
}

%>

</body>
</html>