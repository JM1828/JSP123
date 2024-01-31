<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Collection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    // 응답헤더 정보 추가용 메서드
    // add: 새로 추가할 때
    // set: 기존값 수정할 때

    // 응답헤더에 추가할 값 준비
    // 전송된 add_date 매개변수의 값을 long타입으로 변경
    SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    long add_date = sd.parse(request.getParameter("add_date")).getTime();
    // form값으로 전송되는 값은 항상 String타입이므로 add_int도 문자열로 얻어짐 그래서 int로 형변환
    int add_int = Integer.parseInt(request.getParameter("add_int"));
    String add_str = request.getParameter("add_str");

    // 응답 헤더에 값 추가
    // add 계열의 메서드로 헤더값을 추가합니다.
    response.addDateHeader("today", add_date);
    response.addIntHeader("myNum", add_int);
    // 바로 위에서 추가한 myNum 이라는 동일한 헤더명으로 새로운 값을 추가 (add 계열이므로 같은 헤더명으로 하나더 추가)
    response.addIntHeader("myNum", 1000); // 추가
    response.addHeader("myNume", add_str);
    // set 계열의 메서드를 사용하면 이전 값이 수정됨
    response.setHeader("myNume", "안중근"); // 수정

%>
<head>
    <title>내장 객체 - response</title>
</head>
<body>
<h2>응답 헤더 출력하기</h2>
<%
    // 모든 HTTP 메세지의 헤더 이름을 구함
    Collection<String> headerNames = response.getHeaderNames();
    for (String hName : headerNames) {
        // 저장한 이름의 헤더값을 구해서 hValue에 담음
        String hValue = response.getHeader(hName);
        %>
    <li><%= hName %> : <%= hValue %></li>
<%
    }
%>

<h2>myNum 만 출력하기</h2>
<%
    // 저장한 이름의 헤더값들을 전부 반환함
    Collection<String> myNum = response.getHeaders("myNum");
    for (String num : myNum){
        %>
            <li>myNum : <%= num %></li>
<%
    }
%>
</body>
</html>
