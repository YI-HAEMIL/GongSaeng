package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BasicmVO;

@Repository
public class BasicmDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NS="com.project.BasicmMapper.";
	
	// ** selectList
	public List<BasicmVO> selectList(){
		return sqlSession.selectList(NS+"selectList");
	}
	
	// ** selectOne
	public BasicmVO selectOne(BasicmVO vo) {
		return sqlSession.selectOne(NS+"selectOne", vo);
	}
	
	// ** insert
	public int insert(BasicmVO vo) {
		return sqlSession.insert(NS+"insert", vo);
	}
	
	// ** update
	public int update(BasicmVO vo) {
		return sqlSession.update(NS+"update", vo);
	}
	
	// ** delete
	public int delete(BasicmVO vo) {
		return sqlSession.delete(NS+"delete", vo);
	}
	
}
