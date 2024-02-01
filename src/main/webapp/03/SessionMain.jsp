<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // ArrayList 컬렉션을 생성한 후 2개의 String 객체를 저장
    ArrayList<String> lists = new ArrayList<>();
    lists.add("리스트");
    lists.add("컬렉션");
    // 이 컬렉션이 통째로 session 영역에 저장
    session.setAttribute("lists", lists);
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Session 영역</title>

</head>
<body>
<%-- 세션 객체는 클라이언트가 브라우저를 닫을 때 까지 공유 가능
        세션은 클라이언트가 서버에 접속해 있는 상태 혹은 단위를 뜻한다
--%>
<%-- session 영역이 이동된 페이지에서도 공유되는지 확인하기 위한 링크 --%>
<h2>페이지 이동 후 session 영역의 속성 읽기</h2>
<a href="SessionLocation.jsp">sessionLocation.jsp 페이지 이동</a>
</body>
</html>
