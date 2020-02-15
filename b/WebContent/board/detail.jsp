
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세 내역 조회</title>
<%@ include file="/incl/staticheader.jsp" %>
</head>
<body class="page">
<%@ include file="/incl/header.jsp" %>
<div id="page-banner" style="background-image: url(/img/best-quote.jpg);">
  <div class="content  wow fdeInUp">
    <div class="container ">
<h1>상세 내역 조회</h1>
</div></div></div>

<div id="page-body">
  <div class="container">
    <div class="row"> 
      <!--blog page container-->
      <div class="col-md-offset-3 col-md-6 page-block"> 
<form action='<c:url value="/Board.do"/>' method="post">
<input type="hidden" name="action" value="detail_do">
<input type="text" name="employee">
<input type="password" name="empass">

<input type ="submit" value="검색">
<input type ="reset" value="취소">

</form>
</div></div></div></div>
  <div class="clearfix"></div>

<%@ include file="/incl/footer.jsp" %>

</body>
</html>