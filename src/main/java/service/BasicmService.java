package service;

import java.util.List;

import vo.BasicmVO;

public interface BasicmService {
	// ** selectList
	public List<BasicmVO> selectList();
	
	// ** selectOne
	public BasicmVO selectOne(BasicmVO vo);
	
	// ** insert
	public int insert(BasicmVO vo);
	
	// ** update
	public int update(BasicmVO vo);
	
	// ** delete
	public int delete(BasicmVO vo);
}
