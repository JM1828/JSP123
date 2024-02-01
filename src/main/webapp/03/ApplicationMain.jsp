<%@ page import="com.common.Person" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.LinkedHashMap" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Application 영역</title>
</head>
<body>
  <%--
    웹 애플리케이션 당 하나의 application 객체 생성
    서버를 닫기 전까지 계속 유지 된다.
    클라이언트가 요청하는 모든 페이지가 appication 객체를 공유함
  --%>

  <h2>application 영역의 공유</h2>
<%
    // HashMap 컬렉션을 생성한 후 두개의 Person 객체를 저장
    // HashMap 은 순서를 보장해주지 않음
    // LinkedHashMap 는 순서를 보장함
  Map<String, Person> maps = new LinkedHashMap<>();
  maps.put("actor1" , new Person("제우스", 30));
  maps.put("actor2" , new Person("오너", 28));
    maps.put("actor3" , new Person("페이커", 30));
    maps.put("actor4" , new Person("구마유시", 28));
    maps.put("actor5" , new Person("케리아", 28));

  // 컬렉션 채로 application 영역에 저장
  application.setAttribute("maps", maps);
%>
application 영역에 속성이 저장되었습니다.
</body>
</html>
