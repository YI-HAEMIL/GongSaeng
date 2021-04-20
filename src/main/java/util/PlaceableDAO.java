package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.PlaceableVO;

@Repository
public class PlaceableDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NS="com.project.PlaceableMapper.";
	
	// ** selectList
	public List<PlaceableVO> selectList(PlaceableVO vo){
		return sqlSession.selectList(NS+"selectList", vo);
	}
	
	// ** selectList_M
	public List<PlaceableVO> selectList_M(PlaceableVO vo){
		return sqlSession.selectList(NS+"selectList_M", vo);
	}
	
	// ** selectOne
	public PlaceableVO selectOne(PlaceableVO vo) {
		return sqlSession.selectOne(NS+"selectOne", vo);
	}
	
	// ** insert
	public int insert(PlaceableVO vo) {
		return sqlSession.insert(NS+"insert", vo);
	}
	
	// ** update_1
	public int update_1(PlaceableVO vo) {
		return sqlSession.insert(NS+"update_1", vo);
	}

	// ** update_0
	public int update_0(PlaceableVO vo) {
		return sqlSession.insert(NS+"update_0", vo);
	}
	
	// ** delete
	public int delete(PlaceableVO vo) {
		return sqlSession.delete(NS+"delete", vo);
	}
}
