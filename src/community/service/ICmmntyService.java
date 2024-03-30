package community.service;

import java.util.List;
import java.util.Map;

import community.vo.CmmntyVO;

public interface ICmmntyService {

	public List<CmmntyVO> displayAllCmmnty();

	public CmmntyVO getDetailContent(int cmmntyCode);

	int insertCmmnty(CmmntyVO cv);
	
	int updateView(int cmmntyCode);

	public int upLike(int cmmntyNo);

	String contentReport(int cmmntyCode);



}