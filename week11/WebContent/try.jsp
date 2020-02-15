<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"  %>
<%@ page import="javax.naming.InitialContext"  %>
<%@ page import="javax.naming.InitialContext"  %>
<%@ page import="javax.naming.Context"  %>
<%@ page import="javax.naming.InitialContext"  %>
<%@ page import="javax.servlet.http.HttpSession"  %>
<%@ page import="javax.sql.DataSource"  %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 페이지</title>
</head>
<body>

<table border=1 align="center">
<tr><td><a href="index.jsp">로그아웃</a></td>
<td><a href="info.jsp">사용자 정보 수정</a></td>
<td><a href="try.jsp">수강신청 입력</a></td>
<td><a href="delete.jsp">수강신청 삭제</a></td>
<td><a href="check.jsp">수강신청 조회</a></td></tr>

</table>
<a href="index2.jsp">home</a>
<% // 1. 드라이버 연결 
Class.forName("oracle.jdbc.driver.OracleDriver");
String []cid=new String[20];
String []cname=new String[20];
String []cno=new String[20];
int []cunit=new int[20];
String []cno2=new String[20];
String []cid2=new String[20];
String []sid=new String[20];

int i=0,j=0;
try{ String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
// 2. DB와 연결  210.94.199.20
Connection conn = DriverManager.getConnection(url, "hr", "hrr"); 
// 3. 쿼리를 전송할 Statement 객체를 생성
Statement stmt = conn.createStatement();
// 4. SQL문 입력(executeUpdate이용)
String strSQL = "select * from course"; 
PreparedStatement pstmt = conn.prepareStatement(strSQL); 
ResultSet rs = pstmt.executeQuery();
while(rs.next()) {
	cname[i]= rs.getString("c_name");
	cid[i]=rs.getString("c_id");
	cno[i]=rs.getString("c_id_no");
	cunit[i]=rs.getInt("c_unit");
	i++;
	}
// 5. 연결 완료 후 종료 
stmt.close(); conn.close(); } catch (SQLException e) { e.printStackTrace(); }
%>

<table border=1 align="center">
<caption align="center">수강신청하세용</caption>
<% 
			out.print("ddd");
			for(int l=0;l<9;l++){
out.print("ddd");
%>
<tr><td><%=cid[l] %></td><td><%=cname[l] %></td><td><%=cunit[l] %></td><td><%=cno[l] %></td>
<td><form action="/webproject/BoardServlet" method="post"><input type="submit" value="Cregit" name="submit">
<input type="hidden" value=<%=cid[l] %> name="cid"><input type="hidden" value=<%=cno[l] %> name="cno"></form></td></tr>
<%}%>

</table>
	
</body>

</html>