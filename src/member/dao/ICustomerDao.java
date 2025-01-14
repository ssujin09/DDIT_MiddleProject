package member.dao;

import java.sql.SQLException;
import java.util.Map;

import member.vo.CustomerVO;
import member.vo.SocialVO;

public interface ICustomerDao {

	//로그인 id-pw 검증
	public CustomerVO loginChk(Map<String, Object> map) throws SQLException;

	public String socialChk(String userId) throws SQLException;

	public int socialSignUp(SocialVO sv);

	public int kakaoJoin(CustomerVO cv);

	public int insertSocial(SocialVO sv);

	public CustomerVO getSocialInfo(String cstmrId) throws SQLException;

	public String getCustomer(String cstmrId) throws SQLException;

	public int cstmrJoin(CustomerVO cv);

	public String searchId(Map<String, Object> map);

	public String getSocialTag(String cstmrId);

	public String getCstmrId(Map<String, Object> map);

	public int resetPass(Map<String, Object> map);

	public String nickChk(String cstmrNick);
	
}
