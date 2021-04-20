package service;

import java.util.List;

import vo.ReservVO;

public interface ReservService {
	// ** selectList_M
	public List<ReservVO> selectList_M(ReservVO vo);
	
	// ** selectList_B
	public List<ReservVO> selectList_B(ReservVO vo);
	
	// ** selectOne
	public ReservVO selectOne(ReservVO vo);
	
	// ** insert
	public int insert(ReservVO vo);
	
	// ** delete
	public int delete(ReservVO vo);
}
