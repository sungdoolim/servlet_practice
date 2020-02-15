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
<jsp:useBean id="no2bean" class="week12.bean"/>

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
	no2bean.setName(rs.getString("Name"));
	no2bean.setTitle(rs.getString("Title"));
	//pw=rs.getString("Passwd");
	no2bean.setContent(rs.getString("content"));
	no2bean.setMail(rs.getString("E_mail"));
}
//conn.commit();


} catch(Exception e) { out.println("db 연동 오류입니다. : " + e.getMessage()); }




%>
<div align="center">
<h1>게시글 내용</h1>
글 쓴 이 : <%=no2bean.getName() %><br>

메일주소  : <%=no2bean.getMail() %>
<br>
글 제 목: <%=no2bean.getTitle() %>
<br>
글 내 용  : <%=no2bean.getContent() %>
<br>
<a href="2_list.jsp"><u>게시글 목록 보기</u></a>
<a href="2.jsp">home</a></div>
</body>
</html>