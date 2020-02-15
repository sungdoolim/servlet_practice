<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="WEB-INF/tlds/a.tld" prefix="m" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

 ${param.NUM }의 제곱근은? ${m:squareroot(param.NUM)}<br>
</body>
</html>