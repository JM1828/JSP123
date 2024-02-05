<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>내장 객체 - Response</title>
</head>
<body>
<%--
    response 내장객체: 요청에대한 응답을 브라우저로 보내주는 역할
    기능
        - 페이지 이동(리다이렉트)
        - HTTP 헤더에 응답헤더 추가
--%>
<h2>1. 리다이렉트</h2>
<h2>로그인 폼</h2>
<%
    // 실패 여부를 알려주는 매개변수
    String loginErr = request.getParameter("loginErr");
    // 값이 들어있다면 로그인 실패
    if (loginErr != null){
        out.println("로그인 실패");
    }
%>
<%-- 아이디와 패스워드를 입력받는 form --%>
<form action="ResponseLogin.jsp" method="post">
    아이디: <input type="text" name="user_id"><br/>
    패스워드: <input type="text" name="user_pwd"><br/>
    <input type="submit" value="로그인">
</form>

<h2>2. HTTP 응답 헤더 설정하기</h2>
<%-- 응답 헤더 추가를 위한 입력 form --%>
<form action="ResponseHeader.jsp" mathod="get">
    <%-- 헤더에 추가할 데이터의 형식별로 value 속성 미리 입력 --%>
    날짜 형식: <input type="text" name="add_date" value="2024-01-31 12:30" /><br/>
    숫자 형식: <input type="text" name="add_int" value="1111" /><br/>
    문자 형식: <input type="text" name="add_str" value="jsp" /><br/>
    <input type="submit" value="응답헤더 설정 & 출력">
</form>
</body>
</html>
