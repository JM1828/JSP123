<%@ page import="com.common.Person" %> <%-- 외부 클래스인 common.Person을 사용하기 위해 임포트 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // pageContext 객체를 통해 page 영역에 속성값을 저장
    pageContext.setAttribute("pageInteger", 1000);
    pageContext.setAttribute("pageString", "페이지 영역의 문자열");
    pageContext.setAttribute("pagePerson", new Person("한석봉", 99));
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>page 영역</title>
</head>
<body>
<h2>page 영역의 속성값 읽기</h2>
<%
    // 모든 속성이 Object 타입으로 저장되어 있으므로 다시 원래의 타입으로 형변환후 저장
    int pInteger = (Integer) (pageContext.getAttribute("pageInteger"));
    // String 타입인 경우 toString() 메서드를 통해 문자열로 변환후 출력할 수도 있음
    String pString = pageContext.getAttribute("pageString").toString();
    Person pPerson = (Person) (pageContext.getAttribute("pagePerson"));
%>
<ul>
    <%-- Person 은 DTO 라서 멤버 변수가 private으로 선언 되어있으므로 게터 메서드를 이용 --%>
    <li>Integer 객체 : <%= pInteger %></li>
    <li>String 객체 : <%= pString %></li>
    <li>Person 객체 : <%= pPerson.getName()%>, <%= pPerson.getAge() %></li>
</ul>
<%-- include 지시어로 다른 jsp 파일 포함 말 그대로 "포함" 관계이므로 같은 페이지가 됨--%>
<h2>include 된 파일에서 page 영역 읽어오기</h2>
<%@include file = "PageInclude.jsp" %>

<%-- a 태그로 감싼 링크를 클릭하면 다른 페이지로 이동하게 됨 (이전 page영역은 소멸됨) --%>
<h2>page 이동 후 page 영역 읽어오기</h2>
<a href="PageLocation.jsp">PageLocation.jsp 바로가기</a>
</body>
</html>
