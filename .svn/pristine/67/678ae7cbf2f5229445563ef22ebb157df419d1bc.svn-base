package admin.service;

import java.util.List;

import admin.vo.NoticeVO;

public interface INoticeService {
	
	/**
	 * 공지사항 목록을 가져오기 위한 메서드
	 * @param nt
	 * @return 모든 공지사항 목록
	 */
	public List<NoticeVO> listNotice();
	
	/**
	 * 공지사항 상세정보를 가져오기 위한 메서드
	 * @param noticeCode
	 * @return 공지사항 정보를 담은 noticeVO객체
	 */
	public NoticeVO getNoticeDetail(int noticeCode);
	
	/**
	 * 공지사항을 등록하기 위한 메서드
	 * @param nv
	 * @return 등록 성공하면 1, 실패하면 0이 반환됨
	 */
	public int insertNotice(NoticeVO nv);
	
	/**
	 * 공지사항을 삭제하기 위한 메서드
	 * @param noticeCode
	 * @return 등록 성공하면 1, 실패하면 0이 반환됨
	 */
	public int deleteNotice(int noticeCode);
	
	
	/**
	 * 공지사항을 수정하기 위한 메서드
	 * @param nv
	 * @return
	 */
	public int updateNotice(NoticeVO nv);
	
	

}
