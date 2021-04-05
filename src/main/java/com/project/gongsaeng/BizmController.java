package com.project.gongsaeng;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import service.BizmService;
import vo.BizmVO;

@Controller
public class BizmController {
	@Autowired
	BizmService service;
	
	@RequestMapping(value="/bloginf")
	public ModelAndView bloginf(ModelAndView mv) {
		mv.setViewName("mytarget/bloginForm");
		return mv;
	} //bloginf
	
	@RequestMapping(value="/blogin")
	public ModelAndView blogin(HttpServletRequest request ,ModelAndView mv, BizmVO vo) {
		String password = vo.getBizm_pwd();
		String group = "business";
		
		vo = service.selectOne(vo);
		if(vo != null) {
			if(vo.getBizm_pwd().equals(password)) {
				request.getSession().setAttribute("loginID", vo.getBizm_id());
				request.getSession().setAttribute("group", group);
				mv.addObject("loginSuccess", "T");
				mv.addObject("msg", vo.getBizm_id()+"님, 반갑습니다!");
			} else {
				mv.addObject("loginSuccess", "F");
				mv.addObject("msg", "비밀번호가 틀렸습니다. 다시 시도해주세요");
			}
		} else {
			mv.addObject("loginSuccess", "F");
			mv.addObject("msg", "없는 ID입니다. 다시 입력하시거나 회원가입 해주세요");
		}
		mv.setViewName("jsonView");
		return mv;
	} //blogin

	// 로그아웃은 BasicmController에 있음
	
	// ID 중복확인 (JSON으로 처리)
	@RequestMapping(value = "/bidCheck")
	public ModelAndView bidCheck(ModelAndView mv, BizmVO vo) {
		if (service.selectOne(vo) != null) {
			mv.addObject("idUse", "F"); // 사용불가
		} else {
			mv.addObject("idUse", "T"); // 사용가능
		}
		mv.setViewName("jsonView");
		return mv;
	} // idCheck
	
	@RequestMapping(value="/bjoinf")
	public ModelAndView bjoinf(ModelAndView mv) {
		mv.setViewName("mytarget/bjoinForm");
		return mv;
	} //bjoinf
	
	@RequestMapping(value="/binsert")
	public ModelAndView binsert(ModelAndView mv, BizmVO vo) {
		if(service.insert(vo) > 0) {
			mv.addObject("joinSuccess","T");
			mv.addObject("msg", "회원가입에 성공하였습니다. 로그인 후 이용해주세요");
		} else {
			mv.addObject("joinSuccess","F");
			mv.addObject("msg", "회원가입에 실패하였습니다. 다시 시도해주세요");
		}
		mv.setViewName("jsonView");
		return mv;
	} //binsert
	
	@RequestMapping(value="/binfo")
	public ModelAndView binfo(HttpServletRequest request, ModelAndView mv, BizmVO vo) {
		
		HttpSession session = request.getSession(false);
		vo.setBizm_id((String)session.getAttribute("loginID"));
		
		vo = service.selectOne(vo);
		if(vo != null) {
			mv.addObject("bVO", vo);
			mv.setViewName("mybox/binfoForm");
		} else {
			mv.addObject("msg", "잘못된 접근입니다. 다시 시도해주세요");
			mv.setViewName("home");
		}
		return mv;
	} //binfo
	
	@RequestMapping(value = "/bupdate")
	public ModelAndView bupdate(ModelAndView mv, BizmVO vo) {
		if (service.update(vo) > 0) {
			mv.addObject("updateSuccess", "T");
			mv.addObject("msg", "정상적으로 수정되었습니다");
		} else {
			mv.addObject("updateSuccess", "F");
			mv.addObject("msg", "정보 수정에 실패하였습니다. 다시 시도해주세요");
		}
		mv.setViewName("jsonView");
		return mv;
	} // bupdate
	
	@RequestMapping(value="/bdelete")
	public ModelAndView bdelete(HttpServletRequest request, ModelAndView mv, BizmVO vo) {
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("loginID") != null) {
			if(service.delete(vo)>0) {
				session.invalidate();
				mv.addObject("deleteSuccess", "T");
				mv.addObject("msg", "정상적으로 탈퇴되었습니다. 개인정보는 안전하게 삭제됩니다");
			} else {
				mv.addObject("deleteSuccess", "F");
				mv.addObject("msg", "회원 탈퇴에 실패하였습니다. 다시 시도해주세요");
			}
		} else {
			mv.addObject("deleteSuccess", "F");
			mv.addObject("msg", "잘못된 접근입니다. 다시 시도해주세요");
		}
		mv.setViewName("jsonView");
		return mv;
	} //bdelete
}
