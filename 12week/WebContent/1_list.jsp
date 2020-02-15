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

rs=pstmt.executeQuery();
while(rs.next()){
	
	name[i]=rs.getString("Name");
	title[i]=rs.getString("Title");

	content[i]=rs.getString("content");
	mail[i]=rs.getString("E_mail");
	
	i++;

}

} catch(Exception e) { out.println("db 연동 오류입니다. : " + e.getMessage()); }

%><div align="center">
<h1>게시글 목록 보이기</h1>
<table border="1">
<%for(int k=0;k<i;k++){ %>
<tr><td><%=k %></td><td><a href="1_content.jsp?name=<%=name[k] %>"><%=name[k] %></a></td><td><%=title[k] %></td><td><%=mail[k] %></td></tr>
<%} %>
</table>
<a href="1.jsp">home</a>
<a href="1_list.jsp"><u>게시글 목록 보기</u></a>
</div>
</body>
</html>