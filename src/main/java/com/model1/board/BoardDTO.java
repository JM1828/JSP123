package com.model1.board;

import java.sql.Date;

public class BoardDTO {
    // 멤버 변수 선언
    // 멤버 변수는 board 테이블의 컬럼과 동일하게 작성
    private String num;
    private String content;
    private String title;
    private String id;
    private String visitcount;
    // board 테이블에는 작성자의 아이디만 저장되므로 목록 출력시 이름은 출력불가
    private String name;
    private Date postdate;

    // 게터/세터 선언
    public BoardDTO() {
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getVisitcount() {
        return visitcount;
    }

    public void setVisitcount(String visitcount) {
        this.visitcount = visitcount;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public Date getPostdate() {
        return postdate;
    }

    public void setPostdate(Date postdate) {
        this.postdate = postdate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }
}
