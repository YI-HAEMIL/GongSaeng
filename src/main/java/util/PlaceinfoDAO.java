package util;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import vo.PlacefileVO;
import vo.PlaceinfoVO;

@Repository
public class PlaceinfoDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final String NS="com.project.PlaceinfoMapper.";
	
	// ** selectList
	public List<PlaceinfoVO> selectList(){
		return sqlSession.selectList(NS+"selectList");
	}
	
	// ** selectOne
	public PlaceinfoVO selectOne(PlaceinfoVO vo) {
		return sqlSession.selectOne(NS+"selectOne", vo);
	}
	// ** 파일 리스트 출력
	public List<PlacefileVO> getFileList(int placeid) {
		return sqlSession.selectList(NS + "selectfileList", placeid);
	}
	
	// ** insert
	public int insert(PlaceinfoVO vo) {
		return sqlSession.insert(NS+"insert", vo);
	}
	// ** 파일 업로드
	public int uploadFile(HashMap<String, Object> hm) {
		return sqlSession.insert(NS+"uploadFile", hm);
	}
		
	// ** update
	public int update(PlaceinfoVO vo) {
		return sqlSession.update(NS+"update", vo);
	}
	
	// ** delete
	public int delete(PlaceinfoVO vo) {
		return sqlSession.delete(NS+"delete", vo);
	}
	
	

	
}
