package admin.dao;

import java.sql.SQLException;
import java.util.Map;

import admin.vo.AdminVO;

public interface IAdminDao {
	
	public AdminVO adLogin(Map<String, Object> map) throws SQLException;
	
	
}
