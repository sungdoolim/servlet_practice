<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="javax.servlet.http.HttpSession"  %>
<!DOCTYPE html>
    <!-- 2015112120 임성두 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>map 객체 값 출력</h3>
  ${ar[0].loc }   에 거주하는   ${ar[0].rd }  는     ${ar[0].age } 살 입니다 <br>
   ${ar[1].loc }   에 거주하는   ${ar[1].rd }  는  ${ar[1].age }    살 입니다 <br>
     
     <h3>map 겍체를 ArrayList에 넣고 값 출력</h3>
list 의 모든 값 출력 : ${ar }    <br>
list[0] 출력 :    ${ar[0] }<br>
list[1] 출력 :    ${ar[1] }<br><br>

list[0].loc 출력 :    ${ar[0].loc }<br>
list[0].rd 출력 :    ${ar[0].rd }<br>
list[0].age 출력 :    ${ar[0].age }<br><br>


list[1].loc 출력 :   ${ar[1].loc } <br>
list[1].rd 출력 :   ${ar[1].rd } <br>
list[1].age 출력 :  ${ar[1].age }  



</body>
</html>