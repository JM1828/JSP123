<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<table border="1" width="90%">
    <tr>
        <td align="center">
        <%-- 로그인 여부에 따른 메뉴 변화 --%>
            <% if (session.getAttribute("UserId") == null) {

                %>
                <a href="../06/LoginForm.jsp">로그인</a> <%-- 로그아웃 상태면 [로그인]링크를 출력 --%>
            <%
                }else {
            %>
            <a href="../06/Logout.jsp">로그아웃</a> <%-- 로그인 상태면 [로그아웃]링크를 출력 --%>
            <%
                }
            %>
        <%-- 게시판으로 가는 링크 --%>
            &nbsp;&nbsp;&nbsp;
            <a href="../08/List.jsp">게시판(페이징 x)</a>
            &nbsp;&nbsp;&nbsp;
            <a href="../09/List.jsp">게시판(페이징 o)</a>
        </td>
    </tr>
</table>
</body>
</html>
