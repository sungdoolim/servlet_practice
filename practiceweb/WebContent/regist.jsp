<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border=1 align="center">
<tr><td><a href="BoardServlet?s=logout">로그아웃</a></td>
<td><a href="#">사용자 정보 수정</a></td>
<td><a href="#">수강신청 입력</a></td>
<td><a href="#">수강신청 삭제</a></td>
<td><a href="#">수강신청 조회</a></td></tr>

</table>
<a href="main.jsp">home</a>

<h1>회원 정보 입력</h1> <form action="/practiceweb/BoardServlet" method="post"> <fieldset> <legend>회원정보</legend>
 <table>

<tr> <td class="label"> 
아이디 </td> <td class="field"><input type="text" name="id"></td> 
</tr>
 <tr> <td class="label"> 비밀번호 </td> <td class="field"><input type="password" name="pw"></td> </tr>
  <tr> <td class="label"> 학교 </td> <td class="field"><input type="text" name="college"></td> </tr>
   <tr> <td class="label"> 전공 </td> <td class="field"><input type="text" name="major"></td> </tr>
    <tr> <td class="label"> 생일 </td> <td class="field"><input type="text" name="date"></td> </tr>
  <tr> 
<td class="label"> 이름 </td> <td class="field"><input type="text" name="name"></td> </tr> 
<tr> <td class="label">
 주소 </td> <td class="field"><input type="text" name="address"></td> </tr> 
 </table>
 
  <input type="submit" value="register" name="submit"> <input type="reset" value="cancel"> 
 </fieldset> </form> 

</body>
</html>