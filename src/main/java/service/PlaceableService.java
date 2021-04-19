package service;

import java.util.List;

import vo.PlaceableVO;

public interface PlaceableService {
	// ** selectList
	public List<PlaceableVO> selectList(PlaceableVO vo);
	// ** selectOne
	public PlaceableVO selectOne(PlaceableVO vo);
	// ** insert
	public int insert(PlaceableVO vo);
	// ** delete
	public int delete(PlaceableVO vo);
}
