package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/resetPw.do")
public class ResetPw extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ResetPw() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cstmrId = request.getParameter("cstmrId");
		
		request.getSession().setAttribute("cstmrId", cstmrId);
		
		request.getRequestDispatcher("/views/customer/resetPw.jsp").forward(request, response);
		
	}

}
