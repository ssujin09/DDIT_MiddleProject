package admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.vo.AdminVO;


@WebServlet("/admin.do")
public class AdminMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdminMain() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AdminVO av = (AdminVO) request.getSession().getAttribute("adLogin");
		
		
		if (av != null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("adLogin", av);
			
			
			request.getRequestDispatcher("/views/admin/adMain.jsp").forward(request, response);
		}
		
	}

}
