<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            <!-- 2015112120 임성두 -->
            <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
int id=0; String mail=null,name=null, title=null,pw=null,content=null;
Connection conn = null; PreparedStatement pstmt = null; String sql = null;
ResultSet rs = null;
name=request.getParameter("name");
try {
Class.forName("com.mysql.cj.jdbc.Driver"); String jdbcurl = "jdbc:mysql://localhost:3308/12week?serverTimezone=Asia/Seoul"; 
conn = DriverManager.getConnection(jdbcurl, "root", "staris");
sql = "select * from board_tbl where Name=?"; 
pstmt = conn.prepareStatement(sql);
pstmt.setString(1,name);
rs=pstmt.executeQuery();
if(rs.next()){
	name=rs.getString("name");
	title=rs.getString("Title");

	content=rs.getString("content");
	mail=rs.getString("E_mail");
}

out.println("ddddd");

} catch(Exception e) { out.println("db 연동 오류입니다. : " + e.getMessage()); }




%><div align="center">
<h1>게시글 내용</h1>
글 쓴 이 : <%=name %><br>
글 제 목 : <%=title %><br>
메일주소  : <%=mail %><br>
글 내 용  : <%=content %><br>

<a href="1_list.jsp"><u>게시글 목록 보기</u></a>
<a href="1.jsp">home</a>
</div>
</body>
</html>