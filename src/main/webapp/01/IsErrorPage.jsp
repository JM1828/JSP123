<%@ page contentType="text/html;charset=UTF-8" language="java"
         isErrorPage="true" %>
<%-- isErrorPage 속성에 true를 지정해줘야만 발생된 에러 내용을 그대로 넘겨받을 수 있음 --%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<h2>
    서비스 중 일시적 오류가 발생했습니다.
</h2>
<p>
    <%-- exception 내장 객체로부터 발생한 예외의 타입과 메세지를 얻어옴 --%>
    오류명 : <%= exception.getClass().getName()%>
    오류 메세지 : <%= exception.getMessage()%>
</p>
</body>
</html>
