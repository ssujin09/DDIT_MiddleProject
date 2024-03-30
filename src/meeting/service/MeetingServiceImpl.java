package meeting.service;

import java.util.List;

import meeting.dao.IMeetingDao;
import meeting.dao.MeetingDaoImpl;
import meeting.vo.MeetingDetailVO;
import meeting.vo.MeetingVO;

/**
	 * Description : 모임 관련 서비스 인터페이스를 임플리먼트 한 클래스
	 * Date : 2024. 1. 17
	 * History :
	 * - 작성자 : '선민수', 날짜 : 2024. 1. 17, 설명 : 최초작성
	 * - 수정자 : 
	 * @author PC-09
	 */
public class MeetingServiceImpl implements IMeetingService{
	
	IMeetingDao meetingDao = MeetingDaoImpl.getInstance();
		
	private static IMeetingService singleTon = null;

	private MeetingServiceImpl() {
	};

	public static IMeetingService getInstance() {
		if (singleTon == null) {
			singleTon = new MeetingServiceImpl();
		}
		return singleTon;
	}

	@Override
	public int makeMeeting(MeetingVO mv) {
		
		
		return meetingDao.makeMeeting(mv);
	}

	@Override
	public List<MeetingVO> getMeetingList(int rstrntCode) {
		return meetingDao.getMeetingList(rstrntCode);
	}

	@Override
	public List<MeetingDetailVO> getMeetingDetail(int meetingNo) {
		// TODO Auto-generated method stub
		return meetingDao.getMeetingDetail(meetingNo);
	}

	@Override
	public int getMeetingCount(int meetingNo) {
	
		return meetingDao.getMeetingCount(meetingNo);
	}

	@Override
	public void joinMeeting(MeetingDetailVO mdv) {
		meetingDao.joinMeeting(mdv);
	}
	
	
	

	
}
