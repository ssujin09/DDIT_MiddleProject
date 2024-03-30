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
import mypage.vo.ProfileImgVO;

/**
	 * Description : 마이페이지 메인화면을 보여주는 컨트롤러 클래스
	 * Date : 2024. 1. 11.
	 * History :
	 * - 작성자 : '선민수', 날짜 : 2024. 1. 11., 설명 : 최초작성
	 * - 수정자 : 
	 * @author pok4k
	 */
@WebServlet("/mypage/main.do")
public class MyPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       IMypageService mypageService = MypageServiceImple.getInstance();
    public MyPage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   IMypageService service = MypageServiceImple.getInstance();
		   	CustomerVO myInfo = (CustomerVO) request.getSession().getAttribute("loginCode");
		   
		   	if(myInfo.getProfileImgNo() != 0) {
		   		
		   		ProfileImgVO img = mypageService.profileImgInfo(myInfo.getProfileImgNo());
		   		String src = img.getProfileImgCours()+"/"+img.getProfileImgName();
		   		request.setAttribute("src", src);
		   	}
		
		request.getRequestDispatcher("/views/mypage/mypage.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
