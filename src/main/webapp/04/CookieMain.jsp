<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
    쿠키는 웹사이트에 접속했을 때 사용자를 기억하는 수단
    쿠키는 처음 만들어진 시점에서 서버는 쿠키를 읽을 수 없다.

    name : 쿠키 이름
    value : 쿠키 값
    domain : 쿠키를 적용할 도메인
    path : 쿠키를 적용할 경로
    maxAge : 쿠키 유지기간(단위 : 초) 하루 : 86400

    name, value은 문자열을 입력하는데 , ; space = 포함 x
    path는 특정 경로 입력하면 그 하위 경로도 포함
    age를 설정 안하면 브라우저 종료될때 쿠키 만료된다.
    getAge age 설정안했을 때 -1 반환한다.
--%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cookie</title>
</head>
<body>
<h2>1. 쿠키(Cookie) 설정</h2>
<%
    Cookie cookie = new Cookie("myCookie", "쿠키맛나요"); // 쿠키 생성
    cookie.setPath(request.getContextPath()); // 경로를 컨텍스트 루트로 설정
    cookie.setMaxAge(3600); // 유지 기간을 1시간으로 설정
    response.addCookie(cookie); // 응답 헤더에 쿠키 추가
%>

<h2>2. 쿠키 설정 직후 쿠키값 확인하기</h2>
<%
    Cookie[] cookies = request.getCookies(); // 요청 헤더의 모든 쿠키 얻기
    if (cookies != null) {
        for (Cookie c : cookies) {
            String cookieName = c.getName(); // 쿠키 이름 얻기
            String cookieValue = c.getValue(); // 쿠키 값 얻기
            // 화면에 출력
            out.print(String.format("%s : %s<br/>", cookieName, cookieValue));
        }
    }
%>

<h2>3. 페이지 이동 후 쿠키값 확인하기</h2>
<a href="CookieResult.jsp"> 다음 페이지에서 쿠키값 확인하기</a>
</body>
</html>
