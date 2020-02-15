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
<tr><td><a href="BoardServlet?s=logout">로그아웃</a></td>
<td><a href="info.jsp">사용자 정보 수정</a></td>
<td><a href="try.jsp">수강신청 입력</a></td>
<td><a href="delete.jsp">수강신청 삭제</a></td>
<td><a href="check.jsp">수강신청 조회</a></td></tr>

</table>
<a href="index2.jsp">home</a>
<% // 1. 드라이버 연결 





//Class.forName("oracle.jdbc.driver.OracleDriver");
Class.forName("org.mariadb.jdbc.Driver");

String []cid=new String[20];
String []cname=new String[20];
String []cno=new String[20];
int []cunit=new int[20];
String []cno2=new String[20];
String []cid2=new String[20];
String []sid=new String[20];

int i=0,j=0;
try{ //String url = "jdbc:oracle:thin:@localhost:1521:xe"; 
// 2. DB와 연결  210.94.199.20

String url = "jdbc:mariadb://localhost:3306/test?characterEncoding=UTF-8"; 
Connection conn = DriverManager.getConnection(url, "root", "staris"); 

//Connection conn = DriverManager.getConnection(url, "hr", "hrr"); 
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
	
	
	 strSQL = "select s_id,c_id_no,c_id from enroll"; 
	 pstmt = conn.prepareStatement(strSQL); 
	 rs = pstmt.executeQuery();
	 while(rs.next()) {
			cno2[j]= rs.getString("c_id_no");
			cid2[j]=rs.getString("c_id");
			sid[j]=rs.getString("s_id");
		%>sid=	<%=sid[j] %><%=j%><%
			j++;
			}
	
// 5. 연결 완료 후 종료 
stmt.close(); conn.close(); } catch (SQLException e) { e.printStackTrace(); }
String message=(String)session.getAttribute("message");
if(message!=null)
	out.print(message);
%>

<table border=1 align="center">
<caption align="top">수강신청하세용</caption>

<% int unit=0;
session.removeAttribute("message");
for1: for(int l=0;l<9;l++){ 
			for(int k=0;k<j;k++){
				if(sid[k].equals((String)session.getAttribute("id"))){
					if(cno2[k].equals(cno[l])&&cid2[k].equals(cid[l])){
						unit+=cunit[l];
						continue for1;}		
				}else{
					continue;
				}
			
			}

%>
<tr><td><%=cid[l] %></td><td><%=cname[l] %></td><td><%=cunit[l] %></td><td><%=cno[l] %></td>
<td><form action="/practiceweb/BoardServlet" method="post"><input type="submit" value="Cregit" name="submit">
<input type="hidden" value=<%=cid[l] %> name="cid"><input type="hidden" value=<%=cno[l] %> name="cno"></form></td></tr><%}session.setAttribute("unit",unit);%><%=unit %>

</table>
	
</body>

</html>