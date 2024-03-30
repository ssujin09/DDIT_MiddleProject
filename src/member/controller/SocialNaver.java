package member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import member.service.CustomerServiceImpl;
import member.service.ICustomerService;

/**
 * Description : 소셜(네이버)로그인 처리 클래스 Date : 2024. 1. 10 History : - 작성자 : '최현흠',
 * 날짜 : 2024. 1. 10, 설명 : 최초작성 - 수정자 :
 * 
 * @author PC-22
 */
@WebServlet("/socialNaver.do")
public class SocialNaver extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SocialNaver() {
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

		String id = jsonData.getString("userId");
		
		PrintWriter out = response.getWriter();
		
		if (id != null) {
			
			out.print("ok");
			out.flush();
			
		} else {
			out.print("fail");
			out.flush();
		}

	}
}
