<%@ page import="com.common.Person" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // request 영역에 String 객체와 Person 객체를 저장
  request.setAttribute("requestString", "request 영역의 문자열");
  request.setAttribute("requestPerson", new Person("안중근", 31));
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>request 영역</title>
</head>
<body>
<h2>request 영역의 속성값 삭제하기</h2>
<%
    // request 영역에 저장된 속성을 삭제
    // requestString 은 당연히 정상적으로 삭제
    // requestInteger 은 존재하지 않음 삭제를 시도해도 에러는 방생하지 않음
  request.removeAttribute("requestString");
  request.removeAttribute("requestInteger");
%>
<h2>request 영역의 속성값 읽기</h2>
<%
    // 영역의 속성값을 읽어와서 출력
  Person rPerson = (Person) (request.getAttribute("requestPerson"));
%>
<ul>
  <li>String 객체 : <%= request.getAttribute("requestString") %></li>
  <li>Person 객체 : <%= rPerson.getName() %>, <%= rPerson.getAge() %></li>
</ul>

<h2>포워드 된 페이지에서 request 영역 속성 값 읽기</h2>

<%
    // RequestForward.jsp 로 포워드(현재 페이지로 들어온 요청을 다음 페이지로 보내는 기능)하는 코드
    // request 내장 객체를 통해 실제로 포워드를 수행하는 코드
  request.getRequestDispatcher("RequestForward.jsp?paramHan=한글&paramEng=English")
          .forward(request, response);
%>
</body>
</html>
