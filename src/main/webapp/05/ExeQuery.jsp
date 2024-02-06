<%@ page import="com.common.JDBCConnect" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>
<h2>회원 조회 테스트(executeQuery() 사용)</h2>
<%
    // DB에 연결
    JDBCConnect jdbc = new JDBCConnect();

    // 쿼리문 생성
    // SQL문에는 인파라미터가 전혀 없음
    String sql = "SELECT id,pass,name,regidate FROM scott.member_jsp";
    // prepareStatement()가 아닌 Statement를 생성
    // 이때 이용한 메서드도 prepareStatement()가 아닌 createStatement()이다.
    Statement stmt = jdbc.con.createStatement();

    // 쿼리 실행
    // 쿼리 수행에는 executeQuery()메서드를 이용 결과로 ResultSet 객체를 받음
    ResultSet rs = stmt.executeQuery(sql);

    //결과 확인 (페이지 출력)
    // next() 메서드는 ResultSet 객체에서 다음 행(레코드)을 반환
    while (rs.next()) {
        // 반환된 행에서 ID,패스워드,이름,가입 날짜를 차례로 읽음
        String id = rs.getString(1);
        String pw = rs.getString(2);
        String name = rs.getString("name");
        Date regiDate = rs.getDate("regiDate");
        // 웹 페이지에 출력
        out.println(String.format("%s %s %s %s", id, pw, name, regiDate) + "<br/>");
    }
    //연결 종료
    jdbc.close();



%>
</body>
</html>
