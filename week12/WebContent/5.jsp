<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 2015112120 임성두 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>


<jsp:useBean id="testb" class="week12.testBean"/>
<jsp:setProperty name="testb" property="id" value="disyd"/>
<jsp:setProperty name="testb" property="password" value="pw"/>
<%
//testb.setId("OKJSP");
//testb.setPassword("OKPassword");
%>
 ID : <jsp:getProperty name="testb" property="id" /> 
 <br> Password : <jsp:getProperty name="testb" property="password" /> 

</body>
</html>