
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    // request 내장 객체로 전송된 매개변수를 얻어옴
    String id = request.getParameter("user_id");
    String pwd = request.getParameter("user_pwd");
    // 회원 인증을 진행 (아직 DB 연동법을 배우지 않았기 떄문에 아이디와 패스워드를 임의로 입력)
    // equalsIgnoreCase (대소문자 상관없음), equals(대소문자 구별함)
    if (id.equalsIgnoreCase("must") && pwd.equals("1234")){
        response.sendRedirect("ResponseWelcome.jsp");
    }
    // 실패시 request 내장 객체를 통해 로그인 페이지, 즉 ResponseMain.jsp 로 포워드(forward(전달))됨
    else {
        request.getRequestDispatcher("ResponseMain.jsp?loginErr=1").forward(request,response);
    }
%>
</body>
</html>
