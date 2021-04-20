package service;

import java.util.List;

import vo.PlaceableVO;

public interface PlaceableService {
	// ** selectList
	public List<PlaceableVO> selectList(PlaceableVO vo);
	
	// ** selectList_M
	public List<PlaceableVO> selectList_M(PlaceableVO vo);
	
	// ** selectOne
	public PlaceableVO selectOne(PlaceableVO vo);
	
	// ** insert
	public int insert(PlaceableVO vo);
	
	// ** update_1
	public int update_1(PlaceableVO vo);

	// ** update_0
	public int update_0(PlaceableVO vo);
	
	// ** delete
	public int delete(PlaceableVO vo);
}
