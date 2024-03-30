package home.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CategoryVO {
	private int ctgryCode;
	private String ctgryName;
	public CategoryVO() {
		// TODO Auto-generated constructor stub
	}
	public CategoryVO(int ctgryCode, String ctgryName) {
		super();
		this.ctgryCode = ctgryCode;
		this.ctgryName = ctgryName;
	}
	
	
}
