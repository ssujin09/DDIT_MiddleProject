package meeting.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import meeting.service.IMeetingService;
import meeting.service.MeetingServiceImpl;
import meeting.vo.MeetingDetailVO;
import member.vo.CustomerVO;

@WebServlet("/restaurant/join.do")
public class JoinMeeting extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
		IMeetingService meetingService = MeetingServiceImpl.getInstance();
	
	
    public JoinMeeting() {
        super();
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
    	String cstmrId = "";
    	if(request.getSession().getAttribute("loginCode") != null) {
    		CustomerVO myInfo = (CustomerVO) request.getSession().getAttribute("loginCode");
    		cstmrId = myInfo.getCstmrId();
    	}
    	int meetingNo = Integer.parseInt(request.getParameter("meetingNo"));
    	
    	MeetingDetailVO mdv = new MeetingDetailVO();
    	mdv.setMeetingNo(meetingNo);
    	mdv.setCstmrId(cstmrId);
    	
    	meetingService.joinMeeting(mdv);
    	
    	
	}
	

}
