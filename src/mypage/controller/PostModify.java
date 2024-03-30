package mypage.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import community.service.CmmntyServiceImpl;
import community.service.ICmmntyService;
import community.vo.CmmntyVO;
import mypage.service.IMypageService;
import mypage.service.MypageServiceImple;

/**
	 * Description : 내 게시글 수정 컨트롤러
	 * Date : 2024. 1. 16.
	 * History :
	 * - 작성자 : '선민수', 날짜 : 2024. 1. 16., 설명 : 최초작성
	 * - 수정자 : 
	 * @author pok4k
	 */
@WebServlet("/mypage/postmodify.do")
public class PostModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
		ICmmntyService cmmntyService = CmmntyServiceImpl.getInstance();
		IMypageService mypageService = MypageServiceImple.getInstance();
    public PostModify() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cmmntyCode = Integer.parseInt(request.getParameter("cmmntyCode"));
		
		CmmntyVO cv = cmmntyService.getDetailContent(cmmntyCode);
		request.setAttribute("cv", cv);
		request.getRequestDispatcher("/views/mypage/postModify.jsp").forward(request, response); 
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		int cmmntyCode = Integer.parseInt(request.getParameter("cmmntyCode"));
		String cmmntyTitle = request.getParameter("cmmntyTitle");
		String cmmntyContent = request.getParameter("cmmntyContent");
		
		CmmntyVO cv = new CmmntyVO();
		cv.setCmmntyCode(cmmntyCode);
		cv.setCmmntyContent(cmmntyContent);
		cv.setCmmntyTitle(cmmntyTitle);
		
		
		
		int result = mypageService.postModify(cv);
		
		if(result > 0 ) {
			System.out.println("수정 성공");
		}else {
			System.out.println("수정 실패");
		}
		
		response.sendRedirect("freeboard.do?active=myPost");
	
	
	
	}

}
