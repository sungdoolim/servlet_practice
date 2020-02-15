<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 2015112120임성두 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%String []users={"web","hong","gil"};
String[]passwords={"programming","2018","1107"};

String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
String redirecturl="form.jsp";

for(int i=0;i<users.length;i++){
	if(users[i].equals(id)&&passwords[i].equals(pwd)){
		session.setAttribute("id",id);
		redirecturl="success.jsp";
		
	}
}


response.sendRedirect(redirecturl);
%>

</body>
</html>