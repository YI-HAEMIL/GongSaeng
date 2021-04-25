package com.project.gongsaeng;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.PlaceableService;
import service.PlaceinfoService;
import service.ReservService;
import vo.PlaceableVO;
import vo.PlaceinfoVO;
import vo.ReservVO;

@Controller
public class PlaceableController {
	@Autowired
	PlaceinfoService service;
	@Autowired
	PlaceableService aservice;
	@Autowired
	ReservService rservice;
	
	@RequestMapping(value="/ableinsert")
	public ModelAndView ableinsert(ModelAndView mv, PlaceableVO vo) {
		if(aservice.insert(vo)>0) {
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
		
		List<PlaceableVO> list=aservice.selectList(vo);
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
		if(aservice.delete(vo)>0) {
			mv.addObject("deleteSuccess", "T");
			mv.addObject("msg", "삭제가 정상적으로 처리되었습니다");
		} else {
			mv.addObject("deleteSuccess", "F");
			mv.addObject("msg", "삭제에 실패하였습니다. 다시 시도해주세요");
		}
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="/reservf") // 예약 페이지 이동
	public ModelAndView reservf(ModelAndView mv, PlaceableVO vo) {
		vo=aservice.selectOne(vo);
		if(vo != null) {
			mv.addObject("aVO", vo);
		} 
		mv.setViewName("placeReserv/reservationForm");
		return mv;
	}
	
	@RequestMapping(value="/rinsert") // 예약 접수
	public ModelAndView rinsert(HttpServletRequest request,	ModelAndView mv, ReservVO rvo, PlaceableVO pvo) {
		HttpSession session = request.getSession(false);
		rvo.setBasicm_id((String)session.getAttribute("loginID"));
		
		if(rservice.insert(rvo)>0) {
			pvo.setPlace_id(rvo.getPlace_id());
			pvo.setAble_date(rvo.getUse_date());
			aservice.update_1(pvo);
			mv.addObject("insertSuccess", "T");
			mv.addObject("msg", "예약이 정상적으로 처리되었습니다. 예약 내역은 마이페이지에서 확인 가능합니다");
		} else {
			mv.addObject("insertSuccess", "F");
			mv.addObject("msg", "예약에 실패하였습니다. 다시 시도해주세요");
		}
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="/rinfo_m") // 일반회원에게 보여지는 예약 리스트
	public ModelAndView rinfo_m(HttpServletRequest request, RedirectAttributes rttr,
			ModelAndView mv, ReservVO rvo) {
		HttpSession session = request.getSession(false);
		rvo.setBasicm_id((String)session.getAttribute("loginID"));
		
		List<ReservVO> list=rservice.selectList_M(rvo);
		if(list != null && list.size()>0) {
			mv.addObject("rvoList", list);
			mv.setViewName("mybox/rlistForm");
		} else {
			rttr.addFlashAttribute("msg", "예약 내역이 없습니다.");
			mv.setViewName("redirect:minfo");
		}
		return mv;
	}
	
	@RequestMapping(value="/rinfo_b") // 비즈니스회원에게 보여지는 예약 리스트
	public ModelAndView rinfo_b(HttpServletRequest request, RedirectAttributes rttr,
			ModelAndView mv, ReservVO rvo, PlaceinfoVO vo) {
		HttpSession session = request.getSession(false);
		vo.setBizm_id((String)session.getAttribute("loginID"));
		
		vo=service.selectOne(vo);
		if(vo != null) {
			int placeid=vo.getPlace_id();
			rvo.setPlace_id(placeid);
			
			List<ReservVO> list=rservice.selectList_B(rvo);
			if(list != null && list.size()>0) {
				mv.addObject("rvoList", list);
				mv.setViewName("mybox/rlistForm");
			} else {
				rttr.addFlashAttribute("msg", "예약 내역이 없습니다.");
				mv.setViewName("redirect:binfo");
			}
		}
		return mv;
	}
	
	@RequestMapping(value="/rdetail") // 예약 리스트에서 selectOne 했을 때 보여지는 예약 상세내용
	public ModelAndView rdetail(HttpServletRequest request, ModelAndView mv, ReservVO rvo) {
		rvo=rservice.selectOne(rvo);
		if(rvo != null) {
			mv.addObject("content", "예약자 ID: "+rvo.getBasicm_id()+
									"<br>예약 목적: "+rvo.getUse_purpose()+
									"<br>사용 인원: "+rvo.getUse_number()+
									"<br>예약 날짜: "+rvo.getReg_date());
		} 
		mv.setViewName("jsonView");
		return mv;
	}
	
	@RequestMapping(value="/rdelete") // 예약 취소 시 삭제
	public ModelAndView rdelete(HttpServletRequest request, ModelAndView mv, ReservVO rvo, PlaceableVO pvo) {
		return mv;
	}
	
}
