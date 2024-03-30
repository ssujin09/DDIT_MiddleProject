package admin.service;

import java.util.List;

import admin.dao.CustomerDaoImpl;
import admin.dao.ICustomerDao;
import admin.vo.CustomerVO;

public class CustomerServiceImpl implements ICustomerService{
	
	private static ICustomerService customerService;
	
	private ICustomerDao customerDao;
	
	private CustomerServiceImpl() {
		customerDao = CustomerDaoImpl.getInstance();
	}
	
	public static ICustomerService getInstance() {
		if(customerService == null) {
			customerService = new CustomerServiceImpl();
		}
		return customerService;
	}

	@Override
	public List<CustomerVO> listCustomer() {
		List<CustomerVO> customerList = customerDao.listCustomer();
		return customerList;
	}

	@Override
	public CustomerVO getCustomerDetail(String cstmrId) {
		CustomerVO cv = customerDao.getCustomerDetail(cstmrId);
		return cv;
	}

	@Override
	public List<CustomerVO> getWarnCustomerList() {
		List<CustomerVO> warnCustomerList = customerDao.getWarnCustomerList();
		return warnCustomerList;
	}

	@Override
	public int expelCustomer(String cstmrId) {
		int cnt = customerDao.expelCustomer(cstmrId);
		return cnt;
		
	}


	

	

}
