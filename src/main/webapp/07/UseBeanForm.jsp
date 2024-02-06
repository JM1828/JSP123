<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>액션 태그 useBean</title>
</head>
<body>
<%-- post로 폼값을 전송 --%>
<form method="post" action="UseBeanAction.jsp">
<%-- 이름과 나이를 입력 --%>
    이름 : <input type="text" name="name">
    나이 : <input type="text" name="age">
<%-- 폼 값 전송 --%>
    <input type="submit" value="폼 전송">
</form>
</body>
</html>
