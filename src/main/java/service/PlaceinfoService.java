package service;

import java.util.List;

import search.SearchArea;
import vo.PlacefileVO;
import vo.PlaceinfoVO;

public interface PlaceinfoService {
	// ** selectList
	public List<PlaceinfoVO> selectList();
	// ** selectArea
	public List<PlaceinfoVO> selectArea(SearchArea sa);
	// ** selectRandom
	public List<PlaceinfoVO> selectRandom();

	// ** selectOne
	public PlaceinfoVO selectOne(PlaceinfoVO vo);
	// ** 파일 리스트 출력
	public List<PlacefileVO> getFileList(int placeid);

	// ** insert
	public int insert(PlaceinfoVO vo);
	// ** 파일 업로드
	public void uploadFile(String originalfileName, String saveFileName, long fileSize, String saveUrl, String savePath, int placeid);
	
	// ** update
	public int update(PlaceinfoVO vo);
	// ** 파일 업로드
	public void updateFile(String originalfileName, String saveFileName, long fileSize, String saveUrl, String savePath, int placeid);

	// ** delete
	public int delete(PlaceinfoVO vo);
	// ** 파일 삭제
	public int deleteFile(PlacefileVO fvo);
	
}