package admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;

import admin.vo.CustomerVO;
import util.MyBatisUtil;

public class CustomerDaoImpl implements ICustomerDao{
	
	private static ICustomerDao customerDao;
	
	private CustomerDaoImpl() {
	}
	
	public static ICustomerDao getInstance() {
		if(customerDao==null) {
			customerDao = new CustomerDaoImpl();
		}
		return customerDao;
	}

	@Override
	public List<CustomerVO> listCustomer() {
		
		List<CustomerVO> customerList = new ArrayList<CustomerVO>();
		
		SqlSession sqlSession =MyBatisUtil.getInstance();
		
		try {
			
			customerList= sqlSession.selectList("admin.selectCustomerList");
			
		}catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return customerList;
	}

	@Override
	public CustomerVO getCustomerDetail(String cstmrId) {
		
		CustomerVO cv = new CustomerVO();
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		try {
			cv=	sqlSession.selectOne("admin.customerDetail",cstmrId);
			
			if(cv != null) {
				sqlSession.commit();
			}
					
					
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
	
		return cv;
	}

	@Override
	public List<CustomerVO> getWarnCustomerList() {
		
		List<CustomerVO> warnCustomerList = new ArrayList<CustomerVO>();
		
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		try {
			warnCustomerList= sqlSession.selectList("admin.warnCustomerList");
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		
		return warnCustomerList;
	}

	@Override
	public int expelCustomer(String cstmrId) {
		
		SqlSession sqlSession = MyBatisUtil.getInstance();
		
		int cnt=0;
		
		try {
			
			cnt = sqlSession.update("admin.expelCustomer",cstmrId);
			
			if(cnt>0) {
				sqlSession.commit();
			}
			
		} catch (PersistenceException e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		System.out.println(cnt);
		return cnt;
	}


	
	
	

}
