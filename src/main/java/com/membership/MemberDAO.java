package com.membership;

import com.common.DBConnPool;

public class MemberDAO extends DBConnPool {

    // 명시한 데이터베이스로의 연결이 완료된 MemberDAO 객체를 생성
    public MemberDAO() {
        super();
    }

    // CRUD

    // 명시한 파라미터 아이디/패스워드와 일치하는 회원 정보를 반환
    // getMemberDTO 메서드는 매개변수로 받은 아이디/패스워드와 일치하는 회원을 찾아
    // MemberDTO 형태로 반환
    public MemberDTO getMemberDTO(String uid, String upass) {
        MemberDTO dto = new MemberDTO(); // 회원 정보 DTO 객체 생성
        // 아이디와 패스워드가 일치하는 회원을 찾는 쿼리문
        String sql = "SELECT * FROM scott.member_jsp WHERE id = ? AND pass = ?"; // 쿼리문 템플릿

        try {
            // 쿼리 생성
            // 동적 쿼리문을 실행하기 위한 prepareStatement 객체를 생성
            // 여기서 con은 부모 클래스인 DBConnPool에서 정의한 멤버 변수로 데이터베이스와의 연결 객체
            psmt = con.prepareStatement(sql);
            // 쿼리문 템플릿에 ?로 처리된 인파라미터의 값을 설정
            // setString 메서드로 1에 아이디를 설정, 2에 패스워드를 설정
            psmt.setString(1, uid);
            psmt.setString(2, upass);
            // 쿼리문 실행
            // 실행한 결과 레코드는 ResultSet 객체에 담겨 반환
            // ResultSet : SELECT의 결과를 저장하는 객체
            rs = psmt.executeQuery();

            // 결과 처리
            // ResultSet 객체에 레코드가 들어있는지 next() 메서드로 알수 있음
            // 아이디와 패스워드가 일치하는 멤버가 존재했다면 레코드가 담겨있고, true가 반환됨
            while (rs.next()) {
                // 쿼리 결과로 얻은 회원 정보를 DTO 객체에 저장
                // 레코드의 값들을 getString() 메서드로 가져와서 dto 객체에 저장
                dto.setId(rs.getString("id"));
                dto.setPass(rs.getString("pass"));
                dto.setName(rs.getString("name"));
                dto.setRegidate(rs.getString("regidate"));
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        // DTO 객체 반환
        return dto;
    }
}
