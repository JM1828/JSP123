<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 선언부(메서드 선언) --%>
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

    <%-- 스크립틀릿(자바 코드) --%>
    <%
        int result = add(1,2);
    %>

    <%-- 표현식(변수, 메서드 호출) --%>
    덧셈결과: <%= result %> <br/>
    뺄셈결과: <%= add(10, 20) %> <br/>

</body>
</html>
