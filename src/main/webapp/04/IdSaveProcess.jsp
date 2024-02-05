<%@ page import="com.util.JSFunction" %>
<%@ page import="com.util.CookieManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  // request 내장 객체를 통해 전송된 폼값을 받기
  String user_id = request.getParameter("user_id");
  String user_pw = request.getParameter("user_pw");
  String save_check = request.getParameter("save_check");

  System.out.println(user_id + ":: " + user_pw);
  // 아이디와 패스워드를 하드코딩된 값과 비교 (사용자 인증)
  if ("must".equals(user_id) && "1234".equals(user_pw)) {
    // 로그인 성공
      if (save_check != null && save_check.equals("Y")) { // [아이디 저장하기] 체크 확인
        CookieManager.makeCookie(response, "loginId", user_id, 86400); // 쿠키 생성
      } else {
        CookieManager.deleteCookie(response, "loginId"); // 기존 쿠키 삭제
      }
      // 로그인 성공 알림창을 띄워준 후 메인 페이지로 이동
      JSFunction.alertLocation("로그인에 성공했습니다.", "IdSaveMain.jsp", out);
  } else { // 로그인 실패
    // 로그인 실패 알림창을 듸워준 후 이전 페이지로 돌아감
    JSFunction.alertBack("로그인에 실패했습니다.", out);
  }
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

</body>
</html>
