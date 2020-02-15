<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<c:set var= "a" value= "4"  scope= "request" />
<c:set var= "b" value= "3" />
 <c:set var= "r" value= "${b*a }" />
${r }

<c:if test= "${a > b}"> num1이 더 큽니다. 
</c:if>


<c:choose>
<c:when test= "${a == 0}"> 처음 뵙겠습니다. <BR> </c:when> 
<c:when test= "${b == 3}"> 반갑습니다. <BR> </c:when> 
<c:otherwise> 안녕하세요. <BR> </c:otherwise> </c:choose>

<c:forEach var= "cnt" begin= "1" end= "10" step="2"> 
<FONT size=${cnt} > 야~호~ </FONT> <BR>
 </c:forEach> 

<c:redirect url= "test2.jsp" > 
<c:param name= "aa" value= "4" /> 
<c:param name= "bb" value= "5" /> 
</c:redirect>

<!-- <//jsp:forward page= "test1.jsp"> / -->



</body>
</html>