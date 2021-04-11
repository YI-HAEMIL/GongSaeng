package com.project.gongsaeng;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import search.SearchArea;
import service.PlaceinfoService;
import vo.PlacefileVO;
import vo.PlaceinfoVO;

@Controller
public class PlaceinfoController {
	@Autowired
	PlaceinfoService service;
	
	@RequestMapping(value="/placemodal")
	public ModelAndView placemodal(ModelAndView mv, PlaceinfoVO vo) {
		vo=service.selectOne(vo);
		if(vo != null) {
			int placeid=vo.getPlace_id();
			
			String[] area = vo.getPlace_area().split(",");
			mv.addObject("parea", area);

			String[] size = vo.getPlace_size().split("/");
			mv.addObject("psize", size);

			List<PlacefileVO> imgList = service.getFileList(placeid);
			mv.addObject("pimgList", imgList);
			
			mv.addObject("ppVO", vo);
		} else {
			mv.addObject("msg", "잘못된 접근입니다. 다시 시도해주세요");
		}
		mv.setViewName("placeReserv/placemodal");
		return mv;
	}
	
	@RequestMapping(value="/parea")
	public ModelAndView parea(ModelAndView mv, PlaceinfoVO vo, SearchArea sa) {
		mv.addObject("keyword", sa.getKeyword());
		List<PlaceinfoVO> list = service.selectArea(sa);

		if (list != null) {
			List<String> thumbList = new ArrayList<String>();
			for (int i = 0; i < list.size(); i++) {
				int placeid = list.get(i).getPlace_id();
				List<PlacefileVO> imgList = service.getFileList(placeid);
				thumbList.add(imgList.get(0).getFile_path());
			}
			
			mv.addObject("thumbList", thumbList);
			mv.addObject("pvoList", list);

		} else if(list == null || list.size()==0) {
			mv.addObject("msg", "아직 장소가 등록되어있지 않습니다.");
		}
		mv.setViewName("placeReserv/pareaList");
		return mv;
	}
	
	@RequestMapping(value="/pinsertf")
	public ModelAndView pinsertf(HttpServletRequest request, ModelAndView mv, PlaceinfoVO vo, RedirectAttributes rttr) {
		HttpSession session = request.getSession(false);
		vo.setBizm_id((String)session.getAttribute("loginID"));
		
		if(service.selectOne(vo) != null) {
			rttr.addFlashAttribute("msg","장소는 한 개만 등록할 수 있습니다. 기존 장소를 수정하거나 삭제 후 등록해주세요");
			mv.setViewName("redirect:pdetail");
		} else {
			mv.setViewName("mybox/pinsertForm");
		}
		return mv;
	} //pinsertf
	
	@RequestMapping(value="/pinsert")
	public ModelAndView pinsert(HttpServletRequest request, MultipartHttpServletRequest mhsq,
			ModelAndView mv, PlaceinfoVO vo) throws IllegalStateException, IOException {
		
		// 로그인 한 아이디 = bizm_id
		HttpSession session = request.getSession(false);
		vo.setBizm_id((String)session.getAttribute("loginID"));
		
		String realPath = "D:/MyTest/MyWork/Gongsaeng/src/main/webapp/resources/placeImg/";
//		String realPath = "C:/Users/haechan/Desktop/MyTest/MyWork/GongSaeng/src/main/webapp/resources/placeImg/";
		
		File f1 = new File(realPath);
		if (!f1.exists())
			f1.mkdir(); // 없으면 생성해주기
		
		List<MultipartFile> fileList = mhsq.getFiles("uploadFile"); // 다중파일이므로 List
		
		// 이미지 넣었는지 체크 먼저해주고 인서트 진행
		if (fileList.size() < 1 && fileList.get(0).getOriginalFilename().equals("")) {
			mv.addObject("insertSuccess", "F");
			mv.addObject("msg", "이미지는 한 개 이상 선택해줘야 합니다");
		} else if (service.insert(vo) > 0) { // 정보 인서트
			
			// 다중 이미지 업로드 (placeid를 받아와야 해서 정보가 먼저 insert 되어야 가능)
			for (int i = 0; i < fileList.size(); i++) {
				// 파일 중복명 처리 위해서 추가
				String genId = UUID.randomUUID().toString();
					
				String originalfileName = fileList.get(i).getOriginalFilename();	// 본래 파일명
						
				String saveFileName = genId + originalfileName;					// 저장되는 파일명
				String saveUrl = realPath + saveFileName;						// 실제 저장될 파일 경로 (url)
				String savePath = "resources/placeImg/" + saveFileName; 		// 이클립스 내 파일 경로
				long fileSize = fileList.get(i).getSize(); 						// 파일 사이즈
						
				fileList.get(i).transferTo(new File(saveUrl)); 					// 파일 실제 경로에 저장
				int placeid = vo.getPlace_id();									// 장소번호(FK) 넣어주기
					
				service.uploadFile(originalfileName, saveFileName, fileSize, saveUrl, savePath, placeid); 
				// DB 업로드 > 서비스에서 처리
			} //for
			
			mv.addObject("msg", "장소 등록이 정상적으로 처리되었습니다.");

		} else {	// 정보 인서트 실패
			mv.addObject("insertSuccess", "F");
			mv.addObject("msg", "장소 등록에 실패하였습니다. 다시 시도해주세요");
		}

		mv.setViewName("jsonView");
		return mv;
		
	} //pinsert
	
