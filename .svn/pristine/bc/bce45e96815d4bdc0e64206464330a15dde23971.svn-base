package admin.service;

import java.sql.SQLException;
import java.util.Map;

import com.itextpdf.text.pdf.PdfStructTreeController.returnType;

import admin.dao.AdminDaoImpl;
import admin.dao.IAdminDao;
import admin.vo.AdminVO;
import member.vo.CustomerVO;

public class AdminServiceImpl implements IAdminService {

	
	private static IAdminService adminService;
	
	private IAdminDao adDao;
	
	private AdminServiceImpl() {
		adDao = AdminDaoImpl.getInstance();
	}
	
	public static IAdminService getInstance() {
		if (adminService == null) {
			adminService = new AdminServiceImpl();
		}
		return adminService;
	}

	@Override
	public AdminVO adLogin(Map<String, Object> map) {
		AdminVO av = null;
		try {
			av = adDao.adLogin(map);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return av;
	}
	
	
}
