<%@ page import="com.common.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>page 이동 후 page 영역 속성 값 읽기</title>
</head>
<body>
<%
    // page 영역에서 속성 값을 가져옴 (형변환을 하지 않았음)
    // 가져오려는 속성이 존재하지 않으면 getAttribute() 메서드가 null 을 반환하고
    // null 을 int 타입 변수에 담으려 시도하면 NullPointerException 이 발생함
    Object pInteger = pageContext.getAttribute("pageInteger");
    Object pString = pageContext.getAttribute("pageString");
    Object pPerson = pageContext.getAttribute("pagePerson");
%>

<ul>
    <%-- 값을 화면에 출력할 때 null이 아닌지 확인 --%>>
    <li> Integer 객체 : <%= (pInteger == null) ? "값 없음" : pInteger %></li>
    <li> String 객체 : <%= (pString == null) ? "값 없음" : pString %></li>
    <li> Person 객체 : <%= (pPerson == null) ? "값 없음" : ((Person)pPerson).getName() %></li>
</ul>
</body>
</html>
