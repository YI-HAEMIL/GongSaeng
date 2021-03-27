package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.BizmVO;

@Repository
public class BizmDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NS="com.project.BizmMapper.";
	
	// ** selectList
	public List<BizmVO> selectList() {
		return sqlSession.selectList(NS + "selectList");
	}

	// ** selectOne
	public BizmVO selectOne(BizmVO vo) {
		return sqlSession.selectOne(NS + "selectOne", vo);
	}

	// ** insert
	public int insert(BizmVO vo) {
		return sqlSession.insert(NS + "insert", vo);
	}

	// ** update
	public int update(BizmVO vo) {
		return sqlSession.update(NS + "update", vo);
	}

	// ** delete
	public int delete(BizmVO vo) {
		return sqlSession.delete(NS + "delete", vo);
	}
}
