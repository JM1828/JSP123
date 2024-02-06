<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // page 영역과 request 영역에 속성을 저장
  pageContext.setAttribute("pAttr", "김유신");
  request.setAttribute("rAttr", "계백");
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<h2>액션 태그를 할용한 포워딩</h2>
<%-- ForwardSub.jsp 파일로 포워드 --%>
<jsp:forward page="ForwardSub.jsp"></jsp:forward>
</body>
</html>
