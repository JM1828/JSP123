<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int pInteger2 = (Integer) (pageContext.getAttribute("pageInteger"));
    //String pString2 = pageContext.getAttribute("pageString").toString();
    Person pPerson2 = (Person) (pageContext.getAttribute("pagePerson"));
%>
<ul>

    <li>Include 페이지 int : <%= pInteger2 %></li>
    <%-- 직접 출력 (저장한 객체가 문자열이거나 기본 타입의 래퍼 클래스라면 별도의 형변환 없이 출력해도 됨 --%>
    <li>String 객체 : <%= pageContext.getAttribute("pString") %></li>
    <li>Include 페이지 person : <%= pPerson2.getName()%>, <%= pPerson2.getAge() %></li>
</ul>
