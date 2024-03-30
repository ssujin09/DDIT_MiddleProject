package meeting.dao;

import java.util.List;

import meeting.vo.MeetingDetailVO;
import meeting.vo.MeetingVO;

/**
	 * Description : 모임 관련 다오 인터페이스
	 * Date : 2024. 1. 17
	 * History :
	 * - 작성자 : '선민수', 날짜 : 2024. 1. 17, 설명 : 최초작성
	 * - 수정자 : 
	 * @author PC-09
	 */
public interface IMeetingDao {

	int makeMeeting(MeetingVO mv);

	List<MeetingVO> getMeetingList(int rstrntCode);

	List<MeetingDetailVO> getMeetingDetail(int meetingNo);

	int getMeetingCount(int meetingNo);

	void joinMeeting(MeetingDetailVO mdv);
	
}
