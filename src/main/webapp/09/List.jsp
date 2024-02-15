<%@ page import="com.model1.board.BoardDAO" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.model1.board.BoardDTO" %>
<%@ page import="com.util.BoardPage" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // DAO 생성해 DB에 연결
    BoardDAO dao = new BoardDAO();

    // 사용자가 입력한 검색 조건을 Map에 저장
    Map<String, Object> param = new HashMap<>();
    String searchField = request.getParameter("searchField");
    String searchWord = request.getParameter("searchWord");
    if (searchWord != null) {
        param.put(searchField, searchField);
        param.put(searchWord, searchWord);
    }

    int totalCount = dao.selectCount(param); // 게시물 수 확인

    // 전체 페이지 수 게산 (1)
    int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
    int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
    int totalPage = (int) Math.ceil((double) totalCount/pageSize);

    // 현재 페이지 확인 (2)
    int pageNum = 1;
    String pageTemp = request.getParameter("pageNum");
    if (pageTemp != null && !pageTemp.equals("")){
        pageNum = Integer.parseInt(pageTemp); // 페이지 요청받은 값
    }

    //목록에 출력할 게시물 범위 계산 (3)
    int start = (pageNum - 1) * pageSize + 1;
    int end = pageNum * pageSize;
    param.put("start" , start);
    param.put("end", end);

    //페이징 처리 End
    List<BoardDTO> boardList = dao.selectListPage(param); // 게시물 목록 받기 (4)

    dao.close(); // DB 연결 닫기
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원제 게시판</title>
</head>
<body>
    <jsp:include page="../common/Link.jsp"></jsp:include>
    <h2>목록 보기 - 현재 페이지 : <%=pageNum%>(전체 : <%=totalPage%></h2> <%--(1)--%>
    <%-- 검색 조건 (1) --%>
    <form method="get"> <%-- (2) --%>
        <table border="1" width="90%">
            <tr>
                <td align="center">
                    <select name="searchField"> <%-- (3) --%>
                        <option value="title">제목</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" name="searchWord">
                    <input type="submit" value="검색">
                </td>
            </tr>
        </table>
    </form>
<%--게시물 목록 테이블(표) --%>
<table border="1" width="90%">
    <%--각 컬럼의 이름 (5)--%>
    <tr>
        <th width="10">번호</th>
        <th width="50">제목</th>
        <th width="15">작성자</th>
        <th width="10">조회수</th>
        <th width="15">작성일</th>
    </tr>
    <%--목록의 내용 --%>
    <%
        if (boardList.isEmpty()) {
            // 게시물이 하나도 없을 때
    %>
    <tr>
        <td colspan="5" align="center">
            등록된 게시물이 없습니다.
        </td>
    </tr>
    <%
        } else  {
            // 게시물이 있을 때
            int virtualNum = 0; // 화면상에서의 게시물 번호
            int countNum = 0;
            for (BoardDTO dto : boardList) {
                virtualNum = totalCount - (((pageNum - 1) * pageSize) + countNum++); // (2)
    %>
    <tr align="center">
        <td><%=virtualNum%></td> <%-- 게시글 번호 --%>
        <td align="left"> <%--제목(+ 하이퍼링크)--%>
            <a href="View.jsp?num=<%=dto.getNum()%>">
            <%=dto.getTitle()%>
            </a> <%--(9)--%>
        </td>
        <td align="center"><%=dto.getId()%></td> <%--작성자 아이디--%>
        <td align="center"><%=dto.getVisitcount()%></td> <%--조회수--%>
        <td align="center"><%=dto.getPostdate()%></td> <%--작성일--%>
    </tr>
    <%
            }
        }
    %>
</table>
    <%--목록 하단의 [글쓰기] 버튼 (10)--%>
<table border="1" width="90%">
    <tr align="center">
        <td>
            <%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, request.getRequestURI())%>
        </td>
        <td>
            <button type="button" onclick="location.href='Write.jsp'">
                글쓰기
            </button>
        </td>
    </tr>
</table>
</body>
</html>
