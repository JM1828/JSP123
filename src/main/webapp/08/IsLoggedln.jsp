<%@ page import="com.util.JSFunction" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if (session.getAttribute("UserId") == null) { // (1)
        JSFunction.alertLocation("로그인 후 글작성 가능함", // (20
                "../06/LoginForm.jsp", out);
        return;
    }
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

</body>
</html>
