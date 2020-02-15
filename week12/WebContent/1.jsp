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
<c:set var= "a" value= "webp"  scope= "request" />
<c:set var= "b" value= "3" />
<c:set var="result" value="webp" />

<h5>c:if 커스텀 액션 사용</h5>
msg : ${a }<br>
<c:if test= "${result == a}"> 
test result=true</c:if>
<hr>
<h5>c:choose 커스텀 액션 사용</h5>
<%String value="webp";request.setAttribute("value",value); %>
value=${value }<br>
<c:choose>
<c:when test= "${a==value }"> 처음 뵙겠습니다.  <br></c:when> 
<c:otherwise>누구도 아닙니다 <br> </c:otherwise> </c:choose>
<hr><h5>c:forEach 커스텀 액션 사용</h5>
Value Square
<c:forEach var= "cnt" begin= "0" end= "10" step="2"> 
<table>
<tr><td>${cnt }</td><td> &nbsp;&nbsp;&nbsp;&nbsp;${cnt*cnt } </td></tr>
</table> </c:forEach> 
<hr>
<h5>c:import 커스텀 액션 사용</h5>
<c:import url="1_1.jsp">
<c:param name="name" value="철수"/>
</c:import>


</body>
</html>