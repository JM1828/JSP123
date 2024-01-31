<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>내장 객체 - Application</title>
</head>
<body>
<%--
    웹 애플리케이션 당 하나만 생성
    모든 JSP 페이지에서 접근 가능
    ServletContext 타입
    - 하나의 서블릿이 서블릿 컨테이너와 통신하기 위해서 사용되는 메소드들을 가진 클래스

    보통 웹 애플리케이션 전체에서 사용되는 정보를 저장하거나
    서버 정보, 서버 물리적 경로를 가져오는데 사용함.


    web.xml 은 애플리케이션 설정 정보를 저장하는 곳


--%>
    <h2>web.xml에 설정한 내용 읽어오기</h2>
    초기화 매개변수: <%= application.getInitParameter("INIT_PARAM")%>

    <h2>서버 물리적 경로 가져오기</h2>
    application 내장 객체: <%= application.getRealPath("/02")%>

    <h2>선언부에서 내장 객체 사용하기</h2>
<%!
   public String useImplicitObject(){
       return this.getServletContext().getRealPath("/02");
   }

   public String useImplicitObject(ServletContext app){
       return app.getRealPath("/02");
   }
%>

<ul>
    <li>this 사용: <%=useImplicitObject()%></li>
    <li>내장객체를 파라미터로 전달: <%=useImplicitObject(application)%></li>
</ul>
</body>
</html>
