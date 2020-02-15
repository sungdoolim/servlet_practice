<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title></title>
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
<% String id = (String) session.getAttribute("id");
String name = (String) session.getAttribute("name");
String pw = (String) session.getAttribute("pw");
String college = (String) session.getAttribute("college");
String address = (String) session.getAttribute("address");
out.println("<h1>마이페이지</h1>");
out.println(id + "님 로그인 중");
out.println(id+"님의 password 는 "+pw+"입니다<br>");
out.println(id+"님의 주소 는 "+address+"입니다");
out.println("밑 폼을 작성하여 정보를 수정가능 합니다");%>

<%String a=(String)request.getAttribute("message"); 
if(a!=null)out.print(a);%>
<form action="/practiceweb/BoardServlet" method="post" >	
<input type="hidden"  name="id" value=<%=id %> >
<table border="1" align="center">
 <tr>
   <td class="label"> 비밀번호 </td>
    <td class="field"><input type="password" name="pw"></td>
     </tr>
      <tr> 
      <td class="label"> 이름 </td>
       <td class="field"><input type="text" name="name" ></td>
        </tr>
         <tr>
          <td class="label"> college </td>
           <td class="field"><input type="text" name="college" ></td> 
           </tr>
            <tr>
             <td class="label"> 주소 </td>
              <td class="field"><input type="text" name="address"></td> 
              </tr> 
            <tr>
             <td class="label"> 지도 교수 배정 희망 </td>
              <td class="field"><input type="radio" name="prof" value="yes">희망<input type="radio" name="prof" value="no">비희망</td> 
              </tr> 
                     <!--    <input type="hidden" name="action" value="${action}"> --> 
           <tr>    <td colspan="2" align="center"><input type="submit" name="submit" value="update"> &nbsp;&nbsp;&nbsp;
                <input type="reset" value=" 취 소 "></td></tr>
                 </table> 
</form>
</body>
</html>