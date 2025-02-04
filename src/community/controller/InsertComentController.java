package community.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import community.service.CCommentServiceImpl;
import community.service.CmmntyServiceImpl;
import community.service.ICCommentService;
import community.service.ICmmntyService;
import community.vo.CmmntyVO;
import community.vo.CommentVO;
import member.vo.CustomerVO;

/**
 * 
 * Description : 자유게시판 글 댓글 작성 Date : 2024. 1. 11 History : - 작성자 : '서어진', 날짜 :
 * 2024. 1. 11, 설명 : 최초작성 - 수정자 :
 * 
 * @author PC-08
 */

@MultipartConfig
@WebServlet("/comment/insert.do")
public class InsertComentController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		CustomerVO myInfo = (CustomerVO) req.getSession().getAttribute("loginCode");

		req.setCharacterEncoding("UTF-8");

		int cmmntyCode = Integer.parseInt(req.getParameter("cmmntyCode"));

		String cstmrId = myInfo.getCstmrId();

		String ccommentContent = req.getParameter("ccommentContent");

		ICCommentService commenttService = CCommentServiceImpl.getInstance();

		CommentVO ccv = new CommentVO();

		ccv.setCstmrId(cstmrId);
		ccv.setCcommentContent(ccommentContent);
		ccv.setCmmntyCode(cmmntyCode);

		System.out.println(cstmrId);
		System.out.println(ccommentContent);
		System.out.println(cmmntyCode);

		int cnt = commenttService.insertComment(ccv);

		System.out.println("ccv : " + ccv.getCstmrId());
		System.out.println("ccv : " + ccv.getCcommentContent());

		String msg = "";
		if (cnt > 0) {
			msg = "댓글성공";
		} else {
			msg = "실패";
		}

		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("msg", msg);
		
		req.setAttribute("ccv", ccv);
		req.getRequestDispatcher("/cmmnty/detail.do").forward(req, resp);

	}
}
