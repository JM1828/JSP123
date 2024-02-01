<%@ page import="java.util.Map" %>
<%@ page import="com.common.Person" %>
<%@ page import="java.util.Set" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>application 영역</title>
</head>
<body>
<h2>application 영역의 속성 읽기</h2>
<%
    // application 영역에 저장한 maps 속성값을 읽어서 원래 형태인 Map<String, Person> 타입 변수에 저장
    Map<String, Person> maps = (Map<String, Person>) application.getAttribute("maps");
    // Map 컬렉션에 담긴 데이터를 확인하려면 key 들을 알아 내야함 그래서 keySet()으로 얻어옴
    Set<String> keys = maps.keySet();
    // 확장 for 문에서 모든 키에 해당하는 값들을 하나씩 꺼내서 출력
    for (String key : keys) {
        // Map 에 저장된 객체를 꺼낼 때는 get()을 사용함
        Person person = maps.get(key);
        out.print(String.format("이름 : %s, 나이 : %d<br/>", person.getName(), person.getAge()));
    }
%>
</body>
</html>
