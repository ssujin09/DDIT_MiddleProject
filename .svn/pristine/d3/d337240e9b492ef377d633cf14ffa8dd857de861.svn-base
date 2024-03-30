package community.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import community.service.CmmntyServiceImpl;
import community.service.ICmmntyService;
import community.vo.CmmntyVO;

/**
 * 
	 * Description : 자유게시판 리스트 구현
	 * Date : 2024. 1. 8
	 * History :
	 * - 작성자 : '서어진', 날짜 : 2024. 1. 8, 설명 : 최초작성
	 * - 수정자 : 
	 * @author PC-08
 */

@WebServlet(value = "/cmmnty/list.do")
public class ListController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		ICmmntyService cmmntyService = CmmntyServiceImpl.getInstance();
		
		List<CmmntyVO> cmmntyList = cmmntyService.displayAllCmmnty();

		req.setAttribute("cmmntyList", cmmntyList);
		req.getRequestDispatcher("/views/cmmnty/list.jsp").forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
