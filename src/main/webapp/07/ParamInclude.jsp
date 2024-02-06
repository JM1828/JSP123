<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<h2>인클루드 된 페이지에서 매개변수 확인</h2>
<ul>
<%--매개변수로 전달된 loc1과 loc2를 화면에 출력--%>
    <li><%=request.getParameter("loc1")%></li>
    <li><%=request.getParameter("loc2")%></li>
</ul>
</body>
</html>
