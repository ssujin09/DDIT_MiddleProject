package mypage.vo;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;


/**
	 * Description : 리뷰 정보 VO 클래스
	 * Date : 2024. 1. 16.
	 * History :
	 * - 작성자 : '선민수', 날짜 : 2024. 1. 16., 설명 : 최초작성
	 * - 수정자 : 
	 * @author pok4k
	 */
@Setter
@Getter
public class ReviewVO {

	private int reviewNo;
	private String reviewDate;
	private String reviewContent;
	private int reviewLike;
	private int reviewScore;
	private String cstmrId;
	private String reviewReport;
	private int reviewTaste;
	private int reviewService;
	private int reviewPrice;
	private int rstrntCode;

	
	
	public ReviewVO() {
		// TODO Auto-generated constructor stub
	}


	public ReviewVO(int reviewNo, String reviewDate, String reviewContent, int reviewLike, int reviewScore,
			String cstmrId, String reviewReport, int reviewTaste, int reviewService, int reviewPrice,
			int rstrntCode) {
		super();
		this.reviewNo = reviewNo;
		this.reviewDate = reviewDate;
		this.reviewContent = reviewContent;
		this.reviewLike = reviewLike;
		this.reviewScore = reviewScore;
		this.cstmrId = cstmrId;
		this.reviewReport = reviewReport;
		this.reviewTaste = reviewTaste;
		this.reviewService = reviewService;
		this.reviewPrice = reviewPrice;
		this.rstrntCode = rstrntCode;
	}
	
	

}
