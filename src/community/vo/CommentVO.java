package community.vo;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

/**
 * Description : DB 테이블에 존재하는 컬럼명을 기준으로 데이터를 처리하기 위한 클래스
 * Date : 2024. 1. 11
 * History :
 * - 작성자 : '서어진', 날짜 : 2024. 1. 10, 설명 : 자유게시판 댓글 VO 최초작성
 * - 수정자 : '서어진', 날짜 : 2024. 1. 12, 설명 : 자유게시판 댓글 VO ccommentContent 추가
 * @author PC-08
*/

@Getter
@Setter

public class CommentVO {
	
	private int ccommentCode;
	private LocalDate ccommentDate;
	private int ccommentLike;
	private String cstmrId;
	private int cmmntyCode;
	private String ccommentReport;
	private String ccommentContent;
	
	public CommentVO() {
		// TODO Auto-generated constructor stub
	}

	public CommentVO(int ccommentCode, LocalDate ccommentDate, int ccommentLike, String cstmrId, int cmmntyCode,
			String ccommentReport, String ccommentContent) {
		super();
		this.ccommentCode = ccommentCode;
		this.ccommentDate = ccommentDate;
		this.ccommentLike = ccommentLike;
		this.cstmrId = cstmrId;
		this.cmmntyCode = cmmntyCode;
		this.ccommentReport = ccommentReport;
		this.ccommentContent = ccommentContent;
	}
	
	
	
}
