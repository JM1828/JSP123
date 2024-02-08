package com.common;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class DBConnPool {
    public Connection con;
    public Statement stmt;
    public PreparedStatement psmt;
    public ResultSet rs;

    // 기본 생성자
    public DBConnPool() {
        try {
            // 케넉션 풀(DataSource) 얻기
            Context initCtx = new InitialContext();
            // JNDI 에서 이름과 실제 객체를 연결해주는 역할
            Context ctx = (Context) initCtx.lookup("java:comp/env");
            // java:comp/env > 현재 웹 애플리케이션의 루트 디렉토리
            DataSource source = (DataSource) ctx.lookup("dbcp_myoracle");

            // 커넥션 풀을 통해서 Connection 얻기
            con = source.getConnection();

            System.out.println("DB 커넥션 풀 연결 성공");

        }catch (Exception e) {
            System.out.println("DB 커넥션 풀 연결 실패");
            e.printStackTrace();
        }
    }

    // 연결 해제(자원 반납)
    public void close() {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (psmt != null) psmt.close();
            if (con != null) con.close(); // 자동으로 커넥션 풀로 반납됨

            System.out.println("DB 커넥션 풀 자원 반납");
        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
