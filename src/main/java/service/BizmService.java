package service;

import java.util.List;

import vo.BizmVO;

public interface BizmService {
	
	// ** selectList
	public List<BizmVO> selectList();

	// ** selectOne
	public BizmVO selectOne(BizmVO vo);

	// ** insert
	public int insert(BizmVO vo);

	// ** update
	public int update(BizmVO vo);

	// ** delete
	public int delete(BizmVO vo);
	
}
