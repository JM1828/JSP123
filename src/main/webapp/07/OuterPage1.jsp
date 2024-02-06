<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Outer Page</title>
</head>
<body>
<h2>외부 파일 1</h2>
<%
    // String 타입 변수 선언
  String newVar1 = "고구려 세운 동명왕";
%>

<ul>
    <%-- page와 request 내장 객체 영역에서 속성을 읽어와 출력하는 파일 --%>
  <li>page 영역 속성 : <%= pageContext.getAttribute("pAttr") %></li>
  <li>request 영역 속성 : <%= request.getAttribute("rAttr") %></li>
</ul>
</body>
</html>
