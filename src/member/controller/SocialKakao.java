package member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import member.service.CustomerServiceImpl;
import member.service.ICustomerService;

/**
 * Description : 소셜(카카오)로그인 처리 클래스 Date : 2024. 1. 10 History : - 작성자 : '최현흠',
 * 날짜 : 2024. 1. 10, 설명 : 최초작성 - 수정자 :
 * 
 * @author PC-22
 */
@WebServlet("/socialKakao.do")
public class SocialKakao extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SocialKakao() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		BufferedReader bf = request.getReader();
		StringBuffer sbf = new StringBuffer();
		String line;

		while ((line = bf.readLine()) != null) {
			sbf.append(line);
		}
		
		JSONObject jsonData = new JSONObject(sbf.toString());
		
		
		String cstmrPhone = jsonData.getString("userPhone");
		

		ICustomerService customerService = CustomerServiceImpl.getInstance();
		
		String socialId = customerService.socialChk(cstmrPhone);
		
		
		if (socialId != null) {
			// 로그인 처리
			PrintWriter out = response.getWriter();
			out.print("ok");
			out.flush();

		} else {
			PrintWriter out = response.getWriter();
			out.print("fail");
			out.flush();
			
			
			
			
			// 회원가입 페이지로 이동

//			CustomerVO cv = new CustomerVO();
//			cv.setCstmrId(userId);
//			cv.setCstmrName(userName);
//			cv.setCstmrEmail(email);
//			cv.setCstmrPhone(phone);
//			cv.setCstmrGender(userGneder);
//			
//			SocialVO sv = new SocialVO(token, socialCtg, userId);
//			
//			int cnt = customerService.kakaoJoin(cv);
//			int cnt1 = customerService.insertSocial(sv);
//			
//			
//			if (cnt > 0 && cnt1 > 0) {
//				request.getSession().setAttribute("userId", userId);
//				request.getSession().setAttribute("socialTag", socialCtg);
//				request.getRequestDispatcher(request.getContextPath()+"/Main").forward(request, response);
//				
//			} else {
//				System.out.println("err");
//			}

//			SocialVO sv = new SocialVO(token, socialCtg, userId);
//			
//			int cnt = customerService.socialSignUp(sv);
//			
//			
//			if (cnt > 0) {
//				request.getSession().setAttribute("userId", userId);
//				request.getSession().setAttribute("social", socialCtg);
//				request.getRequestDispatcher("/Main").forward(request, response);
//				
//			} else {
//				response.sendRedirect("login.html");
//			}
		}

	}

}
