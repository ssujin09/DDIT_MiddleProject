package mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import community.vo.CommentVO;
import member.vo.CustomerVO;
import mypage.service.IMypageService;
import mypage.service.MypageServiceImple;
import mypage.vo.ReviewVO;

/**
	 * Description : 마이페이지 내 댓글 관련 기능 컨트롤러
	 * Date : 2024. 1. 16.
	 * History :
	 * - 작성자 : '선민수', 날짜 : 2024. 1. 16., 설명 : 최초작성
	 * - 수정자 : 
	 * @author pok4k
	 */
@WebServlet("/mypage/comment.do")
public class MyComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	IMypageService mypageService = MypageServiceImple.getInstance();
	
    public MyComment() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerVO myInfo = (CustomerVO) request.getSession().getAttribute("loginCode");
		String active = request.getParameter("active");
		
		List<CommentVO> commentList = mypageService.getCommentList(myInfo.getCstmrId());
		
		request.setAttribute("active", active);
		request.setAttribute("commentList", commentList);
		
		request.getRequestDispatcher("/views/mypage/myFreeboard.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}