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

<title>Insert title here</title>
</head>
<body>
<table border="1" align="center">
<tr><td><a href="BoardServlet?s=logout">로그아웃</a></td>
<td><a href="info.jsp">사용자 정보 수정</a></td>
<td><a href="try.jsp">수강신청 입력</a></td>
<td><a href="delete.jsp">수강신청 삭제</a></td>
<td><a href="check.jsp">수강신청 조회</a></td></tr>

</table>
<%String Sid=(String)session.getAttribute("id");
String []sid=new String[20];
String []cid=new String[20];
int i=0,i2=0;
String []c_id=new String[20];
String []c_name=new String[20];
String []c_no=new String[20];


		
		
Class.forName("org.mariadb.jdbc.Driver");

//try{// String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe"; 
// 2. DB와 연결  
		
		
//Class.forName("oracle.jdbc.driver.OracleDriver");

try{// String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe"; 
// 2. DB와 연결  
//Connection conn = DriverManager.getConnection(url, "hr", "hrr"); 
String url = "jdbc:mariadb://localhost:3306/test?characterEncoding=UTF-8"; 
Connection conn = DriverManager.getConnection(url, "root", "staris"); 

// 3. 쿼리를 전송할 Statement 객체를 생성
Statement stmt = conn.createStatement();
// 4. SQL문 입력(executeUpdate이용)
String strSQL = "select c_id,s_id from enroll"; 
PreparedStatement pstmt = conn.prepareStatement(strSQL); 
ResultSet rs = pstmt.executeQuery();
while(rs.next()) {
	sid[i]=rs.getString("s_id");
	
	cid[i]=rs.getString("c_id");
	i++;
	}
	
	
// 5. 연결 완료 후 종료 
//stmt.close(); conn.close(); 


%>

<% 

for (int j=0;j<i;j++){
	if(sid[j].equals(Sid)){
		
		 strSQL = "select c_id,c_name,c_id_no from course where c_id=?"; 	
		 pstmt = conn.prepareStatement(strSQL); 
		 pstmt.setString(1,cid[j]);
		 
		 rs=pstmt.executeQuery();
		 while(rs.next()){
			 c_id[i2]=rs.getString("c_id");
			 c_name[i2]=rs.getString("c_name");
			 c_no[i2]=rs.getString("c_id_no");
			 i2++;
		 }
	}
}	
	%>
	<%} 
catch (SQLException e) { e.printStackTrace(); }

 %>
 
<a href="index2.jsp">home</a>


<table border="1" align="center"><% for(int k=0;k<i2;k++){%>
<tr><td><%=c_id[k] %></td><td><%=c_name[k] %></td><td><%=c_no[k] %></td><td>
<form action="/practiceweb/BoardServlet" method="post">
<input type="hidden" value=<%=c_id[k] %> name="cid">
<input type="hidden" value=<%=c_no[k] %>name="cno">
<input type="hidden" value=<%=c_name[k] %>name="cname">
<input type="submit" value="delete" name="submit">
</form></td></tr>
<%}%>
</table>


</body>
</html>