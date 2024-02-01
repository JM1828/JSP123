<%@ page import="com.common.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
    <h2>포워드 전달된 페이지</h2>
    <h4>RequestMain 파일의 리퀘스트 영역 속성 읽기</h4>
<%
    // request 영역에 저장된 속성들을 읽어와서 출력
    // 여기서 불러오는 속성들은 RequestMain.jsp 에서 저장한 것들
    // 포워드를 해도 request 영역이 공유되므로 문제없이 출력
    Person pPerson = (Person) request.getAttribute("requestPerson");
%>
<ul>
    <li>String 객체 : <%= request.getAttribute("requestString") %></lI>
    <li>Person 객체 : <%= pPerson.getName() %> <%= pPerson.getAge() %></lI>
</ul>

<h4>매개변수로 전달된 값 출력하기</h4>
<%
    // 포워드 하면서 쿼리스트링으로 전달한 매개변수의 값을 출력
    // 매개변수로 전돨된 값 중 한글이 포함되어 UTF-8로 인코딩
    request.setCharacterEncoding("UTF-8");
    out.println(request.getParameter("paramHan"));
    out.println(request.getParameter("paramEng"));
%>
</body>
</html>
