package admin.controller;

import java.io.IOException;
import java.util.List;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.service.INoticeService;
import admin.service.NoticeServiceImpl;
import admin.vo.AdminVO;
import admin.vo.NoticeVO;

/**
 * Servlet implementation class NoticeMain
 */
@WebServlet("/admin/noticeList.do")
public class NoticeListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public NoticeListController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		
		INoticeService noticeService = NoticeServiceImpl.getInstance();
		
		List<NoticeVO> noticeList = noticeService.listNotice();
		
		request.setAttribute("notiList", noticeList);
		
		AdminVO av = (AdminVO)request.getSession().getAttribute("adLogin");
		
		if(av !=null) {
			
			request.getRequestDispatcher("/views/admin/noticeList.jsp").forward(request, response);
			
		}else {
			request.getRequestDispatcher("/views/admin/userNoticeList.jsp").forward(request, response);
			
		}
		
		
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
