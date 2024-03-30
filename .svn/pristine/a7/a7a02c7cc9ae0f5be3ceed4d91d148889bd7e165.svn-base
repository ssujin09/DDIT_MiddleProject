package restaurant.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.vo.CustomerVO;
import mypage.util.FileUtil;
import mypage.vo.ReviewVO;
import restaurant.service.RestaurantService;
import restaurant.service.RestaurantServiceImpl;
import restaurant.vo.RestaurantVO;

@MultipartConfig
@WebServlet("/restaurant/postreview.do")
public class PostReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
    RestaurantService rstService = RestaurantServiceImpl.getInstance();
    
	
    public PostReview() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		CustomerVO myInfo = (CustomerVO) request.getSession().getAttribute("loginCode");
		
		String cstmrId = myInfo.getCstmrId();
		int reviewTaste = C(request.getParameter("reviewTaste"));
		int reviewPrice = C(request.getParameter("reviewPrice"));
		int reviewService = C(request.getParameter("reviewService"));
		int reviewScore = (reviewTaste+reviewPrice+reviewService)/3;
		String reviewContent = request.getParameter("reviewContent");
		
		int rstrntCode = C(request.getParameter("rstrntCode"));
		
		System.out.println("로깅작업");
		System.out.println(reviewTaste);
		System.out.println(reviewService);
		System.out.println(reviewScore);
		System.out.println(reviewPrice);
		System.out.println(reviewContent);
		
		RestaurantVO rv = rstService.displayDeatils(rstrntCode);
		
		
		
		
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setReviewTaste(reviewTaste);
		reviewVO.setReviewPrice(reviewPrice);
		reviewVO.setReviewService(reviewService);
		reviewVO.setReviewScore(reviewScore);
		reviewVO.setReviewContent(reviewContent);
		reviewVO.setCstmrId(cstmrId);
		reviewVO.setRstrntCode(rstrntCode);
		
		rstService.insertReview(reviewVO);
		
		reviewVO = rstService.getReview(reviewVO);
		int reviewNo = reviewVO.getReviewNo();
		
		
		int profileImgNo = 0;
		if(request.getPart("file") != null && request.getPart("file").getSize()>0 ) {
			System.out.println("파일정보있음");
			profileImgNo = FileUtil.reviewImgUpload(request.getPart("file"), rv,reviewNo);
		}
		
		response.sendRedirect(request.getContextPath()+"/restaurantDetail.do?rstrntCode="+reviewVO.getRstrntCode());
		
		
	}
	public static int C(String s) {
		return Integer.parseInt(s);
		
	}
}
