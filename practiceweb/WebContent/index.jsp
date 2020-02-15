<!--

  * 동국대학교 베팅형 수강신청 
  * index.jsp
  * 수강신청 로그인 페이지

-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>동국대학교 서울캠퍼스 수강신청</title>
	<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
	<script>
		$(document).ready(function(){
		//alert("수강신청 성공을 기원합니다!");
		$("div").show("slow");
		});
	</script>
	
	<style>
		/* 배경화면을 꽉차게 설정 */
		html {
			background: url("res/동국대학교.jpg") no-repeat center center fixed;
		    -webkit-background-size: cover;
		    -moz-background-size: cover;
		    -o-background-size: cover;
		    background-size: cover;
		}
	
		.login-page {
		  width: 360px;
		  padding: 7% 0 0;
		  margin: auto;
		}
		.form {
		  position: relative;
		  z-index: 1;
		  background: #FFFFFF;
		  max-width: 360px;
		  margin: 0 auto 100px;
		  padding: 45px;
		  text-align: center;
		  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
		}
		
		.form input {
		  font-family: "Roboto", sans-serif;
		  outline: 0;
		  background: #f2f2f2;
		  width: 100%;
		  border: 0;
		  margin: 0 0 15px;
		  padding: 15px;
		  box-sizing: border-box;
		  font-size: 14px;
		}
		
		.form button {
		  font-family: "Roboto", sans-serif;
		  text-transform: uppercase;
		  outline: 0;
		  background: #ff7f00 ;
		  width: 100%;
		  border: 0;
		  padding: 15px;
		  color: #FFFFFF;
		  font-size: 14px;
		  -webkit-transition: all 0.3 ease;
		  transition: all 0.3 ease;
		  cursor: pointer;
		}
		
		.form button:hover,.form button:active,.form button:focus {
		  background: #43A047;
		}
		</style>
	</head>
	
	<body> 
		<div><br><image width = 400px height = 150px src = "res/동국대학교로고.png" align = left><br>
		<h1 align=center>동국대학교 서울캠퍼스 수강신청&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</h1></div>
	  	<div class="login-page" >
	  		<div class="form" style="display:none">
	  			<form class="login-form" action="/practiceweb/BoardServlet" method="post">
	      			<input type="text" name ="id" placeholder="학번"/>
	      			<input type="password" name ="pw" placeholder="비밀번호"/>
	      			<button type="submit" value="login" name = "submit">로그인</button>
	   			</form>
	 		</div>
		</div> 
	</body>
</html>
