<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2024-01-31
  Time: 오전 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 선언부 --%>
<%!
    public int add(int num1, int num2) {
        return num1 + num2;
    }
%>
<html>
<head>
    <title>Title</title>
</head>
<body>

    <%-- 스크립틀릿 --%>
    <%
        int result = add(1,2);
    %>

    <%-- 표현식 --%>
    덧셈결과: <%= result %> <br/>
    뺄셈결과: <%= add(10, 20) %> <br/>

</body>
</html>
