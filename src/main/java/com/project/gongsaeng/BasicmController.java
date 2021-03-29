package com.project.gongsaeng;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import service.BasicmService;
import vo.BasicmVO;

@Controller
public class BasicmController {
	@Autowired
	BasicmService service;
	
	@RequestMapping(value="/mloginf")
	public ModelAndView mloginf(ModelAndView mv) {
		mv.setViewName("mytarget/mloginForm");
		return mv;
	}
	
	@RequestMapping(value="/mlogin")
	public ModelAndView mlogin(HttpServletRequest request, ModelAndView mv, BasicmVO vo) {
		String password = vo.getBasicm_pwd();
		String group="basic";
		
		vo = service.selectOne(vo);
		if(vo != null) {
			if(vo.getBasicm_pwd().equals(password)) {
				request.getSession().setAttribute("loginID", vo.getBasicm_id());
				request.getSession().setAttribute("group", group);
				mv.addObject("msg", vo.getBasicm_id()+"님, 반갑습니다!");
				mv.setViewName("home"); // 부모 창 새로고침 성공, alert 메시지 확인 가능
			} else {
				mv.addObject("msg", "비밀번호가 틀렸습니다. 다시 시도해주세요");
				mv.setViewName("mytarget/mloginForm");
			}
		} else {
			mv.addObject("msg", "없는 ID입니다. 다시 입력하시거나 회원가입 해주세요");
			mv.setViewName("mytarget/mloginForm");
		}
		return mv;
	} //mlogin
	
	@RequestMapping(value="/logout")
	public ModelAndView logout(HttpServletRequest request, ModelAndView mv, RedirectAttributes rttr) {
		HttpSession session = request.getSession(false);
		String msg=null;
		if(session != null && session.getAttribute("loginID") != null) {
			session.invalidate();
			msg="로그아웃 성공하였습니다.";
		} else {
			msg="로그인을 하지 않았습니다. 로그인 해주세요.";
		}
		rttr.addFlashAttribute("msg", msg);
		mv.setViewName("redirect:home");	// 세션을 지워서인지 전체 새로고침됨. 괜찮음
		return mv;
	} //logout
	
	// ID 중복확인 (JSON으로 처리)
	@RequestMapping(value = "/midCheck")
	public ModelAndView idCheck(ModelAndView mv, BasicmVO vo) {
		if (service.selectOne(vo) != null) {
			mv.addObject("idUse", "F"); // 사용불가
		} else {
			mv.addObject("idUse", "T"); // 사용가능
		}
		mv.setViewName("jsonView");
		return mv;
	} // idCheck
	
	@RequestMapping(value="/mjoinf")
	public ModelAndView mjoinf(ModelAndView mv) {
		mv.setViewName("mytarget/mjoinForm");
		return mv;
	} //mjoinf
	
	@RequestMapping(value="/minsert")	// frame, 메시지 출력 OK
	public ModelAndView minsert(ModelAndView mv, BasicmVO vo) {
		if(service.insert(vo) > 0) {
			mv.addObject("msg", "회원가입에 성공하였습니다. 로그인 후 이용해주세요");
			mv.setViewName("mytarget/mloginForm"); 
		} else {
			mv.addObject("msg", "회원가입에 실패하였습니다. 다시 시도해주세요");
			mv.setViewName("mytarget/mjoinForm");
		}
		return mv;
	} //minsert

	@RequestMapping(value="/minfo")
	public ModelAndView minfo(HttpServletRequest request,ModelAndView mv, BasicmVO vo) {
		
		HttpSession session = request.getSession(false);
		vo.setBasicm_id((String)session.getAttribute("loginID"));	// 로그인 아이디를 sql에 넘겨주기 위해서.
		
		vo = service.selectOne(vo);
		if(vo != null) {
			mv.addObject("mVO", vo);
			mv.setViewName("mybox/minfoForm");
		} else {
			mv.addObject("msg", "잘못된 접근입니다. 다시 시도해주세요");
			mv.setViewName("home");
		}
		return mv;
	} // minfo(사용자)
	
	@RequestMapping(value="/mupdate")	// frame 문제는 해결되었으나 메시지 출력 안됨
	public ModelAndView mupdate(ModelAndView mv, BasicmVO vo, RedirectAttributes rttr) {
		if(service.update(vo) > 0) {
			rttr.addFlashAttribute("msg", "정상적으로 수정되었습니다.");
		} else {
			rttr.addFlashAttribute("msg", "정보 수정에 실패하였습니다. 다시 시도해주세요");
		}
		mv.setViewName("redirect:minfo");
		return mv;
	} //mupdate
	
	@RequestMapping(value="/mdelete")	// frame 문제 해결, 에러상황은 확인 해보지 못함. 정상작동 시 frame, 메시지 출력 OK
	public ModelAndView mdelete(HttpServletRequest request, ModelAndView mv, BasicmVO vo, RedirectAttributes rttr) {
		HttpSession session = request.getSession(false);
		if(session != null && session.getAttribute("loginID") != null) {
			vo.setBasicm_id((String) session.getAttribute("loginID"));
			
			if(service.delete(vo)>0) {
				session.invalidate();
				mv.addObject("msg", "정상적으로 탈퇴되었습니다. 개인정보는 안전하게 삭제됩니다");
				mv.setViewName("home"); 
			} else {
				rttr.addFlashAttribute("msg", "회원 탈퇴에 실패하였습니다. 다시 시도해주세요");
				mv.setViewName("redirect:minfo");
			}
		} else {
			mv.addObject("msg", "잘못된 접근입니다. 다시 시도해주세요");
			mv.setViewName("home");
		}
		return mv;
	} //mdelete
}