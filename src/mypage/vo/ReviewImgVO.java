package mypage.vo;

import lombok.Getter;
import lombok.Setter;

/**
	 * Description : 리뷰 사진 VO 클래스
	 * Date : 2024. 1. 16.
	 * History :
	 * - 작성자 : '선민수', 날짜 : 2024. 1. 16., 설명 : 최초작성
	 * - 수정자 : 
	 * @author pok4k
	 */
@Setter
@Getter
public class ReviewImgVO {
	private int reviewFileNo;
	private String reviewFilePath;
	private String reviewFileName;
	private String reviewFileExtsn;
	private int reviewNo;
	
	public ReviewImgVO() {
		// TODO Auto-generated constructor stub
	}

	public ReviewImgVO(int reviewFileNo, String reviewFilePath, String reviewFileName, String reviewFileExtsn,
			int reviewNo) {
		super();
		this.reviewFileNo = reviewFileNo;
		this.reviewFilePath = reviewFilePath;
		this.reviewFileName = reviewFileName;
		this.reviewFileExtsn = reviewFileExtsn;
		this.reviewNo = reviewNo;
	}
	
	
	
}
