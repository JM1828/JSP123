<%@ page contentType="text/html;charset=UTF-8" language="java"
         trimDirectiveWhitespaces="true" %>

<%-- 필요한 외부 클래스 임포트--%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<html>
<head>
    <title>page 지시어 - import 속성</title>
</head>
<body>
<%
    // Date와 SimpleDateFormat 클래스를 이용하여 오늘 날짜를 출력
    Date today = new Date();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyy-MM-dd");
    String todayStr = dateFormat.format(today);
    out.println("오늘 날짜 : " + todayStr); // 오늘 날짜를 출력
%>
</body>
</html>
