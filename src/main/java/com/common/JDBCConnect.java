package com.common;

// application 내장 객체의 타입인 ServletContext 를 사용할 수 있도록 임포트
import jakarta.servlet.ServletContext;
import java.sql.*;

public class JDBCConnect {
    // Connection : 데이터베이스와 연결을 담당
    public Connection con;
    // Statement : 파라미터가 없는 정적 쿼리문 실행할 때 사용
    public Statement stmt;
    // PreparedStatement : 파라미터가 있는 동적 쿼리문 실행할 때 사용
    public PreparedStatement psmt;
    // ResultSet : SELECT 쿼리문 실행결과를 저장할 때 사용
    public ResultSet rs;

    // 기본 생성자
    public JDBCConnect() {
        try {
            // JDBC 드라이버 로드
            // Class 클래스의 forName()은 new 키워드 대신
            // 클래스명을 통해 직접 객체를 생성한 후 메모리에 로드하는 메서드
            Class.forName("oracle.jdbc.OracleDriver");

            // DB 연결
            String url = "jdbc:oracle:thin:@localhost:1521:xe";
            String id = "system";
            String pwd = "oracle";
            // url, id, pwd 를 인수로 DriverManager 클래스의 getConnection()을 호출
            con = DriverManager.getConnection(url,id,pwd);

            System.out.println("DB 연결 성공(기본 생성자)");

        }catch (Exception e) {
            e.printStackTrace();
        }
    }
    // 두 번재 생성자
    // 하드코딩했던 값들을 모두 외부에서 전달받도록 했다.
    public JDBCConnect(String driver, String url, String id, String pwd) {
        try {
            // JDBC 드라이버 로드
            Class.forName(driver);

            // DB 연결
            con = DriverManager.getConnection(url,id,pwd);

            System.out.println("DB 연결 성공(파라미터 생성자)");

        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 매개변수로 application 내장 객체를 받도록 정의
    // application 내장 객체를 이용해 web.xml로부터 접속 정보를 직접 가져온다는 점만 뺴면
    // 기존 생성자와 동일함.
    public JDBCConnect(ServletContext application) {
        try {
            // JDBC 드라이버 로드
            String driver = application.getInitParameter("OracleDriver");
            String url = application.getInitParameter("OracleURL");
            String id = application.getInitParameter("OracleId");
            String pwd = application.getInitParameter("OraclePwd");
            Class.forName(driver);

            // DB 연결
            con = DriverManager.getConnection(url,id,pwd);

            System.out.println("DB 연결 성공(파라미터 생성자2)");

        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    // 연결 해제(자원 반납)
    // close() 메서드로 DB 관련 작업을 모두 마쳤다면 자원을 적약하기 위해 연결을 해제해주는게 좋다.
    public void close() {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (psmt != null) psmt.close();
            if (con != null) con.close();

            System.out.println("JDBC 연결 자원 해제");
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