	@RequestMapping(value="/pdetail")
	public ModelAndView pdetail(HttpServletRequest request, ModelAndView mv, PlaceinfoVO vo) {
		// 로그인 한 아이디 = bizm_id
		HttpSession session = request.getSession(false);
		vo.setBizm_id((String)session.getAttribute("loginID"));
		
		vo=service.selectOne(vo);
		if(vo != null) {
			int placeid=vo.getPlace_id();
			
			String[] area = vo.getPlace_area().split(",");
			mv.addObject("area", area);

			String[] size = vo.getPlace_size().split("/");
			mv.addObject("size", size);

			List<PlacefileVO> prevImgList = service.getFileList(placeid);
			mv.addObject("prevImgList", prevImgList);
			
			mv.addObject("pVO", vo);
			mv.setViewName("mybox/pdetailForm");
		} else {
			mv.addObject("msg", "장소가 등록되어 있지 않습니다. 장소를 먼저 등록해주세요");
			mv.setViewName("mybox/pinsertForm");
		}
		return mv;
	}
	
	@RequestMapping(value="/pupdate")
	public ModelAndView pupdate(HttpServletRequest request, MultipartHttpServletRequest mhsq,
			ModelAndView mv, PlaceinfoVO vo, PlacefileVO fvo) throws IllegalStateException, IOException {

		String realPath = "D:/MyTest/MyWork/Gongsaeng/src/main/webapp/resources/placeImg/";
//		String realPath = "C:/Users/haechan/Desktop/MyTest/MyWork/GongSaeng/src/main/webapp/resources/placeImg/";

		File f1 = new File(realPath);
		if (!f1.exists())
			f1.mkdir(); // 없으면 생성해주기

		List<MultipartFile> fileList = mhsq.getFiles("uploadFile"); // 새로 업로드한 파일
		
		if(service.update(vo) > 0) {
			if (fileList.size() > 0 && !fileList.get(0).getOriginalFilename().equals("")) {
				int placeid = vo.getPlace_id();		// 장소번호(FK) 넣어주기
				List<PlacefileVO> prevImgList = service.getFileList(placeid);
				
				service.deleteFile(fvo);	// DB에서 삭제
				
				for(int i=0; i<prevImgList.size(); i++) {
					File f = new File(prevImgList.get(i).getFile_url());
					if(f.exists()) f.delete();
				}
				
				for (int i = 0; i < fileList.size(); i++) {
					// 업로드 파일 중 없는 파일은 인서트 해주기
					String genId = UUID.randomUUID().toString();
					String originalfileName = fileList.get(i).getOriginalFilename(); // 본래 파일명

					String saveFileName = genId + originalfileName; 				// 저장되는 파일명
					String saveUrl = realPath + saveFileName;						// 실제 저장될 파일 경로 (url)
					String savePath = "resources/placeImg/" + saveFileName;			// 이클립스 내 파일 경로
					long fileSize = fileList.get(i).getSize(); 						// 파일 사이즈

					fileList.get(i).transferTo(new File(saveUrl));					// 파일 실제 경로에 저장

					service.uploadFile(originalfileName, saveFileName, fileSize, saveUrl, savePath, placeid); // 새로 업로드
				}
			}
			mv.addObject("updateSuccess","T");
			mv.addObject("msg", "장소 정보 수정이 정상적으로 처리되었습니다");
		} else {
			mv.addObject("updateSuccess","F");
			mv.addObject("msg", "장소 정보 수정에 실패하였습니다. 다시 시도해주세요");
		}
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="/pdelete")
	public ModelAndView pdelete(ModelAndView mv, PlaceinfoVO vo, PlacefileVO fvo) {
		
		List<PlacefileVO> prevImgList = service.getFileList(vo.getPlace_id());
		for(int i=0; i<prevImgList.size(); i++) {
			File f = new File(prevImgList.get(i).getFile_url());
			if(f.exists()) f.delete();
		}

		if (service.delete(vo) > 0) {
			mv.addObject("deleteSuccess", "T");
			mv.addObject("msg", "장소 삭제가 정상적으로 처리되었습니다");
		} else {
			mv.addObject("deleteSuccess", "F");
			mv.addObject("msg", "장소 정보 삭제에 실패하였습니다. 다시 시도해주세요");
		}
		mv.setViewName("jsonView");
		return mv;
	}

}