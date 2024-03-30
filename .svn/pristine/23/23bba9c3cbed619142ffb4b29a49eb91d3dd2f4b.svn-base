package meeting.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import meeting.vo.MeetingDetailVO;
import meeting.vo.MeetingVO;
import util.MyBatisUtil;

/**
	 * Description : 모임 관련 다오 인터페이스를 임플리먼트한 클래스
	 * Date : 2024. 1. 17
	 * History :
	 * - 작성자 : '선민수', 날짜 : 2024. 1. 17, 설명 : 최초작성
	 * - 수정자 : 
	 * @author PC-09
	 */
public class MeetingDaoImpl implements IMeetingDao {
	
	
	private static IMeetingDao singleTon = null;

	private MeetingDaoImpl() {
	};

	public static IMeetingDao getInstance() {
		if (singleTon == null) {
			singleTon = new MeetingDaoImpl();
		}
		return singleTon;
	}

	@Override
	public int makeMeeting(MeetingVO mv) {
		SqlSession sqlSession = MyBatisUtil.getInstance();
		int result = 0;
		try {
			result = sqlSession.insert("meeting.makeMeeting",mv);
			if(result>0) {
				sqlSession.commit();
				result = sqlSession.insert("meeting.insertMeetingDetail", mv);
				if(result>0)sqlSession.commit();
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}

	@Override
	public List<MeetingVO> getMeetingList(int rstrntCode) {
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		List<MeetingVO> meetingList = new ArrayList<MeetingVO>();
		try {

			meetingList = sqlSession.selectList("meeting.getMeetingList",rstrntCode);
			if(meetingList.size()>0) {
				sqlSession.commit();
			}
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		
		return meetingList;
	}

	@Override
	public List<MeetingDetailVO> getMeetingDetail(int meetingNo) {
		List<MeetingDetailVO> mdv = new ArrayList<MeetingDetailVO>();
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			mdv = sqlSession.selectList("meeting.getMeetingDetail",meetingNo);
		} catch (PersistenceException e) {
			e.printStackTrace();
			
		}finally {
			sqlSession.close();
		}
		
		return mdv;
	}

	@Override
	public int getMeetingCount(int meetingNo) {
		
		int getMeetingCount = 0;
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			getMeetingCount = sqlSession.selectOne("meeting.getMeetingCount",meetingNo);
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return getMeetingCount;
	}

	@Override
	public void joinMeeting(MeetingDetailVO mdv) {
		int result = 0;
		SqlSession sqlSession = MyBatisUtil.getInstance();
		try {
			result = sqlSession.insert("meeting.joinMeeting",mdv);
			if(result> 0) {
				sqlSession.commit();
			}
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
	}

}
