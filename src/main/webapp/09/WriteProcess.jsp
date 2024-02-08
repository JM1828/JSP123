<%@ page import="com.model1.board.BoardDTO" %>
<%@ page import="com.model1.board.BoardDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="IsLoggedln.jsp"%>
<%
  String title = request.getParameter("title");
  String content = request.getParameter("content");

  BoardDTO dto = new BoardDTO();
  dto.setTitle(title);
  dto.setContent(content);
  dto.setId(session.getAttribute("UserId").toString());

  // DAO 객체를 통해 DB
  BoardDAO dao = new BoardDAO();
  //int iResult = dao.insertWrite(dto);
  int iResult = 0;
  for (int i = 0; i <= 100; i++){
    dto.setTitle(title + "-" + i);
    iResult = dao.insertWrite(dto);
  }

  dao.close();

  if (iResult == 1) { // 성공
    response.sendRedirect("List.jsp");
  } else { // 실패
    JSFunction.alertBack("글쓰기 실패", out);
  }
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
</head>
<body>

</body>
</html>
