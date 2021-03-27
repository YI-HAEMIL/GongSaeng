package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.BasicmDAO;
import vo.BasicmVO;

@Service
public class BasicmServiceImpl implements BasicmService {
	@Autowired
	BasicmDAO dao;

	// ** selectList
	public List<BasicmVO> selectList() {
		return dao.selectList();
	}

	// ** selectOne
	public BasicmVO selectOne(BasicmVO vo) {
		return dao.selectOne(vo);
	}

	// ** insert
	public int insert(BasicmVO vo) {
		return dao.insert(vo);
	}

	// ** update
	public int update(BasicmVO vo) {
		return dao.update(vo);
	}

	// ** delete
	public int delete(BasicmVO vo) {
		return dao.delete(vo);
	}
}
