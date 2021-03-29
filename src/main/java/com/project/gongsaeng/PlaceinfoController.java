package com.project.gongsaeng;

import java.io.File;
import java.io.IOException;
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

import service.PlaceinfoService;
import vo.PlacefileVO;
import vo.PlaceinfoVO;

@Controller
public class PlaceinfoController {
	@Autowired
	PlaceinfoService service;
	
	@RequestMapping(value="/pinsertf")
	public ModelAndView pinsertf(ModelAndView mv) {
		mv.setViewName("mybox/pinsertForm");
		return mv;
	}
	
	@RequestMapping(value="/pinsert")
	public ModelAndView pinsert(HttpServletRequest request, MultipartHttpServletRequest mhsq, ModelAndView mv,
			PlaceinfoVO vo, RedirectAttributes rttr) throws IllegalStateException, IOException {
		
		// 로그인 한 아이디 = bizm_id
		HttpSession session = request.getSession(false);
		vo.setBizm_id((String)session.getAttribute("loginID"));
		
		if(service.insert(vo)>0) {
			// 다중 이미지 업로드
			String realPath="D:/MyTest/MyWork/Gongsaeng/src/main/webapp/resources/placeImg/";
			
			File f1 = new File(realPath);
			if(!f1.exists()) f1.mkdir(); // 없으면 생성해주기

			List<MultipartFile> fileList = mhsq.getFiles("uploadFile"); // 다중파일이므로 List
			if(fileList.size() == 1 && fileList.get(0).getOriginalFilename().equals("")) {
				mv.addObject("msg","이미지는 한 개 이상 선택해줘야 합니다");
				mv.setViewName("mybox/pinsertForm");
			} else {
				for(int i = 0; i < fileList.size(); i++) {
					// 파일 중복명 처리
					String genId=UUID.randomUUID().toString();
					// 본래 파일명
					String originalfileName=fileList.get(i).getOriginalFilename();
					// 저장되는 파일명
					String saveFileName=genId+originalfileName;
					String savePath=realPath+saveFileName; // 저장될 파일 경로 (url)
					long fileSize=fileList.get(i).getSize(); // 파일 사이즈
					fileList.get(i).transferTo(new File(savePath)); // 파일 저장
					int placeid=vo.getPlace_id();
					service.uploadFile(originalfileName, saveFileName, fileSize, savePath, placeid); // DB 업로드 > 가급적 서비스에서 처리
				}
			}
			
			rttr.addFlashAttribute("msg","장소 등록이 정상적으로 처리되었습니다.");
			mv.setViewName("redirect:pdetail");
		} else {
			mv.addObject("msg", "장소 등록에 실패하였습니다. 다시 시도해주세요");
			mv.setViewName("mybox/pinsertForm");
		}
		return mv;
	}
	
	@RequestMapping(value="/pdetail")
	public ModelAndView pdetail(HttpServletRequest request, ModelAndView mv, PlaceinfoVO vo) {
		// 로그인 한 아이디 = bizm_id
		HttpSession session = request.getSession(false);
		vo.setBizm_id((String)session.getAttribute("loginID"));
		
		vo=service.selectOne(vo);
		if(vo != null) {
			int placeid=vo.getPlace_id();
			List<PlacefileVO> uploadFileList = service.getFileList(placeid);
			mv.addObject("uploadFileList", uploadFileList);
			mv.addObject("pVO", vo);
			mv.setViewName("mybox/pdetailForm");
		} else {
			mv.addObject("msg", "장소가 등록되어 있지 않습니다. 장소를 먼저 등록해주세요");
			mv.setViewName("mybox/pinsertForm");
		}
		return mv;
	}
	
}
