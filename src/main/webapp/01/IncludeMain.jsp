<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="IncludeFile.jsp"%> <%-- 다른 JSP 파일 포함 --%>
<html>
<head>
    <title>Include 지시어</title>
</head>
<body>
<%
    out.println("오늘 날짜 : " + today + "</br>");
    out.println("내일 날짜 : " + tomorrow);
%>
</body>
</html>
