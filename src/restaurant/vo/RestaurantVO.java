package restaurant.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RestaurantVO {
	 private int rstrntCode;
	 private String rstrntName;
	 private String rstrntAddr;
	 private String rstrntTel;
	 private String rstrntScore;
	 private int rstrntLike;
	 private String rstrntTag;
	 private int ctgryCode;
	 private String ctgryName;
	 
	public RestaurantVO() {
		// TODO Auto-generated constructor stub
	}

	
	public RestaurantVO(int rstrntCode, String rstrntName, String rstrntAddr, String rstrntTel, String rstrntScore,
			int rstrntLike, String rstrntTag, int ctgryCode, String ctgryName) {
		super();
		this.rstrntCode = rstrntCode;
		this.rstrntName = rstrntName;
		this.rstrntAddr = rstrntAddr;
		this.rstrntTel = rstrntTel;
		this.rstrntScore = rstrntScore;
		this.rstrntLike = rstrntLike;
		this.rstrntTag = rstrntTag;
		this.ctgryCode = ctgryCode;
		this.ctgryName =ctgryName;
	}
	
	
	
	 
	 
}
