package util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.ReservVO;

@Repository
public class ReservDAO {
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NS="com.project.ReservMapper.";
	
	// ** selectList_M
	public List<ReservVO> selectList_M(ReservVO vo) {
		return sqlSession.selectList(NS+"selectList_M", vo);
	}
	
	// ** selectList_B
	public List<ReservVO> selectList_B(ReservVO vo) {
		return sqlSession.selectList(NS+"selectList_B", vo);
	}
	
	// ** selectOne
	public ReservVO selectOne(ReservVO vo) {
		return sqlSession.selectOne(NS+"selectOne", vo);
	}
	
	// ** insert
	public int insert(ReservVO vo) {
		return sqlSession.insert(NS+"insert", vo);
	}
	
	// ** delete
	public int delete(ReservVO vo) {
		return sqlSession.insert(NS+"insert", vo);
	}
}
