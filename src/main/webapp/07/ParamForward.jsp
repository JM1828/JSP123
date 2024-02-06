<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>액션태그 - param forward</title>
</head>
<body>
<%--<jsp:useBean> 액션 태그를 이용해 이전 페이지에서 request 영역에 자바빈즈를 가져옴--%>
<jsp:useBean id="person" class="com.common.Person" scope="request"/>
<h2>포워드 된 페이지에서 매개변수 확인</h2>

<ul>
<%-- <jsp:getProperty> 액션 태그를 이용해 메머 변수의 값을 가져와 출력 --%>
  <li><jsp:getProperty name="person" property="name"/></li>
  <li><jsp:getProperty name="person" property="age"/></li>
<%--매개변수로 전달된 값 3개를 출력--%>
<%--쿼리스트링으로 전달한 매개변수와 <jsp:param>액션 태그로 전달한 매개변수를 구분없이 모두--%>
<%--request 내장 객체의 getParameter()를 사용--%>
  <li>본명 : <%=request.getParameter("param1")%></li>
  <li>출생 : <%=request.getParameter("param2")%></li>
  <li>특징 : <%=request.getParameter("param3")%></li>
</ul>
<%--ParamInclude.jsp를 인클루드, 매개변수 loc1,loc2 전달--%>
<jsp:include page="ParamInclude.jsp">
    <jsp:param name="loc1" value="제주도"/>
    <jsp:param name="loc2" value="탐라국"/>
</jsp:include>
</body>
</html>
