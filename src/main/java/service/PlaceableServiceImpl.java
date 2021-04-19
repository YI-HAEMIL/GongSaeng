package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.PlaceableDAO;
import vo.PlaceableVO;

@Service
public class PlaceableServiceImpl implements PlaceableService {
	@Autowired
	PlaceableDAO dao;
	
	// ** selectList
	public List<PlaceableVO> selectList(PlaceableVO vo){
		return dao.selectList(vo);
	}
	
	// ** selectOne
	public PlaceableVO selectOne(PlaceableVO vo) {
		return dao.selectOne(vo);
	}
	
	// ** insert
	public int insert(PlaceableVO vo) {
		return dao.insert(vo);
	}
	
	// ** delete
	public int delete(PlaceableVO vo) {
		return dao.delete(vo);
	}
}
