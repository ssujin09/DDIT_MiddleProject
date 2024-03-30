package mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.vo.CustomerVO;
import mypage.service.IMypageService;
import mypage.service.MypageServiceImple;


/**
	 * Description : 비밀번호 변경 컨트롤러 클래스
	 * Date : 2024. 1. 10.
	 * History :
	 * - 작성자 : '선민수', 날짜 : 2024. 1. 10., 설명 : 최초작성
	 * - 수정자 : 
	 * @author pc09
	 */
@WebServlet("/mypage/changepw.do")
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	IMypageService mypageSerivce = MypageServiceImple.getInstance();
	
    public ChangePassword() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/mypage/profileSetting.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerVO myInfo = (CustomerVO) request.getSession().getAttribute("loginCode");
		
		String msg = "";
		
		String cstmrPw = request.getParameter("cstmrPw"); // 기존 유저 정보에 담긴 비밀번호
	
		if(!cstmrPw.equals(myInfo.getCstmrPw())) {
		msg = "비밀번호 입력이 잘못되었습니다."; 
		request.setAttribute("errorMsg", msg);
		response.sendRedirect("/mypage/setting.do");
		return;
	}
	
		String newCstmrPw = request.getParameter("newCstmrPw"); // 변경할 비밀번호
		String reCstmrPw = request.getParameter("reCstmrPw"); // 변경할 비밀번호 확인
		
		if(!newCstmrPw.equals(reCstmrPw)) {
			msg = "변경할 비밀번호가 일치하지 않습니다.";
			System.out.println(msg);
			request.setAttribute("errorMsg", msg);
			response.sendRedirect("/mypage/setting.do");
			return;
		}
		
		CustomerVO cv = new CustomerVO();
		
		cv.setCstmrId(myInfo.getCstmrId());
		cv.setCstmrPw(reCstmrPw);
		int result = mypageSerivce.cstmrProfileSetting(cv);
		
		if(result > 0 ) {
			msg = "비밀번호 변경이 성공적으로 완료되었습니다.";
			request.getRequestDispatcher("/mypage/main.do").forward(request, response);
			return;
		}else {
			msg = "비밀번호 변경이 실패하였습니다.";
			System.out.println(msg);
			response.sendRedirect("/mypage/setting.do");
			return;
		}
		
	}

}
