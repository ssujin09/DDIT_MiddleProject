package member.service;

import java.sql.SQLException;
import java.util.Map;

import member.dao.CustomerDaoImpl;
import member.dao.ICustomerDao;
import member.vo.CustomerVO;
import member.vo.SocialVO;

public class CustomerServiceImpl implements ICustomerService {

	private ICustomerDao dao;
	private static ICustomerService service;
	//1
	private CustomerServiceImpl() {
		 dao = CustomerDaoImpl.getInstance();
	}
	//2
	public static ICustomerService getInstance() {
		if(service == null) service = new CustomerServiceImpl();
		return service;
	}
	
	@Override
	public CustomerVO loginChk(Map<String, Object> map) {
		//dao가 넘겨주는 자료를 받아서 controller로 넘겨줘야 함..
		CustomerVO cv = null;
		try {
			cv = dao.loginChk(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cv;
	}
	@Override
	public String socialChk(String userId) {
		
		String social = "";
		try {
			social = dao.socialChk(userId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return social;
	}
	@Override
	public int socialSignUp(SocialVO sv) {
		
		int cnt = dao.socialSignUp(sv);
		
		return cnt;
	}
	@Override
	public int kakaoJoin(CustomerVO cv) {
		
		int cnt = dao.kakaoJoin(cv);
		return cnt;
	}
	
	@Override
	public int insertSocial(SocialVO sv) {
		int cnt = dao.insertSocial(sv);
		return cnt;
	}
	@Override
	public CustomerVO getSocialInfo(String cstmrId) {
		
		CustomerVO cv = null;
		try {
			cv = dao.getSocialInfo(cstmrId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cv;
	}
	@Override
	public String getCustomer(String cstmrId) {
		String id = "";
		try {
			id = dao.getCustomer(cstmrId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return id;
	}
	@Override
	public int cstmrJoin(CustomerVO cv) {
		
		int cnt = dao.cstmrJoin(cv);
		
		return cnt;
		
	}
	@Override
	public String searchId(Map<String, Object> map) {
		
		String cstmrId = dao.searchId(map);
		
		return cstmrId;
	}
	@Override
	public String getSocialTag(String cstmrId) {
		
		String socialTag = dao.getSocialTag(cstmrId);
		
		return socialTag;
	}
	@Override
	public String getCstmrId(Map<String, Object> map) {
		
		String cstmrId = dao.getCstmrId(map);
		return cstmrId;
	}
	@Override
	public int resetPass(Map<String, Object> map) {
		
		int cnt = dao.resetPass(map);
		
		return cnt;
	}
	@Override
	public String nickChk(String cstmrNick) {
		
		String cstmrId = dao.nickChk(cstmrNick);
		return cstmrId;
	}
}
