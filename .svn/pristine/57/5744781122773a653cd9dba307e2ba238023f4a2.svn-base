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
	 * Description : 커뮤니티 댓글에 대한 삭제 컨트롤러
	 * Date : 2024. 1. 16.
	 * History :
	 * - 작성자 : '선민수', 날짜 : 2024. 1. 16., 설명 : 최초작성
	 * - 수정자 : 
	 * @author pok4k
	 */
@WebServlet("/mypage/commentdelete.do")
public class DeleteComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
	IMypageService mypageService = MypageServiceImple.getInstance();
    public DeleteComment() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cCommentCode = Integer.parseInt(request.getParameter("ccommentCode"));
		mypageService.deleteCcomment(cCommentCode);
		request.getRequestDispatcher("/mypage/freeboard.do?active=myComment").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
