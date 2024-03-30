package mypage.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import member.service.CustomerServiceImpl;
import member.service.ICustomerService;
import member.vo.CustomerVO;
import mypage.service.IMypageService;
import mypage.service.MypageServiceImple;
import mypage.util.FileUtil;

/**
	 * Description : 회원정보 수정을 위한 컨트롤러 클래스
	 * Date : 2024. 1. 11.
	 * History :
	 * - 작성자 : '선민수', 날짜 : 2024. 1. 11., 설명 : 최초작성
	 * - 수정자 : 
	 * @author pok4k
	 */
@MultipartConfig
@WebServlet("/mypage/setting.do")
public class ProfileSetting extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	IMypageService mypageSerivce = MypageServiceImple.getInstance();
	ICustomerService cService = CustomerServiceImpl.getInstance();
	private static final String UPLOAD_DIR = "upload_files";
       
    public ProfileSetting() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.sendRedirect(request.getContextPath()+"/views/mypage/profileSetting.jsp");
		request.getRequestDispatcher("/views/mypage/profileSetting.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int profileImgNo = 0;
		CustomerVO myInfo = (CustomerVO) request.getSession().getAttribute("loginCode");
		String myId = myInfo.getCstmrId();
		String cstmrName = request.getParameter("cstmrName");
		String cstmrPhone = request.getParameter("cstmrPhone");
		String cstmrNick = request.getParameter("cstmrNick");
		String cstmrEmail = request.getParameter("cstmrEmail");
		String cstmrAddr = request.getParameter("cstmrAddr");
	    
		response.setContentType("text/html;charset=UTF-8");
		if(request.getPart("file") != null && request.getPart("file").getSize()>0 ) {
			System.out.println("파일정보있음");
			profileImgNo = FileUtil.prfileImgUpload(request.getPart("file"),myId);
		}
		
		
		CustomerVO cv = new CustomerVO();
		
	
		if(cstmrName != null) cv.setCstmrName(cstmrName);
		if(cstmrPhone != null)cv.setCstmrPhone(cstmrPhone);
		if(cstmrNick != null)cv.setCstmrNick(cstmrNick);
		if(cstmrEmail != null)cv.setCstmrEmail(cstmrEmail);
		if(cstmrAddr != null)cv.setCstmrAddr(cstmrAddr);
		if(profileImgNo != 0) cv.setProfileImgNo(profileImgNo);
		
		cv.setCstmrId(myInfo.getCstmrId());
		int cnt = mypageSerivce.cstmrProfileSetting(cv);	
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", myInfo.getCstmrId());
		map.put("userPw", myInfo.getCstmrPw());
		
		
		if(cnt >0 ) {
			System.out.println("수정성공");
//			if(profileImgNo != 0) myInfo.setProfileImgNo(profileImgNo);
//			request.getSession().setAttribute("loginCode", myInfo);
			
			request.getSession().setAttribute("loginCode", cService.loginChk(map));
			response.sendRedirect(request.getContextPath()+"/mypage/main.do");
		}
		else {
			System.out.println("수정실패");
			response.sendRedirect(request.getContextPath()+"/mypage/setting.do");
		}
		
	
		
		
	}
}
