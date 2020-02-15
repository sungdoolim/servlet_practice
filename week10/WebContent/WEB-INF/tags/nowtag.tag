<%@ tag language="java" pageEncoding="UTF-8"%>
<%@tag import="java.util.Calendar" %>
<!-- 2015112120임성두 -->
now.tag의 내용<br>
<%Calendar c=Calendar.getInstance();%>
<%=c.get(Calendar.YEAR)%>년
<%=c.get(Calendar.MONTH)+1%>월
<%=c.get(Calendar.DATE)%>일<br>
