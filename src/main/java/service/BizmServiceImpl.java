package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.BizmDAO;
import vo.BizmVO;

@Service
public class BizmServiceImpl implements BizmService {
	@Autowired
	BizmDAO dao;

	// ** selectList
	public List<BizmVO> selectList(){
		return dao.selectList();
	}

	// ** selectOne
	public BizmVO selectOne(BizmVO vo) {
		return dao.selectOne(vo);
	}

	// ** insert
	public int insert(BizmVO vo) {
		return dao.insert(vo);
	}

	// ** update
	public int update(BizmVO vo) {
		return dao.update(vo);
	}

	// ** delete
	public int delete(BizmVO vo) {
		return dao.delete(vo);
	}
}
