package com.servlet;

import com.membership.MemberDAO;
import com.membership.MemberDTO;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

public class MemberAuth extends HttpServlet {
    private static final long serialVersionUID = 1L;
    MemberDAO dao;

    @Override
    public void init() throws ServletException {
        // application 내장 객체 얻기
        ServletContext app = this.getServletContext();
        // DAO 생성
        dao = new MemberDAO();
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        // 서블릿 초기화 매개변수에서 관리자 ID 받기
        String admin_id = this.getInitParameter("admin_id");
        System.out.println("관리자 : " + admin_id);
        // 인증을 요청한 ID/패스워드
        String id = req.getParameter("id");
        String pass = req.getParameter("pass");

        // 회원 테이블에서 인증 요청한 ID/패스워드에 해당하는 회원 찾기
        MemberDTO memberDTO = dao.getMemberDTO(id, pass);

        // 찾은 회원의 이름에 따른 처리
        String memberName = memberDTO.getName();
        if (memberName != null) { // 일치하는 회원 찾음
            req.setAttribute("authMessage", memberName + "회원님 방가방가^^*");
        } else { // 일치하는 회원 없음
            if (admin_id.equals(id)) { // 관리자
                req.setAttribute("authMessage", admin_id + "는 최고 관리자입니다.");
            } else { // 비회원
                req.setAttribute("authMessage", "귀하는 회원이 아닙니다.");
            }
        }
        req.getRequestDispatcher("/12/MemberAuth.jsp").forward(req, resp);
    }
    @Override
    public void destroy() {
        dao.close();
    }
}
