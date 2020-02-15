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
pageContext.setAttribute("s","page");
request.setAttribute("s","request");
session.setAttribute("s","session");
application.setAttribute("s","app");

%>
<h4>각 겍체에 setAttribute 속성으로 값 설정 후<br>
jsp 기본 표현 방식과 el 방식의 비교 출럭</h4>
<h4>jsp 기본 표현 방식</h4>
page 영역: <%=pageContext.getAttribute("s") %><br>
request 영역:<%=request.getAttribute("s") %> <br>
session 영역: <%=session.getAttribute("s") %><br>
application 영역: <%=application.getAttribute("s") %><br>


<h4>el 표현 방식</h4>
page 영역(EL): ${pageScope.s }<br>
request 영역(EL): ${requestScope.s }<br>
session 영역(EL): ${sessionScope.s }<br>
application 영역(EL): ${applicationScope.s }<br>
<hr><hr>
<h4>EL PageContext 내장 객체 예제</h4>
Method(method) : ${pageContext.request.method} <br>
URI (requestURL): ${pageContext.request.requestURI}<br>


<hr><hr>
<h3>표현 언어의 사용예제 2 -파라미터 값 처리</h3>
<form action ="q3_r.jsp">
이름 <input type="text" name="name" value="">
<input type="submit" value="확인">
</form>
<br>
이름은 (getParameter):<%=request.getParameter("name") %>   입니다<br>
이름은(param) :  ${param.name }입니다.






</body>
</html>