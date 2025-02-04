package mypage.vo;

import lombok.Getter;
import lombok.Setter;
/**
	 * Description : 프로필 사진 VO 클래스
	 * Date : 2024. 1. 16.
	 * History :
	 * - 작성자 : '선민수', 날짜 : 2024. 1. 16., 설명 : 최초작성
	 * - 수정자 : 
	 * @author pok4k
	 */
@Getter
@Setter
public class ProfileImgVO {
	
	
	private int profileImgNo;
	private String profileImgName;
	private String profileImgCours;
	private String profileImgExstn;
	
	
	public ProfileImgVO() {
		// TODO Auto-generated constructor stub
	}
	
	public ProfileImgVO(String profileImgName, String profileImgCours, String profileImgExstn) {
		super();
		this.profileImgName = profileImgName;
		this.profileImgCours = profileImgCours;
		this.profileImgExstn = profileImgExstn;
	}
	
	
	
	
}
