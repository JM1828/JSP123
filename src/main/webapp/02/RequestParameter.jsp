<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>내장객체 - Request</title>
</head>
<body>
<%
    request.setCharacterEncoding("UTF-8"); // 한국어 깨짐현상 발생시 UTF-8로 인코딩
    String id = request.getParameter("id"); // 전송된 값이 하나라면 getParameter 메서드로 받을 수 있음
    String sex = request.getParameter("sex");
    String[] favo = request.getParameterValues("favo"); // 전송된 값이 2개 이상 일때  getParameterValues 를 사용
    String favoStr = "";
    // 스트링 배열에 여러개담긴 favo 값만큼 반복
    if (favo != null){
        for (int i = 0; i < favo.length; i++){
            favoStr += favo[i] + " ";
        }
//        for (String s : favo) {
//            favoStr += s + " ";
//        }
    }

    String intro = request.getParameter("intro").replace("\r\n", "<br/>");
%>

<ul>
    <li>아이디: <%= id %></li>
    <li>성별: <%= sex %></li>
    <li>관심사: <%= favoStr %></li>
    <li>자기소개: <%= intro %></li>
</ul>
</body>
</html>
