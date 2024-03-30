package member.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SocialVO {
	
	private String socialCtg;
	private String cstmrId;
	
	public SocialVO(String socialCtn, String cstmrId) {
		super();
		this.socialCtg = socialCtn;
		this.cstmrId = cstmrId;
	}
	
	public SocialVO() {
		// TODO Auto-generated constructor stub
	}
	
	
}
