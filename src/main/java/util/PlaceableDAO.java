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
	
	// ** insert
	public int insert(PlaceableVO vo) {
		return sqlSession.insert(NS+"insert", vo);
	}
	
	// ** delete
	public int delete(PlaceableVO vo) {
		return sqlSession.delete(NS+"delete", vo);
	}
}
