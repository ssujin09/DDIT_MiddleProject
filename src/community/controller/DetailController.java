package community.controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import community.service.CCommentServiceImpl;
import community.service.CmmntyServiceImpl;
import community.service.ICCommentService;
import community.service.ICmmntyService;
import community.vo.CmmntyVO;
import community.vo.CommentVO;

/**
 * 
 * Description : 자유게시판 리스트 상세보기 
 * Date : 2024. 1. 10 History : - 작성자 : '서어진', 날짜 :2024. 1. 10, 설명 : 최초작성 - 수정자 :
 * 
 * @author PC-08
 */

@WebServlet("/cmmnty/detail.do")
public class DetailController extends HttpServlet {
	ICmmntyService cmmntyService = CmmntyServiceImpl.getInstance();
	ICCommentService commentService = CCommentServiceImpl.getInstance();

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int cmmntyCode = Integer.parseInt(req.getParameter("cmmntyCode"));
		
		int updateView = cmmntyService.updateView(cmmntyCode);

		CmmntyVO cv = cmmntyService.getDetailContent(cmmntyCode);

		req.setAttribute("cv", cv);

		List<CommentVO> comList = commentService.getCommentList(cmmntyCode);
		
		req.setAttribute("comList", comList);
		
		req.getRequestDispatcher("/views/cmmnty/listDetail.jsp").forward(req, resp);
		
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}

