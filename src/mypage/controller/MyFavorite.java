package mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.vo.CustomerVO;
import mypage.service.IMypageService;
import mypage.service.MypageServiceImple;
import mypage.vo.FavoriteVO;

/**
	 * Description : 즐겨찾기 가게를 위한 컨트롤러 클래스
	 * Date : 2024. 1. 11.
	 * History :
	 * - 작성자 : '선민수', 날짜 : 2024. 1. 11., 설명 : 최초작성
	 * - 수정자 : 
	 * @author pok4k
	 */
@WebServlet("/mypage/favorite.do")
public class MyFavorite extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	IMypageService mypageService = MypageServiceImple.getInstance();
    public MyFavorite() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerVO myInfo = (CustomerVO) request.getSession().getAttribute("loginCode");
		String cstmrId = myInfo.getCstmrId();
		
		List<FavoriteVO> favoriteList = mypageService.favoriteRst(cstmrId);
		request.setAttribute("favoriteList", favoriteList);
		
		
		
		request.getRequestDispatcher("/views/mypage/myFavorite.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}