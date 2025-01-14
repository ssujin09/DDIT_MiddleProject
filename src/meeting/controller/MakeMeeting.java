package meeting.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import meeting.service.IMeetingService;
import meeting.service.MeetingServiceImpl;
import meeting.vo.MeetingVO;
import member.vo.CustomerVO;
import restaurant.service.RestaurantService;
import restaurant.service.RestaurantServiceImpl;

@WebServlet("/restaurant/meeting.do")
public class MakeMeeting extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    IMeetingService meetingService = MeetingServiceImpl.getInstance();
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	request.setCharacterEncoding("UTF-8");
    	String cstmrId = "";
    	if(request.getSession().getAttribute("loginCode") != null) {
    		CustomerVO myInfo = (CustomerVO) request.getSession().getAttribute("loginCode");
    		cstmrId = myInfo.getCstmrId();
    	}
        // 클라이언트로부터 전송된 데이터 받기
        String meetingRegion = request.getParameter("location");
        LocalDate meetingDate = LocalDate.parse(request.getParameter("date"));
        LocalTime meetingTime = LocalTime.parse(request.getParameter("time"));
        int meetingNmpr = Integer.parseInt(request.getParameter("maxPeople"));
        String meetingComment = request.getParameter("description");
        int rstrntCode = Integer.parseInt(request.getParameter("hidden"));
        
        MeetingVO mv = new MeetingVO();
        
        mv.setMeetingRegion(meetingRegion);
        mv.setMeetingDate(meetingDate);
        mv.setMeetingTime(meetingTime);
        mv.setMeetingNmpr(meetingNmpr);
        mv.setMeetingComment(meetingComment);
        mv.setRstrntCode(rstrntCode);
        mv.setCstmrId(cstmrId);
        
        meetingService.makeMeeting(mv);
        
        
        
        
        
        
        
        // 받은 데이터를 콘솔에 출력 (테스트용)
        System.out.println("지역: " + meetingRegion);
        System.out.println("날짜: " + meetingDate);
        System.out.println("시간: " + meetingTime);
        System.out.println("최대 인원: " + meetingNmpr);
        System.out.println("한줄 내용: " + meetingComment);
        System.out.println("히든 : "+rstrntCode);

        // 실제로는 이 데이터를 데이터베이스에 저장하거나 다른 로직에 활용할 수 있습니다.

        // 응답으로 성공 상태 전송
        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        out.write("모임이 성공적으로 등록 되었습니다!");
        out.close();
    }
}
