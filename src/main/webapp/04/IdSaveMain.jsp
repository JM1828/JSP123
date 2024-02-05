<%@ page import="com.util.CookieManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  로그인 시 ID를 쿠키를 통해 저장
  util에 있는 클래스를 이용해서 편리하게 코드를 재사용하는 방법
--%>
<%
  // CookieManager 클래스를 이용하여 이름이 loginId인 쿠키를 읽어와 loginId 변수에 저장
  String loginId = CookieManager.readCookie(request, "loginId");
  String cookieCheck = ""; // cookieCheck 변수의 값을 결정
  if (!loginId.equals("")) { // 쿠키에 저장된 아이디가 있다면
    cookieCheck = "checked"; // cookieCheck에 "checked"가 대입된다
  }
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cookie - 아이디 저장하기</title>
</head>
<body>
<h2>로그인 페이지</h2>
<form action="IdSaveProcess.jsp" method="post">
  <%-- [아이디] 입력창의 기본값 --%>
  아이디 : <input type="text" name="user_id" value="<%= loginId %>">
    <%-- [아이디 저장하기] 체크박스에 checd 속성을 부여 --%>
  <input type="checkbox" name="save_check" value="Y" <%= cookieCheck %>>
    아이디 저장하기
  <br>
  패스워드 : <input type="text" name="user_pw">
  <br>
  <input type="submit" value="로그인">
</form>
</body>
</html>
