<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // 1번 방법 : 세션에 있는 user 정보 삭제
    // removeAttribute() : 인수로 지정한 속성을 삭제하는 메서드
//    session.removeAttribute("UserId");
//    session.removeAttribute("UserName");

    // 2번 방법 : 모든 속성 한꺼번에 삭제
    // invalidate() : 세션 자체를 무효화 하는 메서드(session 영역의 모든 속성을 한거번에 삭제)
    session.invalidate();

    // 속성 삭제 후 페이지 이동
    response.sendRedirect("LoginForm.jsp");
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

</body>
</html>
