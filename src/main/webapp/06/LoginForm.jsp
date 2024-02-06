<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Session Login 구현</title>
</head>
<body>
<jsp:include page="../common/Link.jsp"></jsp:include>
<h2>로그인 페이지</h2>
<%-- request 내장 객체 영역에 LoginErrMsg 속성이 있는지 확인 후 내용을 출력 --%>
<span style="color: red; font-size: 1.2em;">
    <%= request.getAttribute("LoginErrMsg") == null ?
            "" : request.getAttribute("LoginErrMsg") %>
</span>
<%
    // session 영역에 사용자 아이디가 저장되어 있는지 확인
    if (session.getAttribute("UserId") == null) {

%>
<script>
    // validateForm() 자바스크립트로 작성한 유효성 검사 함수
    // 아이디와 패스워드중 빈값이 있다면 경고창을 띄움
    function validateForm(form) {
    if (!form.user_id.value) {
        alert("아이디를 입력하세요.");
        return false;
    }
    if (!form.user_pwd.value) {
        alert("패스워드를 입력하세요.");
        return false;
    }
    }
</script>
<form action="LoginProcess.jsp" method="post" name="LoginFrm"
    <%-- onsubmit 이벤트 핸들러가 validateForm()을 호출하도록 설정 --%>
      onsubmit="return validateForm(this);">
    아이디 : <input type="text" name="user_id" /><br />
    패스워드 : <input type="password" name="user_pwd" /><br />
    <input type="submit" value="로그인하기">
</form>
<%
    } else {
%>
    <%-- session 영역에 사용자 아이디가 저장되어 있는 경우 실행 --%>
    <%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br />
    <a href="Logout.jsp">[로그아웃]</a>
<%
    }
%>
</body>
</html>