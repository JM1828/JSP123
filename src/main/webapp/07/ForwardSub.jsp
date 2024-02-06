<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>액션태그 - forward Sub</title>
</head>
<body>
<h2>포워드 결과</h2>
<ul>
<%-- page 영역과 request 영역에 저장한 속성값을 출력하려 시도 --%>
  <li>page 영역 : <%=pageContext.getAttribute("pAttr")%></li>
  <li>request 영역 : <%=request.getAttribute("rAttr")%></li>
</ul>
</body>
</html>
