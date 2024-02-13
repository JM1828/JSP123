<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- 변수 선언 --%>
<c:set var="scopeVar" value="Page Value"/>
<c:set var="scopeVar" value="Request Value" scope="request"/>
<c:set var="scopeVar" value="Session Value" scope="session"/>
<c:set var="scopeVar" value="Application Value" scope="application"/>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - remove</title>
</head>
<body>
<h2>출력</h2>
<ul>
  <li>scopeVar : ${scopeVar}</li>
  <li>requestVar scopeVar : ${requestScope.scopeVar}</li>
  <li>session scopeVar : ${sessionScope.scopeVar}</li>
  <li>application scopeVar : ${applicationScope.scopeVar}</li>
</ul>

<h2>session 영역에서 삭제하기</h2>
<c:remove var="scopeVar" scope="session"/>
<ul>
  <li>session scopeVar : ${sessionScope.scopeVar}</li>
</ul>

<h2>scope 지정 없이 삭제</h2>
<c:remove var="scopeVar"/>
<ul>
  <li>scopeVar : ${scopeVar}</li>
  <li>requestVar scopeVar : ${requestScope.scopeVar}</li>
  <li>application scopeVar : ${applicationScope.scopeVar}</li>
</ul>
</body>
</html>
