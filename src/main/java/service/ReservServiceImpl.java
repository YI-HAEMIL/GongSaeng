package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.ReservDAO;
import vo.ReservVO;

@Service
public class ReservServiceImpl implements ReservService {
	@Autowired
	ReservDAO dao;
	
	// ** selectList_M
	public List<ReservVO> selectList_M(ReservVO vo) {
		return dao.selectList_M(vo);
	}

	// ** selectList_B
	public List<ReservVO> selectList_B(ReservVO vo) {
		return dao.selectList_B(vo);
	}

	// ** selectOne
	public ReservVO selectOne(ReservVO vo) {
		return dao.selectOne(vo);
	}

	// ** insert
	public int insert(ReservVO vo) {
		return dao.insert(vo);
	}

	// ** delete
	public int delete(ReservVO vo) {
		return dao.delete(vo);
	}
}
