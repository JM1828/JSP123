<%@ page contentType="text/html;charset=UTF-8" language="java"
         errorPage="IsErrorPage.jsp" %> <%-- 에러 페이지 지정 --%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    // 내장 객체인 request로 부터 age 매개변수의 값을 받아와 정수로 반환
    // (매개변수가 없으므로 null값 전달되어 에러)
    int Age = Integer.parseInt(request.getParameter("age")) + 10; // 에러 발생
    out.println("10년 후 당신의 나이는" + Age + "입니다."); // 실행되지 않음
%>
</body>
</html>
