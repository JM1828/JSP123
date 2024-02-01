<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>CookieResult.jsp</title>
</head>
<body>
<h2>쿠키값 확인하기(쿠키가 생성된 이후의 페이지)</h2>
<%
    Cookie[] cookies = request.getCookies(); // 요청 헤더의 모든 쿠키 얻기
    if (cookies != null) {
        for (int i = 0; i < cookies.length; i++) {
            String cookieName = cookies[i].getName(); // 쿠키 이름 얻기
            String cookieValue = cookies[i].getValue(); // 쿠키 값 얻기
            // 화면에 출력
            out.print(String.format("쿠키명 : %s - 쿠키값 : %s<br/>", cookieName, cookieValue));
        }
    }
%>
</body>
</html>
