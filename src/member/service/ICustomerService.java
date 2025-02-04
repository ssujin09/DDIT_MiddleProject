package member.service;

import java.sql.SQLException;
import java.util.Map;

import member.vo.CustomerVO;
import member.vo.SocialVO;

public interface ICustomerService {

	//접근제한자 반환타입 메소드명(매개변수)
	
	//로그인 id-pw 검증
	public CustomerVO loginChk(Map<String, Object> map);

	public CustomerVO getSocialInfo(String cstmrId);

	public String socialChk(String userId);
	
	public int socialSignUp(SocialVO sv);

	public int kakaoJoin(CustomerVO cv);

	public int insertSocial(SocialVO sv);
	
	public String getCustomer(String cstmrId);

	public int cstmrJoin(CustomerVO cv);
	
	public String searchId(Map<String, Object> map);
	
	public String getSocialTag(String cstmrId);
	
	public String getCstmrId(Map<String, Object> map);
	
	public int resetPass(Map<String, Object> map);
	
	public String nickChk(String cstmrNick);
	
}
