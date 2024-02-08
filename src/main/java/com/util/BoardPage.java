package com.util;

public class BoardPage {

    public static String pagingStr(int totalCount, int pageSize, int blockPage,
        int pageNum, String reqUrl) {
        String pagingStr = "";

        // 단계 3 : 전체 페이지 수 계산
        int totalPage = (int) Math.ceil((double) totalCount/pageSize); // (1)

        // 단계 4 : '이전 페이지 블록 바로가기' 출력
        int pageTemp = (((pageNum - 1)/blockPage) * blockPage) + 1;
        if (pageTemp != 1) { // (2)
            pagingStr += "<a href='" + reqUrl + "?pageNum=1'>[첫 페이지]</a>"; // (3)
            pagingStr += "&nbsp";
            pagingStr += "<a href='" + reqUrl + "?pageNum=" + (pageTemp - 1)
                        + "'>[이전 블록]</a>"; // (4)
        }

        // 단계 5 : 각 페이지 번호 출력
        int blockCount = 1;
        while (blockCount <= blockPage && pageTemp <= totalPage) {
            if (pageTemp == pageNum) { // (5)
                // 현재 페이지는 링크를 걸지 않음
                pagingStr += "&nbsp;" + pageTemp + "&nbsp;";
            }else {
                pagingStr += "&nbsp;<a href='" + reqUrl + "?pageNum=" + pageTemp +
                        "'>" + pageTemp + "</a>&nbsp;"; // (6)
            }
            pageTemp++; // (7)
            blockCount++;
        }

        // 단계 6 : '다음 페이지 블록 바로가기' 출력
        if (pageTemp <= totalPage) { // (8)
            pagingStr += "<a href='" + reqUrl + "?pageNum=" + pageTemp
                        + "'>[다음 블록]</a>"; // (9)
            pagingStr += "&nbsp";
            pagingStr += "<a href='" + reqUrl + "?pageNum="+ totalPage
                        + "'>[마지막 페이지]</a>"; // (10)
        }

        return pagingStr;
    }
}
