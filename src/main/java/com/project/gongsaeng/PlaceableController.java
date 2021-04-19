package com.project.gongsaeng;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.PlaceableService;
import vo.PlaceableVO;

@Controller
public class PlaceableController {
	@Autowired
	PlaceableService service;
	
	@RequestMapping(value="/ableinsert")
	public ModelAndView ableinsert(ModelAndView mv, PlaceableVO vo) {
		if(service.insert(vo)>0) {
			mv.addObject("insertSuccess", "T");
		} else {
			mv.addObject("insertSuccess", "F");
		}
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="/abledetail")
	public ModelAndView abledetail(HttpServletRequest request, ModelAndView mv, PlaceableVO vo) {
		HttpSession session = request.getSession(false);
		vo.setBizm_id((String)session.getAttribute("loginID"));
		
		List<PlaceableVO> list=service.selectList(vo);
		if(list != null) {
			mv.addObject("avoList", list);
			mv.setViewName("mybox/pabledetailForm");
		} else {
			mv.addObject("msg", "이용 가능 시간이 등록되어 있지 않습니다. 스케줄을 설정해주세요");
			mv.setViewName("mybox/pableForm");
		}
		return mv;
	}
	
	@RequestMapping(value="/abledelete")
	public ModelAndView abledelete(ModelAndView mv, PlaceableVO vo) {
		if(service.delete(vo)>0) {
			mv.addObject("deleteSuccess", "T");
			mv.addObject("msg", "삭제가 정상적으로 처리되었습니다");
		} else {
			mv.addObject("deleteSuccess", "F");
			mv.addObject("msg", "삭제에 실패하였습니다. 다시 시도해주세요");
		}
		mv.setViewName("jsonView");
		return mv;
	}
	

	@RequestMapping(value="/reservf")
	public ModelAndView reservf(ModelAndView mv, PlaceableVO vo) {
		vo=service.selectOne(vo);
		if(vo != null) {
			mv.addObject("aVO", vo);
		} 
		mv.setViewName("placeReserv/reservationForm");
		return mv;
	}
	
}
