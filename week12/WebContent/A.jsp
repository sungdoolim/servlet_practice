<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 2015112120 임성두 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<%String []a={"Web","Programming","Project"};
ArrayList<String>b=new ArrayList<String>();
b.add("Project");b.add("Web");b.add("Programming");
out.print("String 배열 작성 <br> request.setAttribute 를 이용하여 객체 받음");

out.print("ArrayList 배열 작성 <br> request.setAttribute 를 이용하여 객체 받음");

out.print("forward액션을 사용한 B.jsp호출");
request.setAttribute("a",a);
request.setAttribute("b",b);

%>
<jsp:forward page="B.jsp"/>
</body>
</html>