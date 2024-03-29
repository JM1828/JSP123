<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.common.Person" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JSTL - set 2</title>
</head>
<body>
<h2>List 컬렉션</h2>
<%
  ArrayList<Person> pList = new ArrayList<>(); // (1)
  pList.add(new Person("성삼문", 50)); // (2)
  pList.add(new Person("박팽년", 60));
%>
<c:set var="personList" value="<%=pList%>" scope="request"/> <%--(3)--%>
<ul>
  <li>이름 : ${requestScope.personList[0].name}</li>
  <li>이름 : ${personList[0].age}</li>
</ul>

<h2>Map 컬렉션 이용하기</h2>
<%
  Map<String, Person> pMap = new HashMap<String, Person>();
  pMap.put("personArgs1", new Person("하위지", 65));
  pMap.put("personArgs2", new Person("이개", 67));
%>
<c:set var="personMap" value="<%= pMap %>" scope="request"/>
<ul>
  <li>이름 : ${requestScope.personMap.personArgs2.name}</li>
  <li>이름 : ${personMap.personArgs2.age}</li>
</ul>
</body>
</html>
