package restaurant.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MenuVO {
	private int menuCode;
	private String menuName;
	private String menuPrice;
	private int rstrntCode;
	public MenuVO() {
		// TODO Auto-generated constructor stub
	}
	public MenuVO(int menuCode, String menuName, String menuPrice, int rstrntCode) {
		super();
		this.menuCode = menuCode;
		this.menuName = menuName;
		this.menuPrice = menuPrice;
		this.rstrntCode = rstrntCode;
	}
	
}
