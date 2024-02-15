package com.model2;

import com.common.DBConnPool;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class MVCBoardDAO extends DBConnPool { // 커넥션 풀 상속
    public MVCBoardDAO() {
        super();
    }

    // 검색 조건에 맞는 게시물의 개수를 반환한다.
    public int selectCount(Map<String, Object> map) {
        int totalCount = 0; // 게시물 수를 담을 변수

        // 게시물 수를 얻어오는 쿼리문 작성
        String query = "SELECT COUNT(*) FROM scott.mvcboard";
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                    + " LIKE '%" + map.get("searchWord") + "%'";
        }

        try { // (5)
            stmt = con.createStatement(); // 쿼리문 생성
            rs = stmt.executeQuery(query); // 쿼리 실행
            rs.next(); // 커서를 첫 번째 행으로 이동
            totalCount = rs.getInt(1); // 첫 번재 컬럼 값을 가져옴
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("MVCBoard selectCount 오류발생");
        }
        return totalCount;
    }

    public List<MVCBoardDTO> selectListPage(Map<String, Object> map) {
        List<MVCBoardDTO> bbs = new ArrayList<MVCBoardDTO>(); // 결과(게시물 목록)를 담을 변수

        // 쿼리문 템플릿 (1)
        String query = " SELECT * FROM ( "
                + " SELECT Tb.*, ROWNUM rNum FROM ("
                + " SELECT * FROM scott.mvcboard ";

        // 검색 조건 추가 (2)
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                    + " LIKE '%" + map.get("searchWord") + "%' ";
        }
        query += " ORDER BY idx desc"
                + "     ) Tb "
                + " ) "
                + " WHERE rNUM BETWEEN ? AND ?"; // (3)

        try {
            // 쿼리문 완성 (4)
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());
            System.out.println("start : " + map.get("start"));
            System.out.println("end : " + map.get("end"));

            // 쿼리문 실행 (5)
            rs = psmt.executeQuery();

            while (rs.next()) {
                // 한 행(게시물 하나)의 데이터를 DTO에 저장
                MVCBoardDTO dto = new MVCBoardDTO();
                dto.setIdx(rs.getString("idx"));
                dto.setName(rs.getString("name"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setDowncount(rs.getInt("downcount"));
                dto.setPass(rs.getString("pass"));
                dto.setVisitcount(rs.getInt("visitcount"));

                // 반환할 결과 목록에 게시물 추가
                bbs.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("MVCBoard selectList 오류발생");
        }
        // 목록 반환
        return bbs;
    }

    // 게시글 작성
    public int insertWrite(MVCBoardDTO dto) {
        int result = 0;

        // 쿼리 작성
        try {
            String query = "INSERT INTO scott.mvcboard ( "
                    +"idx,name,title,content,ofile,sfile,pass)"
                    +" VALUES ("
                    +" scott.seq_board_num.nextval, ?,?,?,?,?,?)";

            psmt = con.prepareStatement(query);
            psmt.setString(1,dto.getName());
            psmt.setString(2,dto.getTitle());
            psmt.setString(3,dto.getContent());
            psmt.setString(4,dto.getOfile());
            psmt.setString(5,dto.getSfile());
            psmt.setString(6,dto.getPass());

            result = psmt.executeUpdate();
            System.out.println("반환값 확인 : " + result);

        }catch (Exception e) {
            e.printStackTrace();
            System.out.println("mvcboard insertWrite 오류발생");
        }
        return result;
    }

    // 주어진 일련번호에 해당한는 게시물을 DTO에 담아 반환한다.
    public MVCBoardDTO selectView(String idx) {
        MVCBoardDTO dto = new MVCBoardDTO();
        String query = "SELECT * FROM scott.mvcboard WHERE idx = ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, idx);
            rs = psmt.executeQuery();

            if (rs.next()) {
                dto.setIdx(rs.getString("idx"));
                dto.setName(rs.getString("name"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setOfile(rs.getString("ofile"));
                dto.setSfile(rs.getString("sfile"));
                dto.setDowncount(rs.getInt("downcount"));
                dto.setPass(rs.getString("pass"));
                dto.setVisitcount(rs.getInt("visitcount"));
            }
        }catch (Exception e) {
            e.printStackTrace();
            System.out.println("mvcboard selectView 오류발생");
        }
        return dto;
    }

    // 주어진 일련번호에 해당하는 게시물의 조회수를 1 증가시킵니다.
    public void updateVisitCount(String idx) {
        String query = "UPDATE scott.mvcboard SET "
                + " visitcount = visitcount + 1 "
                + " WHERE idx=?";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, idx);
            psmt.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("게시물 조회수 증가 중 예외 발생");
        }
    }
}
