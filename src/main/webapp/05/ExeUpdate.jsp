<%@ page import="com.common.JDBCConnect" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JDBC</title>
</head>
<body>
<h2>회원 추가 테스트(executeUpdate() 사용)</h2>
<%
    // JDBCconnect 객체 생성
    JDBCConnect jdbc = new JDBCConnect();

    //테스트용 테이블에 입력할 값
    String id = "test1";
    String pass = "1234";
    String name = "테스트1";

    //쿼리문 생성 (memver_jsp 테이블에 다음 4개의 값을 입력하라 sysdate(현재시각))
    // ? << 인파라미터 정확한 값을 나중에 채워줌
    String sql = "INSERT INTO scott.member_jsp VALUES(?,?,?,sysdate)";
    // Connection 객체를 통해 PreparedStatement 객체를 생성
    // 방금 작성한 미완의 SQL문을 인수로 제공
    PreparedStatement psmt = jdbc.con.prepareStatement(sql);
    // 인파라미터들에 실제 값을 대입
    psmt.setString(1, id);
    psmt.setString(2, pass);
    psmt.setString(3, name);

    // 쿼리 수행
    // 데이터베이스에 성공적으로 입력된 레코드의 수가 정수형으로 반환
    int intResult = psmt.executeUpdate();
    out.println(intResult + "행이 입려되었습니다.");

    // DB 연결 종료
    jdbc.close();
%>
</body>
</html>
