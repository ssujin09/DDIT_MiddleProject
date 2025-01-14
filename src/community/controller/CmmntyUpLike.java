package community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import community.service.CmmntyServiceImpl;
import community.service.ICmmntyService;

@WebServlet("/cmmnty/uplike.do")
public class CmmntyUpLike extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ICmmntyService cmmntyService = CmmntyServiceImpl.getInstance();
	
    public CmmntyUpLike() {
    	
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int cmmntyCode = Integer.parseInt(request.getParameter("cmmntyCode"));
		
		cmmntyService.upLike(cmmntyCode);
		
		response.sendRedirect("detail.do?cmmntyCode="+cmmntyCode);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
