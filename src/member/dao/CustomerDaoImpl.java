package member.dao;

import java.sql.SQLException;
import java.util.Map;

import javax.mail.Session;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;


import member.controller.MyBatisDao;
import member.vo.CustomerVO;
import member.vo.SocialVO;
import util.MyBatisUtil;

public class CustomerDaoImpl extends MyBatisDao implements ICustomerDao {

	//dao객체 생성하기 - 싱글톤 방식으로
	private static ICustomerDao dao;
	//1. private constructor
	private CustomerDaoImpl () {}
	
	//2. static method
	public static ICustomerDao getInstance() {
		if(dao == null) dao = new CustomerDaoImpl();
		return dao;
	}
	
	@Override
	public CustomerVO loginChk(Map<String, Object> map) throws SQLException {
		
		return selectOne("customer.loginChk", map);
	}

	@Override
	public String socialChk(String userId) throws SQLException {
		
		return selectOne("customer.socialChk", userId);
	}

	@Override
	public int socialSignUp(SocialVO sv) {
		
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		try {
			cnt = sqlSession.insert("customer.socialSingUp", sv);
			if (cnt > 0) {
				sqlSession.commit();
			} 
		} catch (Exception e) {
			sqlSession.rollback();
		} finally {
			sqlSession.close();
		}
		
		return cnt;
		
	}

	@Override
	public int kakaoJoin(CustomerVO cv) {
		
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		try {
			
			cnt = sqlSession.insert("customer.kakaoJoin", cv);
			
			if (cnt > 0) {
				
				sqlSession.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
		} finally {
			sqlSession.close();
		}
		
		return cnt;
		
	}

	@Override
	public int insertSocial(SocialVO sv) {
		
	SqlSession sqlSession = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		try {
			
			cnt = sqlSession.insert("customer.insertSocial", sv);
			
			if (cnt > 0) {
				
				sqlSession.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
		} finally {
			sqlSession.close();
		}
		
		return cnt;
	}

	@Override
	public CustomerVO getSocialInfo(String cstmrId) {
		
		return selectOne("customer.getSocialInfo", cstmrId);
	}

	@Override
	public String getCustomer(String cstmrId) throws SQLException {
		
		return selectOne("customer.getCustomer", cstmrId);
	}

	@Override
	public int cstmrJoin(CustomerVO cv) {
		
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		
		try {
			
			cnt = sqlSession.insert("customer.cstmrJoin", cv);
			
			if (cnt > 0) {
				sqlSession.commit();
			} 
			
		} catch (PersistenceException e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}

	

	@Override
	public String searchId(Map<String, Object> map) {
		return selectOne("customer.searchId", map);
	}

	@Override
	public String getSocialTag(String cstmrId) {
		return selectOne("customer.getSocialTag", cstmrId);
	}

	@Override
	public String getCstmrId(Map<String, Object> map) {
		
		return selectOne("customer.getCstmrId", map);
	}

	@Override
	public int resetPass(Map<String, Object> map) {
		
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		int cnt = 0;
		
		try {
			cnt = sqlSession.update("customer.resetPass", map);
			
			if (cnt > 0) {
				sqlSession.commit();
			}
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return cnt;
	}

	@Override
	public String nickChk(String cstmrNick) {
		
		return selectOne("customer.nickChk", cstmrNick);
		
	}



}
