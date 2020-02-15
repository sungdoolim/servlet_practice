<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <%@ page import="java.sql.*" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
                    <!-- 2015112120 임성두 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="nobean" scope="request" class="week12.bean"/>
<div align="center">
<h1>게시글 내용</h1>
<table align="center" border="1">

<%
int id=0;int i=0; String []mail=new String[20];
String []name=new String[20];String [] title=new String[20];String []pw=new String[20];String []content=new String[20];
Connection conn = null; PreparedStatement pstmt = null; String sql = null;
ResultSet rs = null;
try {
Class.forName("com.mysql.cj.jdbc.Driver"); String jdbcurl = "jdbc:mysql://localhost:3308/12week?serverTimezone=Asia/Seoul"; 
conn = DriverManager.getConnection(jdbcurl, "root", "staris");
sql = "select * from board_tbl"; 
pstmt = conn.prepareStatement(sql);
int k=1;
rs=pstmt.executeQuery();
while(rs.next()){
	
	
	nobean.setName(rs.getString("Name"));
	nobean.setTitle(rs.getString("Title"));

	nobean.setContent(rs.getString("content"));
	nobean.setMail(rs.getString("E_mail"));
	


%>
<tr><td><%=k %></td><td><a href="2_content.jsp?name=<%=nobean.getName() %>"><%=nobean.getName() %></a></td><td><%=nobean.getTitle() %></td><td><%=nobean.getMail() %></td></tr>

<% 
k++;}


} catch(Exception e) { out.println("db 연동 오류입니다. : " + e.getMessage()); }

%>
</table>

<a href="2.jsp">home</a>
<a href="2_list.jsp"><u>게시글 목록 보기</u></a></div>
</body>
</html>