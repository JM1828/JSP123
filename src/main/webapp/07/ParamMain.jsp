<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String pVal = "방랑시인";
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>액션태그 - param</title>
</head>
<body>
<%-- request 영역에 저장할 자바빈즈를 생성 --%>
<jsp:useBean id="person" class="com.common.Person" scope="request"/>
<%-- 맴버 변수 name과 age의 값을 설정 --%>
<jsp:setProperty name="person" property="name" value="홍길동"/>
<jsp:setProperty name="person" property="age" value="20"/>
<%--<jsp:forward> 액션 태그를 이용해 ParamForward.jsp로 포워딩--%>
<%--이때 퀴르스트링으로 param1 매개변수를 함께 전달--%>
<jsp:forward page="ParamForward.jsp?param1=파라미터">
<%--<jsp:param> 액션 태그로 또다른 매개변수 param2와 param3를 전달--%>
    <jsp:param name="param2" value="경기도"/>
    <jsp:param name="param3" value="<%=pVal%>"/>
</jsp:forward>


</body>
</html>
