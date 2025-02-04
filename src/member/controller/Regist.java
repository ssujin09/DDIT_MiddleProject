package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.util.FileUtil;

/**
	 * Description : 회원가입 처리 클래스
	 * Date : 2024. 1. 10
	 * History :
	 * - 작성자 : '최현흠', 날짜 : 2024. 1. 10, 설명 : 최초작성
	 * - 수정자 : 
	 * @author PC-22
	 */
@MultipartConfig(fileSizeThreshold = 1024*1024*3, maxFileSize = 1024*1024*50, maxRequestSize = 1024*1024*50)
@WebServlet("/regist.do")
public class Regist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Regist() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int fileNo = FileUtil.prfileImgUpload(request.getPart("profileImg"), (String) request.getParameter("cstmrId"));
		
		request.setAttribute("fileNo", fileNo);
		
		request.getRequestDispatcher("/views/customer/serialize.jsp").forward(request, response);
		
		
	}

}
