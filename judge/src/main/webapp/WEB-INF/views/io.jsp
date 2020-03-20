<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>

<form action="/judge/inputcode" method="post">

<textarea rows="10" cols="50" name="code"></textarea>
<input type="submit">
</form>
<a href="/judge">home</a>
</body>
</html>
