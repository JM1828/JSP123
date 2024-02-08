package com.model1.board;

import com.common.DBConnPool;

import java.util.ArrayList;
import java.util.List;
import java.util.Map; // (1)

public class BoardDAO extends DBConnPool {
    public BoardDAO() {
        super(); // (3)
    }

    // 검색 조건에 맞는 게시물 개수 반환
    public int selectCount(Map<String, Object> map) { // (2)
        int totalCount = 0; // 게시물 수를 담을 변수

        // 게시물 수를 얻어오는 쿼리문 작성
        String query = "SELECT COUNT(*) FROM scott.board_jsp"; // (3)
        if (map.get("searchWord") != null) { // (4)
            query += " WHERE " + map.get("searchField") + " "
                    + " LIKE '%" + map.get("searchWord") + "%'";
        }

        try { // (5)
            stmt = con.createStatement(); // 쿼리문 생성 (6)
            rs = stmt.executeQuery(query); // 쿼리 실행 (7)
            rs.next(); // 커서를 첫 번째 행으로 이동 (8)
            totalCount = rs.getInt(1); // 첫 번재 컬럼 값을 가져옴 (9)
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("selectCount 오류발생");
        }
        return totalCount; // (10)
    }

    // 검색 조건에 맞는 게시물 목록을 반환
    public List<BoardDTO> selectList(Map<String, Object> map) { // (1)
        List<BoardDTO> bbs = new ArrayList<BoardDTO>(); // 쿼리 결과를 담을 변수 (2)

        String query = "SELECT * FROM scott.board_jsp"; // (3)
        if (map.get("searchWord") != null) { // (4)
            query += " WHERE " + map.get("searchField") + " "
                    + " LIKE '%" + map.get("searchWord") + "%' ";
        }
            query += " ORDER BY num desc"; // (5)

            try {
                stmt = con.createStatement(); // 쿼리문 생성 (6)
                rs = stmt.executeQuery(query); // 쿼리 실행 (7)

                while (rs.next()) { // 결과를 순화하며...(8)
                    // 한 row의 내용을 DTO에 저장
                    BoardDTO dto = new BoardDTO(); // (9)

                    dto.setNum(rs.getString("num")); // 일련번호
                    dto.setTitle(rs.getString("title")); //제목
                    dto.setContent(rs.getString("content")); // 내용
                    dto.setId(rs.getString("id")); // 작성자 아이디
                    dto.setPostdate(rs.getDate("postdate")); // 작성일
                    dto.setVisitcount(rs.getString("visitcount")); // 조회수

                    bbs.add(dto); // (10)
                }
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("selectList 오류발생");
            }
            return bbs; // (11)
        }

        // 검색 조건에 맞는 게시물 목록을 반환 (페이징 기능 지원)
    public List<BoardDTO> selectListPage(Map<String, Object> map) {
        List<BoardDTO> bbs = new ArrayList<BoardDTO>(); // 결과(게시물 목록)를 담을 변수

        // 쿼리문 템플릿 (1)
        String query = " SELECT * FROM ( "
            + " SELECT Tb.*, ROWNUM rNum FROM ("
            + " SELECT * FROM scott.board_jsp ";

        // 검색 조건 추가 (2)
        if (map.get("searchWord") != null) {
            query += " WHERE " + map.get("searchField") + " "
                    + " LIKE '%" + map.get("searchWord") + "%' ";
        }
        query += " ORDER BY num desc"
            + "     ) Tb "
            + " ) "
            + " WHERE rNUM BETWEEN ? AND ?"; // (3)

        try {
            // 쿼리문 완성 (4)
            psmt = con.prepareStatement(query);
            psmt.setString(1, map.get("start").toString());
            psmt.setString(2, map.get("end").toString());

            // 쿼리문 실행 (5)
            rs = psmt.executeQuery();

            while (rs.next()) {
                // 한 행(게시물 하나)의 데이터를 DTO에 저장
                BoardDTO dto = new BoardDTO();
                dto.setNum(rs.getString("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setId(rs.getString("id"));
                dto.setPostdate(rs.getDate("postdate"));
                dto.setVisitcount(rs.getString("visitcount"));

                // 반환할 결과 목록에 게시물 추가
                bbs.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("selectList 오류발생");
        }
        // 목록 반환
        return bbs;
    }

        // 게시글 작성
    public int insertWrite(BoardDTO dto) {
        int result = 0;

        // 쿼리 작성
        try {
            String query = "INSERT INTO scott.board_jsp ( "
                    +"num,title,content,id,visitcount)"
                    +" VALUES ("
                    +" scott.seq_board_num.nextval, ?,?,?,0)";

            psmt = con.prepareStatement(query);
            psmt.setString(1,dto.getTitle());
            psmt.setString(2,dto.getContent());
            psmt.setString(3,dto.getId());

            result = psmt.executeUpdate();
            System.out.println("반환값 확인 : " + result);

        }catch (Exception e) {
            e.printStackTrace();
            System.out.println("selectList 오류발생");
        }
        return result;
    }

    // 게시글 조회
    public BoardDTO selectView(String num) {
        BoardDTO dto = new BoardDTO();

        try {
            String query = "SELECT B.* , M.name"
                    + " FROM scott.board_jsp B"
                    + " INNER JOIN scott.member_jsp M"
                    + " ON B.id = M.id"
                    + " WHERE num = ?";

            psmt = con.prepareStatement(query);
            psmt.setString(1, num);
            rs = psmt.executeQuery();

            if (rs.next()) {
                dto.setNum(rs.getString("num"));
                dto.setTitle(rs.getString("title"));
                dto.setContent(rs.getString("content"));
                dto.setId(rs.getString("id"));
                dto.setName(rs.getString("name"));
                dto.setVisitcount(rs.getString("visitcount"));
                dto.setPostdate(rs.getDate("postdate"));
            }

        }catch (Exception e){
            e.printStackTrace();
            System.out.println("selectView 오류발생");
        }

        return dto;
    }
    // 조회수 증가
    public void updateViewCount(String num) {
        // 쿼리문
        String query = "UPDATE scott.board_jsp"
                + " SET visitcount = visitcount + 1"
                + " WHERE num = ? ";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, num);
            rs = psmt.executeQuery();

        }catch (Exception e) {
            e.printStackTrace();
            System.out.println("updateViewCount 오류 발생");
        }
    }
    // 게시글 수정
    public int updateEdit(BoardDTO dto) {
        int result = 0;

        String query = "UPDATE scott.board_jsp"
                + " SET title = ? , content = ?"
                + " WHERE num = ?";

        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getTitle());
            psmt.setString(2, dto.getContent());
            psmt.setString(3, dto.getNum());

            result = psmt.executeUpdate();

        }catch (Exception e) {
            e.printStackTrace();
            System.out.println("updateEdit 오류 발생");
        }
        return result;
    }

    // 게시글 삭제
    public int deletePost(BoardDTO dto) {
        int result = 0;

        String query = "DELETE FROM scott.board_jsp WHERE num = ? ";
        try {
            psmt = con.prepareStatement(query);
            psmt.setString(1, dto.getNum());

            result = psmt.executeUpdate();

        }catch (Exception e) {
            e.printStackTrace();
            System.out.println("deletePost 오류 발생");
        }
        return result;
    }
}
