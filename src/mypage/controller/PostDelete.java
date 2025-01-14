package mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.service.IMypageService;
import mypage.service.MypageServiceImple;

/**
	 * Description : 내 게시글 삭제 컨트롤러
	 * Date : 2024. 1. 16.
	 * History :
	 * - 작성자 : '선민수', 날짜 : 2024. 1. 16., 설명 : 최초작성
	 * - 수정자 : 
	 * @author pok4k
	 */
@WebServlet("/mypage/postdelete.do")
public class PostDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       IMypageService mypageService = MypageServiceImple.getInstance();
    public PostDelete() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cmmntyCode = Integer.parseInt(request.getParameter("cmmntyCode"));
		
		int result = mypageService.postDelete(cmmntyCode);
		
		String msg = "";
		
		if(result > 0) {
			msg = "삭제 성공";
		}else {
			msg = "삭제 실패";
		}
		response.sendRedirect(request.getContextPath()+"/mypage/freeboard.do?active=myPost");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
