package admin.dao;

import java.sql.SQLException;
import java.util.Map;

import admin.vo.AdminVO;
import member.controller.MyBatisDao;

public class AdminDaoImpl extends MyBatisDao implements IAdminDao {

private static IAdminDao adDao;
	
	public AdminDaoImpl() {
	}

	public static IAdminDao getInstance() {
		if(adDao == null) {
			adDao= new AdminDaoImpl();
		}
		return adDao;
	}

	@Override
	public AdminVO adLogin(Map<String, Object> map) throws SQLException {
		
		return selectOne("admin.adLogin", map);
	}
	
	
}
