package admin.dao;

import java.util.List;

import admin.vo.NoticeVO;

public interface INoticeDao {
	
	/**
	 * 공지사항목록을 조회하기 위한 메서드
	 * @return 공지사항 목록을 담은 메서드
	 */
	public List<NoticeVO> listNotice();

	/**
	 * 공지사항 상세보기를 조회하기 위한 메서드
	 * @param noticeCode
	 * @return 공지사항 상세보기를 담은 vo
	 */
	public NoticeVO getNoticeDetail(int noticeCode);

	/**
	 * 공지사항을 등록하기 위한 메서드
	 * @param nv
	 * @return 성공시 1, 실패시 0반환
	 */
	public int insertNotice(NoticeVO nv);
	
	/**
	 * 공지사항을 삭제하기 위한 메서드
	 * @param noticeCode
	 * @return 성공시 1, 실패시 0반환
	 */
	public int deleteNotice(int noticeCode);

	
	/**
	 * 공지사항을 수정하기 위한 메서드
	 * @param nv
	 * @return
	 */
	public int updateNotice(NoticeVO nv);
	

}
