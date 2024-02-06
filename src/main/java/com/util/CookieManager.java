package com.util;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CookieManager {
    // 1. 쿠키 생성
    // 명시한 이름, 값, 유지 기간 조건으로 새로운 쿠키를 생성
    /*
     * @param : cName : 쿠키 이름
     * @param : cValue : 쿠키 이름
     * @param : cTime : 쿠키 유지기간
     *
     */
    public static void makeCookie(HttpServletResponse response, String cName, String cValue, int cTime) {
        Cookie cookie = new Cookie(cName, cValue); // 쿠키 생성
        cookie.setPath("/"); // 경로 설정
        cookie.setMaxAge(cTime); // 유지 기간 설정
        response.addCookie(cookie); // 응답 객체에 추가
    }
    // 2. 명시한 이름의 쿠키를 찾아 그 값을 반환
    public static String readCookie(HttpServletRequest request, String cName) {
        String cookieValue = ""; // 반환 값
        // request 내장 객체로부터 클라이언트가 보내온 쿠키 목록 받기
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie c : cookies) {
                String cookieName = c.getName();
                // cName 과 이름이 같은 쿠키가 있다면
                if (cookieName.equals(cName)) {
                    cookieValue = c.getValue(); // 반환 값을 담아줌
                }
            }
        }
        return cookieValue; // 그 값을 반환
    }
    // 3. 명시한 이름의 쿠키를 삭제
    public static void deleteCookie(HttpServletResponse response, String cName) {
        // 쿠키 삭제는 쿠키 생성 시 값은 빈 문자열로, 유지 기간은 0으로 부여하면 되므로 makeCookie() 메서드를 재활용
        makeCookie(response, cName, "", 0);
    }
}
