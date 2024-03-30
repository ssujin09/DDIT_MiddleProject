package admin.service;

import java.util.List;

import admin.vo.CustomerVO;

public interface ICustomerService {

	List<CustomerVO> listCustomer();
	
	/**
	 * 관리자가 회원정보상세보기
	 * @param cstmrId
	 * @return
	 */
	CustomerVO getCustomerDetail(String cstmrId);
	
	/**
	 * 관리자가 경고회원 보기
	 * @return
	 */
	List<CustomerVO> getWarnCustomerList();

	/**
	 * 회원제재
	 * @param cstmrId
	 * @return
	 */
	int expelCustomer(String cstmrId);
	
}
