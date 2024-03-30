package community.service;

import java.util.List;

import community.dao.CmmntyDaoImpl;
import community.dao.ICmmntyDao;
import community.vo.CmmntyVO;

public class CmmntyServiceImpl implements ICmmntyService{
	
	private static ICmmntyService singleTon = null;

	private CmmntyServiceImpl() {
	};

	public static ICmmntyService getInstance() {
		if (singleTon == null) {
			singleTon = new CmmntyServiceImpl();
		}
		return singleTon;
	}
	
	private ICmmntyDao cmmntyDao = CmmntyDaoImpl.getInstance();

	@Override
	public List<CmmntyVO> displayAllCmmnty() {
		List<CmmntyVO> cv = cmmntyDao.displayAllCmmnty();
		return cv;
	}

	@Override
	public CmmntyVO getDetailContent(int cmmntyCode) {
		
		CmmntyVO cv = cmmntyDao.getDetailContent(cmmntyCode);
		
		return cv;
	}

	@Override
	public int insertCmmnty(CmmntyVO cv) {
		return cmmntyDao.insertCmmnty(cv);
	}

	@Override
	public int updateView(int cmmntyCode) {
		return cmmntyDao.updateView(cmmntyCode);
	}

	@Override
	public int upLike(int cmmntyCode) {
		return cmmntyDao.upLike(cmmntyCode);
	}

	@Override
	public String contentReport(int cmmntyCode) {
		return cmmntyDao.contentReport(cmmntyCode);
	}


}
