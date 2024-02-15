package com.fileupload;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/13/MultipleProcess.do")
@MultipartConfig(
        maxFileSize = 1024 * 1024 * 1,
        maxRequestSize = 1024 * 1024 * 10
)
public class MultipleProcess extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            String saveDirectory = getServletContext().getRealPath("/Uploads");
            System.out.println("saveDir 확인 : " + saveDirectory);

            // 조금씩 다른 로직
            // 다중 파일 업로드
            ArrayList<String> listFileName = FileUtil.multipleFile(req,saveDirectory);

            for (String originalFileName : listFileName) {
                // 저장된 파일명 변경
                String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);

                // DB에 저장하기
                insertFile(req, originalFileName, savedFileName);
            }

            resp.sendRedirect("FileList.jsp");
        }catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("errMessage", "멀티파일 업로드 오류");
            req.getRequestDispatcher("MultiUploadMain.jsp").forward(req, resp);
        }
    }

    private void insertFile(HttpServletRequest req, String oFileName, String sFileName) {
        String title = req.getParameter("title");
        String[] cateArray = req.getParameterValues("cate");
        StringBuffer cateBuf = new StringBuffer();
        // 마지막 콤마(,) 삭제
        int index = 0;

        if (cateArray == null) {
            cateBuf.append("선택한 항목 없음");
        } else {
            for (String s : cateArray) {
                if(index != cateArray.length-1) {
                    cateBuf.append(s + ", ");
                } else {
                    cateBuf.append(s);
                }
                index++;
            }
        }

        // DB 입력하기
        MyFileDTO dto = new MyFileDTO();
        dto.setTitle(title);
        dto.setCate(cateBuf.toString());
        dto.setOfile(oFileName);
        dto.setSfile(sFileName);

        // DAO를 통해 DB에 반영
        MyFileDAO dao = new MyFileDAO();
        dao.insertFile(dto);
        dao.close();
    }
}
