<%@ page import="java.util.Enumeration" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>내장 객체 - request</title>
</head>
<body>
<h2>3. 요청 헤더 정보 출력하기</h2>
<%
    // getHeaderNames() 메서드는 모든 요청 헤더의 이름을 반환함
    Enumeration headers = request.getHeaderNames();
    // hasMoreElements() 를 이용해 출력할 요청 헤더명이 더있는지 확인
    while (headers.hasMoreElements()) {
        // 헤더명이 더 있다면 요청 헤더의 이름을 얻어온 다음 getHeader() 메서드에 헤더명을 건네 헤더값을 얻어옴
        String headerName = (String) headers.nextElement();
        String headerValue = request.getHeader(headerName);
        out.print("헤더명: " + headerName + ", 헤더값: " + headerValue + "<br/>");
    }
%>
<p>이 파일을 직접 실행하면 referer 정보는 출력되지 않습니다.</p>
</body>
</html>
