package restaurant.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BusinessVO {
	private int bsnCode;
	private String bsnOpentime;
	private String bsnClosetime;
	private String bsnReststart;
	private String bsnRestfinish;
	private int rstrntCode;
	public BusinessVO() {
		// TODO Auto-generated constructor stub
	}
	public BusinessVO(int bsnCode, String bsnOpentime, String bsnClosetime, String bsnReststart, String bsnRestfinish,
			int rstrntCode) {
		super();
		this.bsnCode = bsnCode;
		this.bsnOpentime = bsnOpentime;
		this.bsnClosetime = bsnClosetime;
		this.bsnReststart = bsnReststart;
		this.bsnRestfinish = bsnRestfinish;
		this.rstrntCode = rstrntCode;
	}
	
	

}
