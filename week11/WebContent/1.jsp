<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 2015112120 임성두 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <!-- <form action="q2_r.jsp" > -->		<!-- 2번문제와도 연결되어 있습니다. 실행 시킬때 중의해 주세요!!!!!! -->
  <form action="q2_r.jsp" >
아이디 :<input type="text" name="id"><br>
회원님이 관심있는 스포츠를 선택하세요<br>
<input type="checkbox" name="sports" value="축구">축구 
<input type="checkbox" name="sports" value="농구">농구 
<input type="checkbox" name="sports" value="야구">야구 
<input type="checkbox" name="sports" value="골프">골프 
<input type="submit" value="확인">
<input type="reset" value="취소">

</form>

</body>
</html>