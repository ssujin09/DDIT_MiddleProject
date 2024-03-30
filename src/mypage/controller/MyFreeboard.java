package mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import community.vo.CmmntyVO;
import community.vo.CommentVO;
import member.vo.CustomerVO;
import mypage.service.IMypageService;
import mypage.service.MypageServiceImple;
import mypage.vo.ReviewVO;

/**
	 * Description : 나의 자유게시판 게시글을 열람하는 컨트롤러 클래스
	 * Date : 2024. 1. 11.
	 * History :
	 * - 작성자 : '선민수', 날짜 : 2024. 1. 11., 설명 : 최초작성
	 * - 수정자 : 
	 * @author pok4k
	 */
@WebServlet("/mypage/freeboard.do")
public class MyFreeboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       IMypageService mypageService = MypageServiceImple.getInstance();
    public MyFreeboard() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerVO myInfo = (CustomerVO) request.getSession().getAttribute("loginCode");
		String cstmrId = myInfo.getCstmrId();
		String active = request.getParameter("active");
		
		List<CmmntyVO> communityList = mypageService.getMyCommunity(cstmrId);
		request.setAttribute("communityList", communityList);	
		
		List<ReviewVO> reviewList = mypageService.getMyReview(cstmrId);
		request.setAttribute("reviewList", reviewList);
		
		List<CommentVO> commentList = mypageService.getCommentList(myInfo.getCstmrId());
		request.setAttribute("commentList", commentList);
		
		request.setAttribute("active", active);
		
		request.getRequestDispatcher("/views/mypage/myFreeboard.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
