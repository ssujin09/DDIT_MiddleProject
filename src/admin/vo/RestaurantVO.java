package admin.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RestaurantVO {
	private int rstrntCode;
	private String rstrntName;
	private String rstrntAddr;
	private int rstrntTel;
	private int rstrntScore;
	private int rstrntLike;
	private String rstrntTag;
	private int ctgryCode;
	
	public RestaurantVO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public RestaurantVO(int rstrntCode, String rstrntName, String rstrntAddr, int rstrntTel, int rstrntScore,
			int rstrntLike, String rstrntTag, int ctgryCode) {
		super();
		this.rstrntCode = rstrntCode;
		this.rstrntName = rstrntName;
		this.rstrntAddr = rstrntAddr;
		this.rstrntTel = rstrntTel;
		this.rstrntScore = rstrntScore;
		this.rstrntLike = rstrntLike;
		this.rstrntTag = rstrntTag;
		this.ctgryCode = ctgryCode;
	}
	
	
	
}
