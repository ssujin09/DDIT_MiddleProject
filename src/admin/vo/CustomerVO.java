package admin.vo;

import java.time.LocalDate;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomerVO {
	
	private String cstmrId;
	private String cstmrPw;
	private String cstmrNick;
	private String cstmrName;
	private String cstmrEmail;
	private String cstmrAddr;
	private String cstmrBir;
	private String cstmrGender;
	private String cstmrPhone;
	private int cstmrWarn;
	private int profileImgNo;
	private String cstmrExpel;
	
	
	
	
	public CustomerVO() {
		// TODO Auto-generated constructor stub
	}




	public CustomerVO(String cstmrId, String cstmrPw, String cstmrNick, String cstmrName, String cstmrEmail,
			String cstmrAddr, String cstmrBir, String cstmrGender, String cstmrPhone, int cstmrWarn, int profileImgNo,
			String cstmrExpel) {
		super();
		this.cstmrId = cstmrId;
		this.cstmrPw = cstmrPw;
		this.cstmrNick = cstmrNick;
		this.cstmrName = cstmrName;
		this.cstmrEmail = cstmrEmail;
		this.cstmrAddr = cstmrAddr;
		this.cstmrBir = cstmrBir;
		this.cstmrGender = cstmrGender;
		this.cstmrPhone = cstmrPhone;
		this.cstmrWarn = cstmrWarn;
		this.profileImgNo = profileImgNo;
		this.cstmrExpel = cstmrExpel;
	}
	
	
}
