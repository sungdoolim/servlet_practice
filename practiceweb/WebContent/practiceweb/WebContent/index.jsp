<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- git???? -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hi this is test website</title>

<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script>

$(document).ready(function(){ 
alert("수강 신청 올클 기원");

	$("table").show("slow");
	$("#tip").hover(function(){
		$("#div2").show("slow");
	
	},function(){
		$("#div2").slideUp("slow");
		
	});
});




</script>
<style>
body{
 background-image: url("res/2.jpg");
 background-size:100% 100%;
 }
 #tip{color:red;
 margin:0;
 border:solid yellow;
 }
div{text-align: center;
    align-content: center;
    margin: 200px;
    }

    h4{
    color:blue;}
    #div1{
    margin:0px;
    
    }
    table{
    width:100%;}
    a{    text-align: center;
    text-decoration-color: #6db0eb;
    -webkit-text-stroke-width: medium;
    color: #FF9800;}
    td:hover{
    background-color:#FFF9C4;
    }
    td:active{
    background-color:aliceblue;
    }
    td{
    text-align:center;
    width:10%;}
    
    </style>
</head>
<body>
<table align="center" style="display:none">
<%String noid=(String)session.getAttribute("message");
if(noid!=null){%><%=noid %><% }%>
<div id="div1">
<tr><td><a href="regist.jsp">회원가입</a></td>
<td><a href="login.jsp" >로그인</a></td>
<td><a href="#" onclick="alert('로그인 먼저 하세요')">사용자 정보 수정</a></td>
<td><a href="#" onclick="alert('로그인 먼저 하세요')">수강신청 입력</a></td>
<td><a href="#" onclick="alert('로그인 먼저 하세요')">수강신청 삭제</a></td>
<td><a href="#" onclick="alert('로그인 먼저 하세요')">수강신청 조회</a></td></tr>
</div>
</table>
<hr>
<span id="tip">수강신청 팁!!</span>
<div id="div2" style="display:none">ㅌ비팁티비팁팁
<br>티비티비ㅣ비<br>
팁티비티ㅣㅂ</div>

<div><h3>동국 대학교 수강신청 페이지 입니다.</h3><br><br><h4>로그인 후 이용하세요</h4></div>


</body>
</html>