<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>첫 화면</title>
<%@ include file="/incl/staticheader.jsp" %>

</head>

<body class="page">
<%@ include file="/incl/header.jsp" %>
<div id="page-banner" style="background-image: url(/img/01-screenshot.jpg);">
  <div class="content  wow fdeInUp">
    <div class="container ">
    </div></div></div>
    
    <div id="page-body">
  <div class="container">
    <div class="row"> 
      <!--blog page container-->
      <div class="col-md-offset-3 col-md-6 page-block"> 
    
    
    
<table class ="layout">
<tr height="50"><td>
<jsp:include page="/incl/header.jsp"/>
</td></tr>
<tr height="500" valign ="top"><td>
<!-- 여기서부터 본문	 -->
<h1>home</h1>
<jsp:include page = "${empty param.url ? '/home.jsp' : param.url}"/>
<br>
</td></tr>



</table>

 <div class="clearfix"></div>



</body>
</html>