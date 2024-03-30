package admin.dao;

import java.util.List;

import admin.vo.CustomerVO;

public interface ICustomerDao {

	List<CustomerVO> listCustomer();
	
	/**
	 * 관리자가 회원상세정보를 가져오기 위한 메서드
	 * @param cstmrId 
	 * @return
	 */
	CustomerVO getCustomerDetail(String cstmrId);
	
	/**
	 * 관리자가 경고회원목록을 가져오기 위한 메서드
	 * @return
	 */
	List<CustomerVO> getWarnCustomerList();
	
	/**
	 * 경고 회원제재
	 * @param cstmrId
	 * @return
	 */
	int expelCustomer(String cstmrId);

}
