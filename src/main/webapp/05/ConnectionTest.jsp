<%@ page import="com.common.JDBCConnect" %> <%-- JDBConnect 클래스 임포트 추가 --%>
<%@ page import="com.common.DBConnPool" %> <%-- DBConnPool 클래스 임포트 추가 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>JDBC</title>
</head>
<body>
<h2>JDBC 연결 테스트 1</h2>
<%
    // 객체를 생성한 후
  JDBCConnect jdbc1 = new JDBCConnect();
  // 바로 닫아 자원을 해제
  jdbc1.close();
  //session.setMaxInactiveInterval(1200);
%>

<h2>JDBC 연결 테스트 2</h2>
<%
    String driver = application.getInitParameter("OracleDriver");
    String url = application.getInitParameter("OracleURL");
    String id = application.getInitParameter("OracleId");
    String pwd = application.getInitParameter("OraclePwd");

    JDBCConnect jdbc2 = new JDBCConnect(driver, url, id, pwd);
    jdbc2.close();
%>

<h2>JDBC 연결 테스트 3</h2>
<%
    JDBCConnect jdbc3 = new JDBCConnect(application);
    jdbc3.close();
%>

<h2>커넥션 풀 테스트</h2>
<%
    DBConnPool pool = new DBConnPool();
    pool.close();
%>
</body>
</html>
