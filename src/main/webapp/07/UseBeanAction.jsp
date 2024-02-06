<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>액션태그 useBean</title>
</head>
<body>
<h2>액션 태그로 폼값 한 번에 받기</h2>
<%-- Person 클래스로 자바빈즈를 생성 (scope 속성을 설정하지 않아서 page영역에 저장) --%>
<jsp:useBean id="person" class="com.common.Person"/>
<%-- <jsp:setProperty>로 폼값을 자바빈즈로 설정 property 멤버 변수를 와일드카드(*)를 사용 --%>
<jsp:setProperty name="person" property="*"/>

<h2>getProperty 액션 태그로 자바빈즈 속성 가져오기</h2>
<ul>
<%-- 방금 설정한 값이 제대로 들어 있는지 확인 --%>
    <li>이름 : <jsp:getProperty name="person" property="name"/></li>
    <li>나이 : <jsp:getProperty name="person" property="age"/></li>
</ul>
</body>
</html>
