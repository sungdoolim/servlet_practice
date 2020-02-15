<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- 2015112120임성두 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%int score=Integer.parseInt(request.getParameter("score"));
int num=Integer.parseInt(request.getParameter("num"));

if(score>=90)
	out.print("당신의 성적은 A 입니다<br>");
else if(score>=80)
	out.print("당신의 성적은 B 입니다<br>");
else if(score>=70)
	out.print("당신의 성적은 C 입니다<br>");
else if(score>=60)
	out.print("당신의 성적은 D 입니다<br>");
else
	out.print("당신의 성적은 F 입니다<br>");


for(int j=1;j<num+1;j++){
for(int i=0;i<j;i++){
out.print("*");	
}out.print("<br>");}
 %>
</body>
</html>