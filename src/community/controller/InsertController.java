package community.controller;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import community.service.CmmntyServiceImpl;
import community.service.ICmmntyService;
import community.vo.CmmntyVO;
import member.vo.CustomerVO;

/**
 * 
 * Description : 자유게시판 글 작성하기 Date : 2024. 1. 11 History : - 작성자 : '서어진', 날짜 :
 * 2024. 1. 11, 설명 : 최초작성 - 수정자 :
 * 
 * @author PC-08
 */

@MultipartConfig
@WebServlet("/cmmnty/insert.do")
public class InsertController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.getRequestDispatcher("/views/cmmnty/insertForm.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");

		String cmmntyTitle = req.getParameter("cmmntyTitle");
		String cmmntyContent = req.getParameter("cmmntyContent");

		ICmmntyService cmmntyService = CmmntyServiceImpl.getInstance();
		CustomerVO info = (CustomerVO) req.getSession().getAttribute("loginCode");

		CmmntyVO cv = new CmmntyVO();
		cv.setCmmntyTitle(cmmntyTitle);
		cv.setCmmntyContent(cmmntyContent);
		cv.setCstmrId(info.getCstmrId());

		
		int cnt = cmmntyService.insertCmmnty(cv);

		String msg = "";
		if (cnt > 0) {
			msg = "글 성공";
		} else {
			msg = "실패";
		}

		HttpSession httpSession = req.getSession();
		httpSession.setAttribute("msg", msg);

		resp.sendRedirect(req.getContextPath() + "/cmmnty/list.do");
	}
}
