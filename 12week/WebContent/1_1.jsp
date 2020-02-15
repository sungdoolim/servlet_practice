<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.sql.*" %>
        <!-- 2015112120 임성두 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%int id=1;
String mail,name, title,pw,content; 
mail=request.getParameter("email");
title=request.getParameter("title");
pw=request.getParameter("pw");
content=request.getParameter("context");
name=request.getParameter("name");



Connection conn = null; PreparedStatement pstmt = null; String sql = null;
ResultSet rs = null;
try {

	if(application.getAttribute("id")!=null)
		id=Integer.parseInt(application.getAttribute("id").toString());
	else
		application.setAttribute("id", id);
System.out.println(id);
Class.forName("com.mysql.cj.jdbc.Driver"); String jdbcurl = "jdbc:mysql://localhost:3308/12week?serverTimezone=Asia/Seoul"; 
conn = DriverManager.getConnection(jdbcurl, "root", "staris");
sql = "insert into board_tbl values(?,?,?,?,?,?,?)"; 
pstmt = conn.prepareStatement(sql);
pstmt.setInt(1,id);
pstmt.setString(2,name);
pstmt.setString(3,mail);
pstmt.setString(4,title);
pstmt.setString(5,content);
pstmt.setString(6,pw);
pstmt.setInt(7,id);
pstmt.executeUpdate();
//conn.commit();

} catch(Exception e) { out.println("db 연동 오류입니다. : " + e.getMessage()); }

%>
<div align="center">
<h1>작성한 글이 등록되었습니다</h1>
<a href="1.jsp">home</a>
<a href="1_list.jsp"><u>게시글 목록 보기</u></a>
</div>
</body>
</html>