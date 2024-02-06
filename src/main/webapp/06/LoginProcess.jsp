<%@ page import="com.membership.MemberDAO" %>
<%@ page import="com.membership.MemberDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  // 로그인 폼에서 전송된 아이디와 패스워드를 request 내장 객체를 통해 받음
  String userId = request.getParameter("user_id");
  String userPwd = request.getParameter("user_pwd");

  // MemberDAO 객체를 생성
  MemberDAO dao = new MemberDAO();
  // 입력한 아이디와 패스워드를 인수로 getMemberDTO()를 호출
  // 아이디와 패스워드가 일치하다면 저장된 DTO 객체가 반환됨
  MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
  // 데이터베이스 작업은 모두 끝났으므로 연결 해제
  dao.close();

  // 로그인 성공 여부에 따른 처리
  // DTO 객체에 아이디가 담겨있다면 로그인 성공
  if (memberDTO.getId() != null) {
    // 로그인 성공했다면 session 영역에 아이디와 이름을 저장
    session.setAttribute("UserId", memberDTO.getId());
    session.setAttribute("UserName", memberDTO.getName());
    // 로그인 페이지로 이동
    response.sendRedirect("LoginForm.jsp");
  } else {
    // 로그인 실패
    // request 영역에 오류를 저장
    request.setAttribute("LoginErrMsg", "아이디/패스워드를 확인하세요");
    // 로그인 페이지로 포워드 (request 영역에 저장된 속성값은 포워드된 페이지까지 공유)
    request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
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
