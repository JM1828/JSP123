package com.util;
// 내장 객체인 out이 JspWriter 타입
import jakarta.servlet.jsp.JspWriter; // 필요한 클래스 임포트

public class JSFunction {
    // 메세지 알림창을 띄운 후 명시한 URL로 이동합니다.
    // alertLocation()은 알림창으로 메세지를 보여준 후 명시한 URL로 이동하는 메서드
    // 매개변수 3개
    // msg : 알림창에 띄울 메세지
    // url : 알림창을 닫은 후 이동할 페이지의 URL
    // out : 자바스크립트 코드를 삽입할 출력 스트림 (JSP의 out 내장 객체)
    public static void alertLocation(String msg, String url, JspWriter out) {
        try {
            String script = "" // 삽입할 자바스크립트 코드
                    // 자바스크립트 코드를 문자열 형태로 선언
                    + "<script>"
                    + "alert('" + msg + "');"
                    + "location.href= '" + url + "';"
                    + "</script>";
            out.println(script); // 자바스크립트 코드를 out 내장 객체로 출력(삽입)
        } catch (Exception e) {

        }
    }
    // 메세지 알림창을 띄운 후 이전 페이지로 돌아갑니다.
    // alertBack() 메서드도 alertLocation() 처럼 알림창을 듸운 후 다른 페이지로 이동
    // 단, 호출자가 URL을 지정할 수 없고, 무조건 이전 페이지로 이동
    public static void alertBack(String msg, JspWriter out) {
        try {
            String script = ""
                    + "<script>"
                    + "alert('" + msg + "');"
                    + "history.back();"
                    + "</script>";
            out.println(script);
        } catch (Exception e) {

        }
    }
}



