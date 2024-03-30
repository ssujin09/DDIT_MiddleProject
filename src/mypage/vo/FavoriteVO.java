package mypage.vo;

import lombok.Getter;
import lombok.Setter;

/**
	 * Description : 즐겨찾는 가게 VO 클래스
	 * Date : 2024. 1. 16.
	 * History :
	 * - 작성자 : '선민수', 날짜 : 2024. 1. 16., 설명 : 최초작성
	 * - 수정자 : 
	 * @author pok4k
	 */
@Getter
@Setter
public class FavoriteVO {
	private int favoriteNo;
	private String cstmrId;
	private int rstrntCode;
	
	public FavoriteVO() {
		// TODO Auto-generated constructor stub
	}

	public FavoriteVO(int favoriteNo, String cstmrId, int rstrntCode) {
		super();
		this.favoriteNo = favoriteNo;
		this.cstmrId = cstmrId;
		this.rstrntCode = rstrntCode;
	}
	
	
}
