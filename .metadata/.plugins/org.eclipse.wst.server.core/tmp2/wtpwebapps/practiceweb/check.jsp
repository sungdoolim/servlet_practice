<!--

  * 동국대학교 베팅형 수강신청 
  * check.jsp
  * 수강신청 확인 페이지

-->

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<title>동국대학교 서울캠퍼스 수강신청</title>
	<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
	<script>
	
	$(document).ready(function(){
	
	$("form").show("slow");
	
	$("#tip").hover(function(){
	  $("#div2").show("slow");
	  $("#tip").css('background-color', '#43A047');
	
	},function(){
	  $("#div2").slideUp("slow");
	  $("#tip").css('background-color', '#ff7f00');
	});
	
	$("#bbb1").hover(function(){	  
		  $("#bbb1").css('background-color', '#43A047');
		},function(){	 
		  $("#bbb1").css('background-color', '#ff7f00');
		});
		
	$("#bbb2").hover(function(){	  
		  $("#bbb2").css('background-color', '#43A047');
		},function(){	 
		  $("#bbb2").css('background-color', '#ff7f00');
		});
		
	$("#bbb3").hover(function(){	  
		  $("#bbb3").css('background-color', '#43A047');
		},function(){	 
		  $("#bbb3").css('background-color', '#ff7f00');
		});
		
	$("#bbb4").hover(function(){	  
		  $("#bbb4").css('background-color', '#43A047');
		},function(){	 
		  $("#bbb4").css('background-color', '#ff7f00');
		});
	
	});
	
	</script>
	
	<style type = "text/css">
		/* 배경화면을 꽉차게 설정 */
	    html {
			background: url("res/background.gif") no-repeat center center fixed;
	        -webkit-background-size: cover;
	        -moz-background-size: cover;
	        -o-background-size: cover;
	        background-size: cover;
		}
	       
		div.fixed {
			-webkit-background-size: cover;
	        -moz-background-size: cover;
	        -o-background-size: cover;
	        background-size: cover;
	  		position : fixed;
	  		top : 50px;
	  		left : 450px;
	 		width : 1040px;
	  		height : 600px;
	  		border : none;
	  		background-color : #FBF8EF;
	  		padding-top: 8px;
	        padding-bottom: 15px;
	        padding-left : 8px;
	        padding-right : 8px;
			border-radius: 15px;    
	        -moz-border-radius: 15px;    
	        -webkit-border-radius: 15px;
		}
	
		.form {
		  position: relative;
		  z-index: 1;
		}
	
		.form button {
		  font-family: "Roboto", sans-serif;
		  /* 배경색 */
		  background: #ff7f00 ;
		  /* 아래로 글자가사리지지 않음 */
		  width: 100%;
		  border: 0;
		  padding: 15px;
		  /*글씨체 색깔 */
		  color: #FFFFFF;
		  font-size: 14px;
		}
		
		.form_caja {
			width: 500px;
	        padding-top: 8px;
	        padding-bottom: 15px;
	        padding-left : 8px;
	        padding-right : 8px;
	        margin: 0 auto 20px auto;
	        background-color: #FF8C00;    
	        border-radius: 15px;    
	        -moz-border-radius: 15px;    
	        -webkit-border-radius: 15px;
	        color: #FF8C00;
	        position:fixed center;
	        overflow:hidden;
	        position : fixed;
	        top : 50px;
			left : 450px;
	  		width : 1040px;
	  		height : 600px;
	  		border :3px solid #FFFFFF;
	    }
	 
	    table { 
	    	background-color : #FBF8EF; 
	    	color : #000000; 
	    	align:center; 
	    	height : 200px; 
	    	top : 50px;
	  		left : 450px;
	  		width : 1040px;
	  		height : 600px;
	    }
	    
	    thead { 
	    	background-color: #FFDAB9; 
	    	color :#000000; 
	    	padding:4px; 
	    	line-height:30px 
	    }
	    
	    th, td {
		    padding: 10px;
		    text-align: center;
	  	}
	  	
	    tbody tr:nth-child(even) { background: #FBF8EF }
	    tbody tr:nth-child(odd) { background: #FFF }
	</style>
	</head>
	
	<body>
		<div style="border :1px solid none; width : 400px; height : 150px;" class="form">
			<a href = "main.jsp"><img width = 400px height = 150px src = "res/dgl.png"></a>
			<center> 
				<div>
				<img width = 45px height = 45px src = "res/아코.png">
				<%=(String)session.getAttribute("major") %>과 
				<%=(String)session.getAttribute("name") %> 
				 님 환영합니다.
				 </div>
			</center>
			
			<form style="display:none; overflow:hidden; position:realative"><br><br>
			 	<button type="button" id="bbb1" onclick="location.href='try.jsp' " >수강신청 입력</button>
			    <button type="button" id="bbb2" onclick="location.href='delete.jsp' ">수강신청 삭제</button>
			    <button type="button" onclick="location.href='check.jsp' " style="background-color : #43A047">수강신청 조회</button><br><br><br><br>
			    <button type="button" id="tip">수강신청 유의사항</button>
			    <br><br><Br><br>
			    <button type="button" id="bbb3" onclick="location.href='info.jsp' ">마이페이지</button>
			    <button type="button" id="bbb4" onclick="location.href='index.jsp' ">로그아웃</button>
			</form>
		</div>
		
		<%
		String Sid=(String)session.getAttribute("id");
		String []sid=new String[40];
		String []cid=new String[40];
		int i=0,i2=0;
		String []c_id=new String[40];
		String []c_name=new String[40];
		String []c_no=new String[40];
		int []c_unit=new int[40];
		Class.forName("oracle.jdbc.driver.OracleDriver");
		//Class.forName("org.mariadb.jdbc.Driver");
		
		try{
			 String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe"; 
		// 2. DB와 연결  
		// String url = "jdbc:mariadb://localhost:3306/test?characterEncoding=UTF-8"; 
		//Connection conn = DriverManager.getConnection(url, "root", "staris"); 
		Connection conn = DriverManager.getConnection(url, "hr", "hrr"); 
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
				
			%>
			
			<% 
			for (int j=0;j<i;j++){
				if(sid[j].equals(Sid)){
					
					 strSQL = "select c_id,c_name,c_id_no,c_unit from course where c_id=?"; 	
					 pstmt = conn.prepareStatement(strSQL); 
					 pstmt.setString(1,cid[j]);
					 
					 rs=pstmt.executeQuery();
					 while(rs.next()){
						 c_id[i2]=rs.getString("c_id");
						 c_name[i2]=rs.getString("c_name");
						 c_no[i2]=rs.getString("c_id_no");
						 c_unit[i2]=rs.getInt("c_unit");
						 i2++;
					 }
				}
			}	
		%> <%} 
		catch (SQLException e) { e.printStackTrace(); }
		 %>
		<div class="form_caja">
			<table align="center" style="overflow:hidden; position:realative">
				<thead>
					<tr>
						<td>학수번호</td>
						<td>과목명</td>
						<td>시간</td>
						<td>학점</td>
					</tr>
				</thead>
				
				<% int unit=0;for(int k=0;k<i2;k++){%>
					<tr>
						<td><%=c_id[k] %></td>
						<td><%=c_name[k] %></td>
						<td><%=c_no[k] %></td>
						<td><%=c_unit[k] %></td>
					</tr>
				<%unit+=c_unit[k];} session.setAttribute("unit",unit);%>
			</table>
		</div>
		
		<div class="fixed" id="div2" style="display:none">
			<center>
			    <fieldset>
			    	<legend><h1>동국대학교 서울캠퍼스 수강신청 유의사항</h1></legend>
			        <ul>
			        	<li>마일리지는 수강신청 가능 학점의 4배를 제공합니다.</li><br><br>
			            <li>한 과목씩 마일리지를 베팅한 후, 과목옆에 있는 수강신청을 누르면 해당 수강과목신청이 완료됩니다.</li><br><br>
			            <li>동일시간대의 교과목은 마일리지 베팅이 불가합니다.</li><br><br>
			            <li>동시접속이 가능합니다.</li><br><br>
			        </ul>
			        <h3>마일리지를 적절히 배분하여 성공적인 수강신청이 될수있기를 바랍니다.</h3><br><br>
			        <h4>담당자 : 김민선, 임성두, 최재원</h4><br>
			    </fieldset>
		    </center>
		</div>
	</body>
</html>