package service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import util.PlaceinfoDAO;
import vo.PlacefileVO;
import vo.PlaceinfoVO;

@Service
public class PlaceinfoServiceImpl implements PlaceinfoService {
	@Autowired
	PlaceinfoDAO dao;

	// ** selectList
	public List<PlaceinfoVO> selectList(){
		return dao.selectList();
	}

	// ** selectOne
	public PlaceinfoVO selectOne(PlaceinfoVO vo){
		return dao.selectOne(vo);
	}
	// ** 파일 리스트 출력
	public List<PlacefileVO> getFileList(int placeid) {
		return dao.getFileList(placeid);
	}
	
	// ** insert
	public int insert(PlaceinfoVO vo) {
		return dao.insert(vo);
	}
	// ** 파일 업로드
	public void uploadFile(String originalfileName, String saveFileName, long fileSize, String saveUrl, String savePath, int placeid) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("origin_nm", originalfileName);
		hm.put("file_nm", saveFileName);
		hm.put("file_size", fileSize);
		hm.put("file_url", saveUrl);
		hm.put("file_path", savePath);
		hm.put("place_id", placeid);

		dao.uploadFile(hm);
	}

	// ** update
	public int update(PlaceinfoVO vo) {
		return dao.update(vo);
	}
	// ** 파일 업로드
	public void updateFile(String originalfileName, String saveFileName, long fileSize, String saveUrl, String savePath, int placeid) {
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("origin_nm", originalfileName);
		hm.put("file_nm", saveFileName);
		hm.put("file_size", fileSize);
		hm.put("file_url", saveUrl);
		hm.put("file_path", savePath);
		hm.put("place_id", placeid);

		dao.updateFile(hm);
	}

	// ** delete
	public int delete(PlaceinfoVO vo) {
		return dao.delete(vo);
	}
	// ** 파일 삭제
	public int deleteFile(PlacefileVO fvo) {
		return dao.deleteFile(fvo);
	}
}
