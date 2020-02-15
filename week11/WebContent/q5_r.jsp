<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="javax.servlet.http.HttpSession"  %>
    <%@ page import="java.util.*" %>
        <!-- 2015112120 임성두 -->
    <%
    
    HashMap<String,String>m1=new HashMap<String,String>();
    HashMap<String,String>m2=new HashMap<String,String>();
    ArrayList<HashMap>ar=new ArrayList<HashMap>();
    m1.put("loc","서울");
    m2.put("loc","부산");
    m1.put("rd","홍길동");
    m2.put("rd","홍길읍");
    m1.put("age","24");
    m2.put("age","25");
    ar.add(m1); ar.add(m2);
    
    request.setAttribute("ar",ar);
    RequestDispatcher dispatcher=request.getRequestDispatcher("q5.jsp");
    dispatcher.forward(request,response);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>




</body>
</html>