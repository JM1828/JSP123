
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
    request 내장객체는 JSP 에서 가장 많이 사용된다.
    클라이언트(브라우저)가 전송한 요청 정보를 담고 있다.

    주요 기능
    - 클라이언트와 서버의 정보 읽기
    - 클라이언트가 전송한 매개변수 읽기
    - 요청 해더 및 쿠키 정보 읽기
--%>

<html>
<head>
    <title>내장 객체 - Request</title>
</head>
<body>
    <h2>1. 클라이언트와 서버의 정보 읽기</h2>
    <%--  --%>
    <a href="RequestWebInfo.jsp?eng=Hello&han=안녕">  <%-- GET 방식으로 요청 --%>
        Gat 방식 요청
    </a>

    <form action="RequestWebInfo.jsp" method="POST">  <%-- POST 방식으로 요청 --%>
        영어 : <input type="text" name="eng" value="bye"/><br/>
        한글 : <input type="text" name="han" value="바이"/><br/>
        <input type="submit" value="POST 방식 전송">
    </form>

    <h2>2. 클라이언트의 요청 매개변수 읽기</h2>
    <form method="post" action="RequestParameter.jsp"> <%-- 다양한 input 태그 사용 --%>
        아이디 : <input type="text" name="id" value=""/><br/>
        성별 :
        <input type="radio" name="sex" value="man" />남자
        <input type="radio" name="sex" value="woman" checked="checked" />여자
        <br />
        관심사항 :
        <input type="checkbox" name="favo" value="eco" />경제
        <input type="checkbox" name="favo" value="pot" checked="checked"/>정치
        <input type="checkbox" name="favo" value="ent" />연예 <br/>
        자기소개 :
        <textarea name="intro" cols="30" rows="4"></textarea>
        <br />
        <input type="submit" value="전송하기" />
    </form>



<h2>3. HTTP 응답 해더 추가하기</h2>
<a href="RequestHeader.jsp">
    요청 헤더 정보 읽기
</a>


</body>
</html>
