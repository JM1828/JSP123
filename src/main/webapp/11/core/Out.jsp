<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL Out</title>
</head>
<body>
<c:set var="iTag">
  i 태그는 <i>기울임</i>을 표현합니다.
</c:set>

<h4>기본 사용</h4>
<c:out value="${iTag}" />

<h2>escapeXml 속성</h2>
<c:out value="${iTag}" escapeXml="false"/>

<h2>default 속성</h2>
<c:out value="${param.name}" default="이름없음"/>
<c:out value="" default="빈 문자열도 값임"/>
</body>
</html>
