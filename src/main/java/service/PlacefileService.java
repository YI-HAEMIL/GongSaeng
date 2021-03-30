package service;

import java.util.List;

import vo.PlacefileVO;

public interface PlacefileService {
	// ** 파일 리스트 출력
	public List<PlacefileVO> getFileList(int placeid);

	// ** 파일 업로드
	public void uploadFile(String originalfileName, String saveFileName, long fileSize, String savePath, int placeid);
}
